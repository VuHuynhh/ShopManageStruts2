/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.validator.annotations.FieldExpressionValidator;
import com.opensymphony.xwork2.validator.annotations.RequiredStringValidator;
import com.opensymphony.xwork2.validator.annotations.ValidatorType;
import daos.UserDAO;
import dtos.UserDTO;
import java.util.Map;
import org.apache.struts2.ServletActionContext;

/**
 *
 * @author Dell
 */
public class UpdatePasswordAction extends ActionSupport {

    private static final String SUCCESS = "success";
    private static final String FAIL = "fail";
    private String password;
    private String newPassword;
    private String confirm;

    public String getPassword() {
        return password;
    }

    @RequiredStringValidator(type = ValidatorType.FIELD, message = "Password is required")
    public void setPassword(String password) {
        this.password = password;
    }

    public String getNewPassword() {
        return newPassword;
    }


    @RequiredStringValidator(type = ValidatorType.FIELD, message = "New password is required")
    public void setNewPassword(String newPassword) {
        this.newPassword = newPassword;
    }

    public String getConfirm() {
        return confirm;
    }

    @FieldExpressionValidator(expression = "confirm==newPassword", message = "Confirm must match password")
    public void setConfirm(String confirm) {
        this.confirm = confirm;
    }
    
    

    public UpdatePasswordAction() {
    }

    public String execute() throws Exception {
        String url = FAIL;
        try {
            if (password != null) {
                Map session = ActionContext.getContext().getSession();
                UserDTO user = (UserDTO) session.get("USER");
                if (user != null) {
                    UserDAO dao = new UserDAO();
                    String oldPassword = dao.getPassword(user.getId());
                    if (!oldPassword.isEmpty()) {
                        if (password.equals(oldPassword)) {
                            boolean check = dao.updatePassword(newPassword, user.getId());
                            if (check) {
                                session.put("USER", user);
                                ServletActionContext.getRequest().setAttribute("success", "Update password successful");
                                url = SUCCESS;
                            }
                        } else {
                            ServletActionContext.getRequest().setAttribute("error", "Old password is incorect");
                        }
                    }
                }
            }
        } catch (Exception e) {
            ServletActionContext.getServletContext().log("Error at UpdatePasswordController: " + e.getMessage());
        }
        return url;
    }

}
