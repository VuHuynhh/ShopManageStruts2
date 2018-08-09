/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.validator.annotations.RequiredStringValidator;
import com.opensymphony.xwork2.validator.annotations.ValidatorType;
import daos.UserDAO;
import dtos.UserDTO;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.ServletActionContext;

/**
 *
 * @author Dell
 */
public class LoginAction extends ActionSupport {

    private final String SUCCESS = "success";
    private final String FAIL = "fail";
    private String email;
    private String password;

    public LoginAction() {
    }

    public String getEmail() {
        return email;
    }

    @RequiredStringValidator(type = ValidatorType.FIELD, message = "Email is required")
    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    @RequiredStringValidator(type = ValidatorType.FIELD, message = "Password is required")
    public void setPassword(String password) {
        this.password = password;
    }

    public String execute() throws Exception {
        String url = FAIL;
        if (email != null && password != null) {
            UserDAO userDao = new UserDAO();
            UserDTO user = userDao.checkLogin(email, password);
            if (user != null) {
                Map session = ActionContext.getContext().getSession();
                session.put("USER", user);
                url = SUCCESS;
            } else {
                HttpServletRequest request = ServletActionContext.getRequest();
                request.setAttribute("error", "Invalid email or password");
            }

        }
        return url;
    }

}
