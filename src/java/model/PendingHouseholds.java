/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author he181
 */
public class PendingHouseholds {
    private int pendingId;
    private String registrationId;
    private String headOfHouseholdCccd;
    private int addressId;
    private String relationship;
    private String cccd;
    private String createDate;

    public PendingHouseholds() {
    }

    public PendingHouseholds(String registrationId, String headOfHouseholdCccd, int addressId, String relationship, String cccd, String createDate) {
        this.registrationId = registrationId;
        this.headOfHouseholdCccd = headOfHouseholdCccd;
        this.addressId = addressId;
        this.relationship = relationship;
        this.cccd = cccd;
        this.createDate = createDate;
    }

    
    
    
    
   

    

    public int getPendingId() {
        return pendingId;
    }

    public void setPendingId(int pendingId) {
        this.pendingId = pendingId;
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

    public String getCreateDate() {
        return createDate;
    }

    public void setCreateDate(String createDate) {
        this.createDate = createDate;
    }
    
    
}
