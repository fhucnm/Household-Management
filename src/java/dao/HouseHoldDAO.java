/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.util.ArrayList;
import model.HouseHold;
import java.sql.*;
import model.PendingHouseholds;

/**
 *
 * @author he181
 */
public class HouseHoldDAO {

    public static ArrayList<HouseHold> findAll() {
        DBContext db = DBContext.getInstance();
        ArrayList<HouseHold> list = new ArrayList<>();

        String sql = """
                     SELECT [householdId]
                           ,[headOfHouseholdCccd]
                           ,[addressId]
                           ,[createdDate]
                       FROM [Household].[dbo].[Households]""";
        try {
            PreparedStatement ps = db.connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                HouseHold h = new HouseHold(rs.getInt("householdId"),
                        rs.getString("headOfHouseholdCccd"),
                        rs.getInt("addressId"),
                        rs.getString("createdDate"));
                list.add(h);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public static void insertForPending(PendingHouseholds tempHouseHold) {
        DBContext db = DBContext.getInstance();
        String sql = """
                     INSERT INTO [dbo].[PendingHouseHold]
                                ([registrationId]
                                ,[headOfHouseholdCccd]
                                ,[addressId]
                                ,[relationship]
                                ,[cccd]
                                ,[createDate])
                          VALUES
                                (?
                                ,?
                                ,?
                                ,?
                                ,?
                                ,?)""";
        try {
            PreparedStatement ps = db.connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setObject(1, tempHouseHold.getRegistrationId());
            ps.setObject(2, tempHouseHold.getHeadOfHouseholdCccd());
            ps.setObject(3, tempHouseHold.getAddressId());
            ps.setObject(4, tempHouseHold.getRelationship());
            ps.setObject(5, tempHouseHold.getCccd());
            ps.setObject(6, tempHouseHold.getCreateDate());

            ps.executeUpdate();
            ResultSet rs = ps.getGeneratedKeys();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static HouseHold findByCccd(String headOfHouseHoldCccd) {
        DBContext db = DBContext.getInstance();
        ArrayList<HouseHold> list = new ArrayList<>();

        String sql = """
                     SELECT [householdId]
                                                ,[headOfHouseholdCccd]
                                                ,[addressId]
                                                ,[createdDate]
                                
                                            FROM [dbo].[Households] 
                                            
                                            WHERE headOfHouseholdCccd = ?""";
        try {
            PreparedStatement ps = db.connection.prepareStatement(sql);
            ps.setObject(1, headOfHouseHoldCccd);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                HouseHold h = new HouseHold(rs.getInt("householdId"),
                        rs.getString("headOfHouseholdCccd"),
                        rs.getInt("addressId"),
                        rs.getString("createdDate")
                );
                list.add(h);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list.isEmpty() ? null : list.get(0);
    }

    public static PendingHouseholds PendingHouseholdFindByRegId(String registrationId) {
        DBContext db = DBContext.getInstance();
        ArrayList<PendingHouseholds> list = new ArrayList<>();
        String sql = """
                     SELECT [pendingId]
                           ,[registrationId]
                           ,[headOfHouseholdCccd]
                           ,[addressId]
                           ,[relationship]
                           ,[cccd]
                           ,[createDate]
                       FROM [dbo].[PendingHousehold]
                       WHERE registrationId = ?""";
        try {
            PreparedStatement ps = db.connection.prepareStatement(sql);
            ps.setObject(1, registrationId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                PendingHouseholds ph = new PendingHouseholds(rs.getString("registrationId"),
                        rs.getString("headOfHouseholdCccd"),
                        rs.getInt("addressId"),
                        rs.getString("relationship"),
                        rs.getString("cccd"),
                        rs.getString("createDate"));
                list.add(ph);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list.get(0);
    }

    public static void insertHousehold(HouseHold h) {
        DBContext db = DBContext.getInstance();
        String sql = """
                     INSERT INTO [dbo].[Households]
                                ([headOfHouseholdCccd]
                                ,[addressId]
                                ,[createdDate])
                          VALUES
                                (?
                                ,?
                                ,?)""";

        try {
            PreparedStatement ps = db.connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setObject(1, h.getHeadOfHouseHold());
            ps.setObject(2, h.getAddressId());
            ps.setObject(3, h.getCreateDate());

            ps.executeUpdate();
            ResultSet rs = ps.getGeneratedKeys();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void updateAddress(String cccd, int addressId) {
        DBContext db = DBContext.getInstance();
        String sql = """
                     UPDATE [dbo].[Households]
                        SET 
                           [addressId] = ?
                           
                      WHERE headOfHouseholdCccd = ?""";
        try {
            PreparedStatement ps = db.connection.prepareStatement(sql);
            ps.setObject(1, addressId);
            ps.setObject(2, cccd);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static ArrayList<HouseHold> findAllInAddressId(int addressId) {
        DBContext db = DBContext.getInstance();
        ArrayList<HouseHold> list = new ArrayList<>();

        String sql = """
                     SELECT [householdId]
                           ,[headOfHouseholdCccd]
                           ,[addressId]
                           ,[createdDate]
                       FROM [Household].[dbo].[Households]
                     WHERE addressId = ?""";
        try {
            PreparedStatement ps = db.connection.prepareStatement(sql);
            ps.setInt(1, addressId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                HouseHold h = new HouseHold(rs.getInt("householdId"),
                        rs.getString("headOfHouseholdCccd"),
                        rs.getInt("addressId"),
                        rs.getString("createdDate"));
                list.add(h);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public static void delete(int householdId) {
        DBContext db = DBContext.getInstance();
        String sql = """
                     DELETE FROM [dbo].[Households]
                           WHERE householdId = ?""";
        try {
            PreparedStatement ps = db.connection.prepareStatement(sql);
            ps.setObject(1, householdId);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void updateHeadOfHousehold(String cccd, int householdId) {
        DBContext db = DBContext.getInstance();
        String sql = """
                     UPDATE [dbo].[Households]
                        SET [headOfHouseholdCccd] = ?
                           
                      WHERE householdId = ?""";
        
        try {
            PreparedStatement ps = db.connection.prepareStatement(sql);
            ps.setObject(1, cccd);
            ps.setObject(2, householdId);
            ps.executeUpdate();
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static HouseHold findByHouseholdID(int householdId) {
         DBContext db = DBContext.getInstance();
        ArrayList<HouseHold> list = new ArrayList<>();

        String sql = """
                     SELECT [householdId]
                           ,[headOfHouseholdCccd]
                           ,[addressId]
                           ,[createdDate]
                       FROM [Household].[dbo].[Households]
                     WHERE [householdId]= ?""";
        try {
            PreparedStatement ps = db.connection.prepareStatement(sql);
            ps.setInt(1, householdId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                HouseHold h = new HouseHold(rs.getInt("householdId"),
                        rs.getString("headOfHouseholdCccd"),
                        rs.getInt("addressId"),
                        rs.getString("createdDate"));
                list.add(h);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list.get(0);
    }

}
