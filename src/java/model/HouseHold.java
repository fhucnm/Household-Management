/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author he181
 */
public class HouseHold {
   
    private int houseHoldId;
    private String headOfHouseHold;
    private int addressId;
    private String createDate;
    private String address;
    private String memberCccd;
    private String relationship;

    
    public HouseHold() {
    }

    public HouseHold(String headOfHouseHold, int addressId, String createDate) {
        this.headOfHouseHold = headOfHouseHold;
        this.addressId = addressId;
        this.createDate = createDate;
    }

    public HouseHold(int houseHoldId, String headOfHouseHold, int addressId, String createDate) {
        this.houseHoldId = houseHoldId;
        this.headOfHouseHold = headOfHouseHold;
        this.addressId = addressId;
        this.createDate = createDate;
    }

  

    public HouseHold(int houseHoldId, String headOfHouseHold, int addressId, String createDate, String address) {
        this.houseHoldId = houseHoldId;
        this.headOfHouseHold = headOfHouseHold;
        this.addressId = addressId;
        this.createDate = createDate;
        this.address = address;
    }

    
    public HouseHold(String headOfHouseHold, String createDate, int addressId, String memberCccd, String relationship) {
        this.headOfHouseHold = headOfHouseHold;
        this.createDate = createDate;
        this.addressId = addressId;
        this.memberCccd = memberCccd;
        this.relationship = relationship;
    }



    public int getHouseHoldId() {
        return houseHoldId;
    }

    public void setHouseHoldId(int houseHoldId) {
        this.houseHoldId = houseHoldId;
    }

    public String getHeadOfHouseHold() {
        return headOfHouseHold;
    }

    public void setHeadOfHouseHold(String headOfHouseHold) {
        this.headOfHouseHold = headOfHouseHold;
    }

    public int getAddressId() {
        return addressId;
    }

    public void setAddressId(int addressId) {
        this.addressId = addressId;
    }

    public String getCreateDate() {
        return createDate;
    }

    public void setCreateDate(String createDate) {
        this.createDate = createDate;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getmemberCccd() {
        return memberCccd;
    }

    public void setCccd(String memberCccd) {
        this.memberCccd = memberCccd;
    }

    public String getRelationship() {
        return relationship;
    }

    public void setRelationship(String relationship) {
        this.relationship = relationship;
    }

    public String getMemberCccd() {
        return memberCccd;
    }

    public void setMemberCccd(String memberCccd) {
        this.memberCccd = memberCccd;
    }
    
    
       
}
