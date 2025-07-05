/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.util.ArrayList;
import model.HouseholdMember;
import java.sql.*;

/**
 *
 * @author he181
 */
public class HouseholdMemberDAO {

    public static HouseholdMember findByCccd(String memberCccd) {
        DBContext db = DBContext.getInstance();
        ArrayList<HouseholdMember> list = new ArrayList<>();
        String sql = """
                     SELECT [memberId]
                           ,[householdId]
                           ,[cccd]
                           ,[relationship]
                       FROM [dbo].[HouseholdMembers]
                       WHERE cccd = ? and [relationship] not in (?,?)""";
        try {
            PreparedStatement ps = db.connection.prepareStatement(sql);
            ps.setObject(1, memberCccd);
            ps.setString(2, "Tạm trú");
            ps.setString(3, "Lưu trú tạm thời");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                HouseholdMember hm = new HouseholdMember(rs.getInt("memberId"),
                        rs.getInt("householdId"),
                        rs.getString("relationship"),
                        rs.getString("cccd"));
                list.add(hm);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list.isEmpty() ? null : list.get(0);
    }

    public static void main(String[] args) {
        System.out.println(HouseholdMemberDAO.findByCccd("001204050461").getRelationship());
    }

    public static void insert(HouseholdMember hm2) {
        DBContext db = DBContext.getInstance();
        String sql = """
                     INSERT INTO [dbo].[HouseholdMembers]
                                ([householdId]
                                ,[cccd]
                                ,[relationship])
                          VALUES
                                (?
                                ,?
                                ,?)""";
        try {
            PreparedStatement ps = db.connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setObject(1, hm2.getHouseholdId());
            ps.setObject(2, hm2.getCccd());
            ps.setObject(3, hm2.getRelationship());
            ps.executeUpdate();
            ResultSet rs = ps.getGeneratedKeys();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static ArrayList<HouseholdMember> findByHouseholdId(int householdId) {
        DBContext db = DBContext.getInstance();
        ArrayList<HouseholdMember> list = new ArrayList<>();
        String sql = """
                     SELECT [memberId]
                           ,hm.[householdId]
                           ,[cccd]
                           ,[relationship]
                       FROM [dbo].[HouseholdMembers] hm
                       JOIN Households h on hm.householdId = h.householdId
                       WHERE h.householdId = ?""";
        try {
            PreparedStatement ps = db.connection.prepareStatement(sql);
            ps.setObject(1, householdId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                HouseholdMember hm = new HouseholdMember(rs.getInt("memberId"),
                        rs.getInt("householdId"),
                        rs.getString("relationship"),
                        rs.getString("cccd"));
                list.add(hm);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public static void delete(String cccd) {
        DBContext db = DBContext.getInstance();
        String sql = """
                     DELETE FROM [dbo].[HouseholdMembers]
                           WHERE cccd = ?""";

        try {
            PreparedStatement ps = db.connection.prepareStatement(sql);
            ps.setObject(1, cccd);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void update(HouseholdMember hm) {
        DBContext db = DBContext.getInstance();
        String sql = """
                     UPDATE [dbo].[HouseholdMembers]
                        SET 
                           [relationship] = ?
                      WHERE cccd = ?""";
        try {
            PreparedStatement ps = db.connection.prepareStatement(sql);
            ps.setObject(1, hm.getRelationship());
            ps.setObject(2, hm.getCccd());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    public static int countHeadOfHousehold(int householdId) {
        DBContext db = DBContext.getInstance();
        String sql = """
                 SELECT COUNT(relationship)
                 FROM [dbo].[HouseholdMembers]
                 WHERE relationship = ? AND householdId = ?""";

        try (PreparedStatement ps = db.connection.prepareStatement(sql)) {
            ps.setString(1, "Chủ hộ");
            ps.setInt(2, householdId);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public static HouseholdMember findHeadOfHousehold(int householdId) {
        DBContext db = DBContext.getInstance();
        ArrayList<HouseholdMember> list = new ArrayList<>();
        String sql = """
                     SELECT *
                       FROM [dbo].[HouseholdMembers]
                       WHERE relationship = ?  and householdId = ?""";
        try {
            PreparedStatement ps = db.connection.prepareStatement(sql);
            ps.setObject(1, "Chủ hộ");
            ps.setObject(2, householdId);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                HouseholdMember hm = new HouseholdMember(rs.getInt("householdId"),
                        rs.getString("relationship"),
                        rs.getString("cccd"));
                list.add(hm);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list.isEmpty() ? null : list.get(0);
    }

    public static HouseholdMember findByCccd(String cccd, String householdType) {
        DBContext db = DBContext.getInstance();
        ArrayList<HouseholdMember> list = new ArrayList<>();
        String sql = """
                     SELECT [memberId]
                           ,[householdId]
                           ,[cccd]
                           ,[relationship]
                       FROM [dbo].[HouseholdMembers]
                       WHERE cccd = ?  and relationship = ?""";
        try {
            PreparedStatement ps = db.connection.prepareStatement(sql);
            ps.setObject(1, cccd);
            ps.setString(2, householdType);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                HouseholdMember hm = new HouseholdMember(rs.getInt("memberId"),
                        rs.getInt("householdId"),
                        rs.getString("relationship"),
                        rs.getString("cccd"));
                list.add(hm);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list.isEmpty() ? null : list.get(0);

    }

    public static void delete(String cccd, String relationship) {
        DBContext db = DBContext.getInstance();
        String sql = """
                     DELETE FROM [dbo].[HouseholdMembers]
                           WHERE cccd = ? and relationship = ?""";

        try {
            PreparedStatement ps = db.connection.prepareStatement(sql);
            ps.setObject(1, cccd);
            ps.setObject(2, relationship);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static HouseholdMember findByCccd2(String memberCccd, String headOfHouseHoldCccd) {
        DBContext db = DBContext.getInstance();
        ArrayList<HouseholdMember> list = new ArrayList<>();
        String sql = """
                     SELECT  [memberId]
                           ,h.[householdId]
                     	  ,h.headOfHouseholdCccd
                           ,[cccd]
                           ,[relationship]
                       FROM [HouseHold].[dbo].[HouseholdMembers] hm
                       Join Households h on hm.householdId = h.householdId
                       WHERE cccd = ? and headOfHouseholdCccd = ? and  [relationship] not in (?,?)""";
        try {
            PreparedStatement ps = db.connection.prepareStatement(sql);
            ps.setObject(1, memberCccd);
            ps.setObject(2, headOfHouseHoldCccd);
            ps.setString(3, "Tạm trú");
            ps.setString(4, "Lưu trú tạm thời");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                HouseholdMember hm = new HouseholdMember(rs.getInt("memberId"),
                        rs.getInt("householdId"),
                        rs.getString("relationship"),
                        rs.getString("cccd"));
                list.add(hm);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list.isEmpty() ? null : list.get(0);
    }

}
