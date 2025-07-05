/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author he181
 */
public class HouseholdMember {
    private int memberId;
    private int householdId;
    private String relationship;
    private String cccd;

    public HouseholdMember() {
    }

    public HouseholdMember(int householdId, String relationship, String cccd) {
        this.householdId = householdId;
        this.relationship = relationship;
        this.cccd = cccd;
    }

    public HouseholdMember(int memberId, int householdId, String relationship, String cccd) {
        this.memberId = memberId;
        this.householdId = householdId;
        this.relationship = relationship;
        this.cccd = cccd;
    }

    public int getMemberId() {
        return memberId;
    }

    public void setMemberId(int memberId) {
        this.memberId = memberId;
    }

    public int getHouseholdId() {
        return householdId;
    }

    public void setHouseholdId(int householdId) {
        this.householdId = householdId;
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
    
    
}
