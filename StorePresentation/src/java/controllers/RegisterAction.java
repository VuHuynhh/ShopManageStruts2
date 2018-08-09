/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.validator.annotations.EmailValidator;
import com.opensymphony.xwork2.validator.annotations.FieldExpressionValidator;
import com.opensymphony.xwork2.validator.annotations.RegexFieldValidator;
import com.opensymphony.xwork2.validator.annotations.RequiredStringValidator;
import com.opensymphony.xwork2.validator.annotations.StringLengthFieldValidator;
import com.opensymphony.xwork2.validator.annotations.Validations;
import com.opensymphony.xwork2.validator.annotations.ValidatorType;
import daos.UserDAO;
import dtos.UserDTO;
import org.apache.struts2.ServletActionContext;

/**
 *
 * @author Dell
 */
public class RegisterAction extends ActionSupport {

    private static final String SUCCESS = "success";
    private static final String FAIL = "fail";
    private String email, password, confirm, firstName, lastName, phone;
    private String exMess;

    public RegisterAction() {
    }

    public String getExMess() {
        return exMess;
    }

    public void setExMess(String exMess) {
        this.exMess = exMess;
    }

    public String getEmail() {
        return email;
    }

    @RequiredStringValidator(type = ValidatorType.FIELD, message = "Email is required")
    @EmailValidator(type = ValidatorType.FIELD, message = "Email is invalid")
    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    @Validations(
            requiredStrings = {
                @RequiredStringValidator(type = ValidatorType.FIELD,
                        message = "Password can't be blank!")
            },
            stringLengthFields = {
                @StringLengthFieldValidator(type = ValidatorType.FIELD,
                        minLength = "6",
                        message = "Password can't be less than 6 chars!")
            }
    )
    public void setPassword(String password) {
        this.password = password;
    }

    public String getConfirm() {
        return confirm;
    }

    @FieldExpressionValidator(expression = "confirm==password", message = "Confirm must match password")
    public void setConfirm(String confirm) {
        this.confirm = confirm;
    }

    public String getFirstName() {
        return firstName;
    }

    @RequiredStringValidator(type = ValidatorType.FIELD, message = "First name is required")
    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    @RequiredStringValidator(type = ValidatorType.FIELD, message = "Last name is required")
    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getPhone() {
        return phone;
    }
    
    @RequiredStringValidator(type = ValidatorType.FIELD, message = "Phone is required")
    @RegexFieldValidator(type = ValidatorType.FIELD, message = "Phone number must be 10 character", regex = "^[0-9]{10}$")
    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String execute() throws Exception {
        String url = FAIL;
        try {
            if (email != null && password != null && firstName != null && lastName != null && phone != null) {
                UserDAO userDao = new UserDAO();
                int id = userDao.getUserId() + 1;
                UserDTO user = new UserDTO(id, email, password, firstName, lastName, phone);
                boolean check = userDao.createAccount(user);
                if (check) {
                    url = SUCCESS;
                }
            }
        } catch (Exception e) {
            if (e.getMessage().contains("duplicate")) {
                exMess = e.getMessage();
            }
            ServletActionContext.getServletContext().log("Error at RegisterAction: " + e.getMessage()); 
        }
        return url;
    }

    

}
