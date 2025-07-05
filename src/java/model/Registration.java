/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.ArrayList;

/**
 *
 * @author he181
 */
public class Registration {

    private String registrationId;
    private String cccd;
    private String registrationType;
    private String startDate;
    private String endDate;
    private String status;
    private String approvedBy;
    private String comments;

    //cho in ra chi tiet
    private String headOfHouseholdCccd;
    private String fullName;
    private int householdId;
    private int addressId;
    private String relationship;

    public Registration() {
    }

    public Registration(String registrationType, String startDate, String headOfHouseholdCccd, int addressId) {
        this.registrationType = registrationType;
        this.startDate = startDate;
        this.headOfHouseholdCccd = headOfHouseholdCccd;
        this.addressId = addressId;
    }

     public Registration(String registrationId, String cccd, String registrationType, String startDate, String status, String headOfHouseholdCccd, String relationship, int addressId) {
        this.registrationId = registrationId;
        this.cccd = cccd;
        this.registrationType = registrationType;
        this.startDate = startDate;
        this.status = status;
        this.headOfHouseholdCccd = headOfHouseholdCccd;
        this.relationship = relationship;
        this.addressId = addressId;
    }
    public Registration(String registrationId, String cccd, String registrationType, String startDate, String status, String headOfHouseholdCccd, String relationship) {
        this.registrationId = registrationId;
        this.cccd = cccd;
        this.registrationType = registrationType;
        this.startDate = startDate;
        this.status = status;
        this.headOfHouseholdCccd = headOfHouseholdCccd;
        this.relationship = relationship;
    }
    
    

    public Registration(String registrationId, String cccd, String registrationType, String startDate, String status, String approvedBy, String comments, String headOfHouseholdCccd, String fullName, int householdId, int addressId, String relationship) {
        this.registrationId = registrationId;
        this.cccd = cccd;
        this.registrationType = registrationType;
        this.startDate = startDate;
        this.status = status;
        this.approvedBy = approvedBy;
        this.comments = comments;
        this.headOfHouseholdCccd = headOfHouseholdCccd;
        this.fullName = fullName;
        this.householdId = householdId;
        this.addressId = addressId;
        this.relationship = relationship;
    }

    public Registration(String registrationId, String cccd, String registrationType, String startDate, String status) {
        this.registrationId = registrationId;
        this.cccd = cccd;
        this.registrationType = registrationType;
        this.startDate = startDate;
        this.status = status;
    }

    public Registration(String registrationId, String cccd, String registrationType, String startDate, String endDate, String status, String approvedBy, String comments) {
        this.registrationId = registrationId;
        this.cccd = cccd;
        this.registrationType = registrationType;
        this.startDate = startDate;
        this.endDate = endDate;
        this.status = status;
        this.approvedBy = approvedBy;
        this.comments = comments;
    }

    public Registration(String cccd, String registrationType, String startDate) {
        this.cccd = cccd;
        this.registrationType = registrationType;
        this.startDate = startDate;
    }

    public String getRegistrationId() {
        return registrationId;
    }

    public void setRegistrationId(String registrationId) {
        this.registrationId = registrationId;
    }

    public String getHeadOfHouseholdCccd() {
        return headOfHouseholdCccd;
    }

    public void setHeadOfHouseholdCccd(String headOfHouseholdCccd) {
        this.headOfHouseholdCccd = headOfHouseholdCccd;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public int getHouseholdId() {
        return householdId;
    }

    public void setHouseholdId(int householdId) {
        this.householdId = householdId;
    }

    public int getAddressId() {
        return addressId;
    }

    public void setAddressId(int addressId) {
        this.addressId = addressId;
    }

    public String getRelationship() {
        return relationship;
    }

    public void setRelationship(String relationship) {
        this.relationship = relationship;
    }

    public String getCccd() {
        return cccd;
    }

    public void setCccd(String cccd) {
        this.cccd = cccd;
    }

    public String getRegistrationType() {
        return registrationType;
    }

    public void setRegistrationType(String registrationType) {
        this.registrationType = registrationType;
    }

    public String getStartDate() {
        return startDate;
    }

    public void setStartDate(String startDate) {
        this.startDate = startDate;
    }

    public String getEndDate() {
        return endDate;
    }

    public void setEndDate(String endDate) {
        this.endDate = endDate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getApprovedBy() {
        return approvedBy;
    }

    public void setApprovedBy(String approvedBy) {
        this.approvedBy = approvedBy;
    }

    public String getComments() {
        return comments;
    }

    public void setComments(String comments) {
        this.comments = comments;
    }

}
