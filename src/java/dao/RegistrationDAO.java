package dao;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import model.Registration;

public class RegistrationDAO {

    public static void insert(Registration reg) {
        DBContext db = DBContext.getInstance();
        String sql = """
                     INSERT INTO [dbo].[Registrations]
                                ([cccd]
                                ,[registrationType]
                                ,[startDate]
                                
                               )
                          VALUES
                                (?
                                ,?
                                ,?
                                )""";
        try {
            PreparedStatement ps = db.connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setObject(1, reg.getCccd());
            ps.setObject(2, reg.getRegistrationType());
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            java.util.Date utilDate = sdf.parse(reg.getStartDate());  // Chuyển thành java.util.Date
            java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());  // Chuyển thành java.sql.Date
            ps.setObject(3, reg.getStartDate());
            ps.executeUpdate();
            ResultSet rs = ps.getGeneratedKeys();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static ArrayList<Registration> findAllRegistrationIsPending() {
        ArrayList<Registration> list = new ArrayList<>();
        DBContext db = DBContext.getInstance();
        String sql = """
                      SELECT r.[registrationId]
                                                ,r.[cccd]
                                                ,[registrationType]
                                                ,[startDate]
                                                
                                                ,[status],
                                          	  ph.headOfHouseholdCccd,
                                          	  ph.relationship,
                                                ph.addressId
                                            FROM [dbo].[Registrations] r 
                                            LEFT JOIN PendingHouseHold ph on r.registrationId = ph.registrationId
                                            WHERE status = ?
                                             ORDER BY registrationId asc""";
        try {
            PreparedStatement ps = db.connection.prepareStatement(sql);
            ps.setString(1, "Đang chờ xử lý");
//            ps.setString(2, "Dài hạn");
//            ps.setString(3, "Tạm thời");
//            ps.setString(4, "Lưu trú tạm thời");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Registration reg = new Registration(rs.getString("registrationId"),
                        rs.getString("cccd"),
                        rs.getString("registrationType"),
                        rs.getString("startDate"),
                        rs.getString("status"),
                        rs.getString("headOfHouseholdCccd"),
                        rs.getString("relationship"),
                        rs.getInt("addressId"));

                list.add(reg);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public static void acceptById(String registrationId, String approvedBy) {
        DBContext db = DBContext.getInstance();
        String sql = """
                     UPDATE [dbo].[Registrations]
                        SET 
                           [status] = ?
                           ,[approvedBy] = ?
                           
                      WHERE registrationId = ?""";
        try {
            PreparedStatement ps = db.connection.prepareStatement(sql);
            ps.setString(1, "Đã được chấp thuận");
            ps.setString(2, approvedBy);
            ps.setString(3, registrationId);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
    
    public static ArrayList<Registration> findAllRegistrationIsApproveInAddressId(int addressId) {
        ArrayList<Registration> list = new ArrayList<>();
        DBContext db = DBContext.getInstance();
        String sql = """
                     SELECT r.[registrationId]
                                                                     ,r.[cccd]
                                                                     ,[registrationType]
                                                                     ,[startDate]
                                                                     
                                                                     ,[status],
                                                               	  ph.headOfHouseholdCccd,
                                                               	  ph.relationship,
                                                                     ph.addressId
                                                                 FROM [dbo].[Registrations] r 
                                                                 LEFT JOIN PendingHouseHold ph on r.registrationId = ph.registrationId
                                                                 WHERE status = ? and addressId = ?
                                                                  ORDER BY registrationId asc""";
        try {
            PreparedStatement ps = db.connection.prepareStatement(sql);
            ps.setString(1, "Đã được chấp thuận");
            ps.setInt(2, addressId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Registration reg = new Registration(rs.getString("registrationId"),
                        rs.getString("cccd"),
                        rs.getString("registrationType"),
                        rs.getString("startDate"),
                        rs.getString("status"));
                list.add(reg);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public static ArrayList<Registration> findAllRegistrationIsApprove() {
        ArrayList<Registration> list = new ArrayList<>();
        DBContext db = DBContext.getInstance();
        String sql = """
                     SELECT [registrationId]
                           ,[cccd]
                           ,[registrationType]
                           ,[startDate]
                           
                           ,[status]
                           
                           
                       FROM [dbo].[Registrations]
                       Where status = ?""";
        try {
            PreparedStatement ps = db.connection.prepareStatement(sql);
            ps.setString(1, "Đã được chấp thuận");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Registration reg = new Registration(rs.getString("registrationId"),
                        rs.getString("cccd"),
                        rs.getString("registrationType"),
                        rs.getString("startDate"),
                        rs.getString("status"));
                list.add(reg);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public static void reject(String registrationId, String comments) {
        DBContext db = DBContext.getInstance();
        String sql = """
                     UPDATE [dbo].[Registrations]
                        SET 
                           [status] = ?
                           ,[comments] = ?
                           
                      WHERE registrationId = ?""";
        try {
            PreparedStatement ps = db.connection.prepareStatement(sql);
            ps.setString(1, "Bị từ chối");
            ps.setString(2, comments);
            ps.setString(3, registrationId);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static ArrayList<Registration> findAllRegistrationIsRejectInAddressId(int addressId) {
        ArrayList<Registration> list = new ArrayList<>();
        DBContext db = DBContext.getInstance();
        String sql = """
                     SELECT r.[registrationId]
                                                                     ,r.[cccd]
                                                                     ,[registrationType]
                                                                     ,[startDate]
                                                                     
                                                                     ,[status],
                                                               	  ph.headOfHouseholdCccd,
                                                               	  ph.relationship,
                                                                     ph.addressId
                                                                 FROM [dbo].[Registrations] r 
                                                                 LEFT JOIN PendingHouseHold ph on r.registrationId = ph.registrationId
                                                                 WHERE status = ? and addressId = ?
                                                                  ORDER BY registrationId asc""";
        try {
            PreparedStatement ps = db.connection.prepareStatement(sql);
            ps.setString(1, "Bị từ chối");
            ps.setInt(2, addressId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Registration reg = new Registration(rs.getString("registrationId"),
                        rs.getString("cccd"),
                        rs.getString("registrationType"),
                        rs.getString("startDate"),
                        rs.getString("status"));
                list.add(reg);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public static ArrayList<Registration> findAllRegistrationIsReject() {
        ArrayList<Registration> list = new ArrayList<>();
        DBContext db = DBContext.getInstance();
        String sql = """
                     SELECT [registrationId]
                           ,[cccd]
                           ,[registrationType]
                           ,[startDate]
                           
                           ,[status]
                           
                           
                       FROM [dbo].[Registrations]
                       Where status = ?""";
        try {
            PreparedStatement ps = db.connection.prepareStatement(sql);
            ps.setString(1, "Bị từ chối");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Registration reg = new Registration(rs.getString("registrationId"),
                        rs.getString("cccd"),
                        rs.getString("registrationType"),
                        rs.getString("startDate"),
                        rs.getString("status"));
                list.add(reg);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public static ArrayList<Registration> findByCccd(String cccd) {
        DBContext db = DBContext.getInstance();
        ArrayList<Registration> list = new ArrayList<>();
        String sql = """
                     SELECT  [registrationId]
                           ,[cccd]
                           ,[registrationType]
                           ,[startDate]
                           ,[endDate]
                           ,[status]
                           ,[approvedBy]
                           ,[comments]
                       FROM [Household].[dbo].[Registrations]
                       WHERE cccd = ?
                        ORDER BY registrationId desc""";
        try {
            PreparedStatement ps = db.connection.prepareStatement(sql);
            ps.setObject(1, cccd);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Registration reg = new Registration(rs.getString("registrationId"),
                        rs.getString("cccd"),
                        rs.getString("registrationType"),
                        rs.getString("startDate"),
                        rs.getString("endDate"),
                        rs.getString("status"),
                        rs.getString("approvedBy"),
                        rs.getString("comments"));
                list.add(reg);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public static Registration findByRegId(String regId) {
        DBContext db = DBContext.getInstance();
        ArrayList<Registration> list = new ArrayList<>();
        String sql = """
                    SELECT r.*, h.headOfHouseholdCccd , u.fullName, h.householdId, h.addressId, hm.relationship
                                  FROM Registrations r
                                  JOIN Users u ON r.cccd = u.cccd
                                  LEFT JOIN HouseholdMembers hm ON hm.cccd = r.cccd
                                  LEFT JOIN Households h ON h.householdId = hm.householdId 
                                  WHERE r.registrationId = ?""";
        try {
            PreparedStatement ps = db.connection.prepareStatement(sql);
            ps.setObject(1, regId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Registration reg = new Registration(
                        rs.getString("registrationId"),
                        rs.getString("cccd"),
                        rs.getString("registrationType"),
                        rs.getString("startDate"),
                        rs.getString("status"),
                        rs.getString("approvedBy"),
                        rs.getString("comments"),
                        rs.getString("headOfHouseholdCccd"),
                        rs.getString("fullName"),
                        rs.getInt("householdId"),
                        rs.getInt("addressId"),
                        rs.getString("relationship")
                );
                list.add(reg);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list.get(0);
    }

    public static Registration findLastByCccd(String memberCccd) {
        DBContext db = DBContext.getInstance();
        ArrayList<Registration> list = new ArrayList<>();
        String sql = """
                     SELECT TOP 1 * 
                     FROM Registrations
                     WHERE cccd = ? and status = ?
                     ORDER BY registrationId DESC""";
        try {
            PreparedStatement ps = db.connection.prepareStatement(sql);
            ps.setObject(1, memberCccd);
            ps.setObject(2, "Đang chờ xử lý");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Registration reg = new Registration(rs.getString("registrationId"),
                        rs.getString("cccd"),
                        rs.getString("registrationType"),
                        rs.getString("startDate"),
                        rs.getString("status"));
                list.add(reg);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list.get(0);

    }

    public static ArrayList<Registration> findAllRegistrationIsPendingInAddressId(int addressId) {
        ArrayList<Registration> list = new ArrayList<>();
        DBContext db = DBContext.getInstance();
        String sql = """
                      SELECT r.[registrationId]
                                                ,r.[cccd]
                                                ,[registrationType]
                                                ,[startDate]
                                                
                                                ,[status],
                                          	  ph.headOfHouseholdCccd,
                                          	  ph.relationship,
                                                ph.addressId
                                            FROM [dbo].[Registrations] r 
                                            LEFT JOIN PendingHouseHold ph on r.registrationId = ph.registrationId
                                            WHERE status = ? and addressId = ?
                                             ORDER BY registrationId asc""";
        try {
            PreparedStatement ps = db.connection.prepareStatement(sql);
            ps.setString(1, "Đang chờ xử lý");
            ps.setInt(2, addressId);
//            ps.setString(2, "Dài hạn");
//            ps.setString(3, "Tạm thời");
//            ps.setString(4, "Lưu trú tạm thời");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Registration reg = new Registration(rs.getString("registrationId"),
                        rs.getString("cccd"),
                        rs.getString("registrationType"),
                        rs.getString("startDate"),
                        rs.getString("status"),
                        rs.getString("headOfHouseholdCccd"),
                        rs.getString("relationship"),
                        rs.getInt("addressId"));

                list.add(reg);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

   

}
