/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import com.opensymphony.xwork2.ActionContext;
import daos.UserDAO;
import dtos.UserDTO;
import java.util.Map;
import org.apache.struts2.ServletActionContext;

/**
 *
 * @author Dell
 */
public class UpdateProfileAction {

    private static final String SUCCESS = "success";
    private static final String FAIL = "fail";
    private String firstName;
    private String lastName;
    private String phone;

    public UpdateProfileAction() {
    }

    public String execute() throws Exception {
        String url = FAIL;
        try {
            if (firstName != null && lastName != null && phone != null) {
                Map session = ActionContext.getContext().getSession();
                UserDTO user = (UserDTO) session.get("USER");
                if (user != null) {
                    UserDAO dao = new UserDAO();
                    boolean check = dao.updateUserProfile(firstName, lastName, phone, user.getId());
                    if (check) {
                        user.setFirstName(firstName);
                        user.setLastName(lastName);
                        user.setPhone(phone);
                        session.put("USER", user);
                        ServletActionContext.getRequest().setAttribute("success", "Profile has been update succesfully");
                        url = SUCCESS;
                    }
                }
            }
        } catch (Exception e) {
            ServletActionContext.getServletContext().log("Error at UpdateProfileController: " + e.getMessage());
            ServletActionContext.getServletContext().setAttribute("error", "Update failed, try again !");
        }
        return url;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

}
