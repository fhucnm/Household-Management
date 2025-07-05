/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author he181
 */
public class User {

    private String cccd;
    private String fullName;
    private String birthday;
    private String email;
    private String phoneNumber;
    private String gender;
    private String password;
    private int roleId;
    private int addressId;
    private String address;
    private String roleName;
    private Boolean isActive;
    public User() {
          
    }

    public Boolean getIsActive() {
        return isActive;
    }

    public void setIsActive(Boolean isActive) {
        this.isActive = isActive;
    }
    

    public User(String cccd, String fullName, String birthday, String email, String phoneNumber, String gender, String password, int roleId, int addressId) {
        this.cccd = cccd;
        this.fullName = fullName;
        this.birthday = birthday;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.gender = gender;
        this.password = password;
        this.roleId = roleId;
        this.addressId = addressId;
    }

    public User(String cccd, String fullName, String birthday, String email, String phoneNumber, String gender, String password, int roleId, int addressId, String address, String roleName) {
        this.cccd = cccd;
        this.fullName = fullName;
        this.birthday = birthday;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.gender = gender;
        this.password = password;
        this.roleId = roleId;
        this.addressId = addressId;
        this.address = address;
        this.roleName = roleName;
    }
    public User(String cccd, String fullName, String birthday, String email, String phoneNumber, String gender, String password, int roleId, int addressId, String address, String roleName, Boolean isActive) {
        this.cccd = cccd;
        this.fullName = fullName;
        this.birthday = birthday;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.gender = gender;
        this.password = password;
        this.roleId = roleId;
        this.addressId = addressId;
        this.address = address;
        this.roleName = roleName;
        this.isActive = isActive;
    }

    public User(String cccd, String fullName, String birthday, String email, String phoneNumber, String gender, String password, int roleId, int addressId, Boolean isActive) {
        this.cccd = cccd;
        this.fullName = fullName;
        this.birthday = birthday;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.gender = gender;
        this.password = password;
        this.roleId = roleId;
        this.addressId = addressId;
        this.isActive = isActive;
    }
    
    

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public String getCccd() {
        return cccd;
    }

    public void setCccd(String cccd) {
        this.cccd = cccd;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getRoleId() {
        return roleId;
    }

    public void setRoleId(int roleId) {
        this.roleId = roleId;
    }

    public int getAddressId() {
        return addressId;
    }

    public void setAddressId(int addressId) {
        this.addressId = addressId;
    }

}
