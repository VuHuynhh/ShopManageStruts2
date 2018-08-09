/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package filters;

import dtos.UserDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Dell
 */
public class AuthFilter implements Filter {

    private static final boolean debug = true;
    private FilterConfig filterConfig = null;

    private final List<String> guest;
    private final List<String> user;
    private final List<String> admin;

    public AuthFilter() {
        guest = new ArrayList<>();
        guest.add("404.jsp");
        guest.add("contact.jsp");
        guest.add("shop-login.jsp");
        guest.add("shop-register.jsp");
        guest.add("register");
        guest.add("register.action");
        guest.add("Login");
        guest.add("Login.action");
        guest.add("Logout");
        guest.add("Logout.action");
        guest.add("home");
        guest.add("home.action");
        guest.add("shop.jsp");
        guest.add("single-product.jsp");
        guest.add("LoadProduct");
        guest.add("LoadProduct.action");
        guest.add("ViewProduct");
        guest.add("ViewProduct.action");
        guest.add("shop-cart.jsp");
        guest.add("AddToCart");
        guest.add("AddToCart.action");
        guest.add("DeleteItemAction");
        guest.add("DeleteItemAction.action");
        guest.add("UpdateCart");
        guest.add("UpdateCart.action");
        guest.add("CheckOut");
        guest.add("CheckOut.action");
        guest.add("SearchProduct");
        guest.add("SearchProduct.action");
        guest.add("");

        user = new ArrayList<>();
        user.add("404.jsp");
        user.add("contact.jsp");
        user.add("Logout");
        user.add("Logout.action");
        user.add("profile.jsp");
        user.add("single-product.jsp");
        user.add("view-history.jsp");
        user.add("index.jsp");
        user.add("home");
        user.add("home.action");
        user.add("shop.jsp");
        user.add("LoadProduct");
        user.add("LoadProduct.action");
        user.add("ViewProduct");
        user.add("ViewProduct.action");
        user.add("shop-cart.jsp");
        user.add("AddToCart");
        user.add("AddToCart.action");
        user.add("DeleteItemAction");
        user.add("DeleteItemAction.action");
        user.add("UpdateCart");
        user.add("UpdateCart.action");
        user.add("CheckOut");
        user.add("CheckOut.action");
        user.add("shop-checkout.jsp");
        user.add("UpdateProfile");
        user.add("UpdateProfile.action");
        user.add("UpdatePassword");
        user.add("UpdatePassword.action");
        user.add("CheckHistory");
        user.add("CheckHistory.action");
        user.add("SearchProduct");
        user.add("SearchProduct.action");
        user.add("DeleteHistory");
        user.add("DeleteHistory.action");
        user.add("");

        admin = new ArrayList<>();
        admin.add("404.jsp");
        admin.add("manage-product.jsp");
        admin.add("edit-product.jsp");
        admin.add("add-product.jsp");
        admin.add("upload-image.jsp");
        admin.add("view-user.jsp");
        admin.add("UploadImage");
        admin.add("UploadImage.action");
        admin.add("ViewUser");
        admin.add("ViewUser.action");
        admin.add("BanUser");
        admin.add("BanUser.action");
        admin.add("RestoreUser");
        admin.add("RestoreUser.action");
        admin.add("ViewImageAction");
        admin.add("ViewImageAction.action");
        admin.add("CreateProduct");
        admin.add("CreateProduct.action");
        admin.add("ManageProduct");
        admin.add("ManageProduct.action");
        admin.add("DeleteProduct");
        admin.add("DeleteProduct.action");
        admin.add("EditProduct");
        admin.add("EditProduct.action");
        admin.add("UpdateProduct");
        admin.add("UpdateProduct.action");
        admin.add("SearchManage");
        admin.add("SearchManage.action");
        admin.add("");
    }
    //there are 2 ways to call the action, and that's action or
    //actionName.action, so we need to add both of them.

    /**
     *
     * @param request The servlet request we are processing
     * @param response The servlet response we are creating
     * @param chain The filter chain we are processing
     *
     * @exception IOException if an input/output error occurs
     * @exception ServletException if a servlet error occurs
     */
    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;

        String uri = req.getRequestURI();
        if (uri.endsWith(".jsp") || !uri.contains(".") || uri.contains("action")) {

            int index = uri.lastIndexOf("/");
            String resource = uri.substring(index + 1);

            HttpSession session = req.getSession(false);
            if (session == null || session.getAttribute("USER") == null) {
                //not login
                if (guest.contains(resource)) {
                    chain.doFilter(request, response);
                } else {
                    res.sendRedirect("404.jsp");
                }
            } else {
                //logined
                UserDTO userDTO = (UserDTO) session.getAttribute("USER");
                if (userDTO.getRoleId() == 2 && user.contains(resource)) {
                    chain.doFilter(request, response);
                } else if (userDTO.getRoleId() == 1) {
                    if (admin.contains(resource) || user.contains(resource)) {
                        chain.doFilter(request, response);
                    } else {
                        res.sendRedirect("404.jsp");
                    }
                } else {
                    res.sendRedirect("404.jsp");
                }
            }
        } else {
            chain.doFilter(request, response);
        }

    }

    /**
     * Return the filter configuration object for this filter.
     */
    public FilterConfig getFilterConfig() {
        return (this.filterConfig);
    }

    /**
     * Set the filter configuration object for this filter.
     *
     * @param filterConfig The filter configuration object
     */
    public void setFilterConfig(FilterConfig filterConfig) {
        this.filterConfig = filterConfig;
    }

    /**
     * Destroy method for this filter
     */
    public void destroy() {
    }

    /**
     * Init method for this filter
     */
    public void init(FilterConfig filterConfig) {
        this.filterConfig = filterConfig;
        if (filterConfig != null) {
            if (debug) {
                log("AuthFilter:Initializing filter");
            }
        }
    }

    /**
     * Return a String representation of this object.
     */
    @Override
    public String toString() {
        if (filterConfig == null) {
            return ("AuthFilter()");
        }
        StringBuffer sb = new StringBuffer("AuthFilter(");
        sb.append(filterConfig);
        sb.append(")");
        return (sb.toString());
    }


    public static String getStackTrace(Throwable t) {
        String stackTrace = null;
        try {
            StringWriter sw = new StringWriter();
            PrintWriter pw = new PrintWriter(sw);
            t.printStackTrace(pw);
            pw.close();
            sw.close();
            stackTrace = sw.getBuffer().toString();
        } catch (Exception ex) {
        }
        return stackTrace;
    }

    public void log(String msg) {
        filterConfig.getServletContext().log(msg);
    }

}
