/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import model.User;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

/**
 *
 * @author he181
 */
public class UserDAO {

    public static ArrayList<User> findAll() {
        DBContext db = DBContext.getInstance();
        ArrayList<User> list = new ArrayList<>();
        try {
            String sql = """
                     SELECT [cccd]
                             ,[fullName]
                             ,[birthday]
                             ,[email]
                             ,[phoneNumber]
                             ,[gender]
                             ,[password]
                             ,[roleID]
                             ,[addressID]
                         FROM [Household].[dbo].[Users]
                       """;
            PreparedStatement statement = db.connection.prepareStatement(sql);

            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                User user = new User(rs.getString("cccd"),
                        rs.getString("fullName"),
                        rs.getString("birthday"),
                        rs.getString("email"),
                        rs.getString("phoneNumber"),
                        rs.getString("gender"),
                        rs.getString("Password"),
                        rs.getInt("RoleID"),
                        rs.getInt("AddressID"));
                list.add(user);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;

    }

    public static User findAndJoinByCccdAndPassword(String cccd, String password) {
        DBContext db = DBContext.getInstance();
        ArrayList<User> list = new ArrayList<>();
        String sql = """
                     SELECT u.*, r.roleName, 
                                             CONCAT(a.street, ' - ', a.ward, ' - ', a.district, ' - ', a.city) AS address
                                      FROM Users u
                                      JOIN Roles r ON u.roleID = r.roleID
                                      JOIN Address a ON u.addressID = a.addressID
                      Where u.cccd = ? and password = ?""";
        try {
            PreparedStatement statement = db.connection.prepareStatement(sql);
            statement.setObject(1, cccd);
            statement.setObject(2, password);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                User user = new User(rs.getString("cccd"),
                        rs.getString("fullName"),
                        rs.getString("birthday"),
                        rs.getString("email"),
                        rs.getString("phoneNumber"),
                        rs.getString("gender"),
                        rs.getString("password"),
                        rs.getInt("roleId"),
                        rs.getInt("addressId"),
                        rs.getString("address"),
                        rs.getString("roleName"),
                        rs.getBoolean("isActive"));

                list.add(user);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list.isEmpty() ? null : list.get(0);
    }

    public static User findByCccdAndPassword(String cccd, String password) {
        DBContext db = DBContext.getInstance();
        ArrayList<User> list = new ArrayList<>();
        try {
            String sql = """
                     SELECT [cccd]
                             ,[fullName]
                             ,[birthday]
                             ,[email]
                             ,[phoneNumber]
                             ,[gender]
                             ,[password]
                             ,[roleID]
                             ,[addressID]
                         FROM [Household].[dbo].[Users]
                       WHERE [cccd] = ? and [password] = ?""";
            PreparedStatement statement = db.connection.prepareStatement(sql);
            statement.setString(1, cccd);
            statement.setString(2, password);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                User user = new User(rs.getString("cccd"),
                        rs.getString("fullName"),
                        rs.getString("birthday"),
                        rs.getString("email"),
                        rs.getString("phoneNumber"),
                        rs.getString("gender"),
                        rs.getString("Password"),
                        rs.getInt("RoleID"),
                        rs.getInt("AddressID"));
                list.add(user);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list.isEmpty() ? null : list.get(0);

    }

    public static ArrayList<User> findAllUser() {
        DBContext db = DBContext.getInstance();
        ArrayList<User> users = new ArrayList<>();
        String sql = "SELECT u.*, r.roleName, "
                + "CONCAT(a.street, ' - ', a.ward, ' - ', a.district, ' - ', a.city) AS address "
                + "FROM Users u "
                + "JOIN Roles r ON u.roleID = r.roleId "
                + "JOIN Address a ON u.addressID = a.addressId";

        try (
                PreparedStatement ps = db.connection.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                User user = new User();
                user.setCccd(rs.getString("cccd"));
                user.setFullName(rs.getString("fullName"));
                user.setBirthday(rs.getString("birthday"));
                user.setEmail(rs.getString("email"));
                user.setPhoneNumber(rs.getString("phoneNumber"));
                user.setGender(rs.getString("gender"));
                user.setRoleId(rs.getInt("roleID"));
                user.setRoleName(rs.getString("roleName"));
                user.setAddress(rs.getString("address"));
                users.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return users;
    }

    public static ArrayList<User> findByKeywords(String keywords) {
        DBContext db = DBContext.getInstance();
        ArrayList<User> list = new ArrayList<>();
        String sql = """
                     SELECT u.*, r.roleName,  
                            CONCAT(a.street, ' - ', a.ward, ' - ', a.district, ' - ', a.city) AS address  
                     FROM Users u  
                     JOIN Roles r ON u.roleID = r.roleId  
                     JOIN Address a ON u.addressID = a.addressId  
                     WHERE cccd = ?
                        OR u.fullName LIKE ?  
                        OR r.roleName LIKE ?  
                        OR CONCAT(a.street, ' - ', a.ward, ' - ', a.district, ' - ', a.city) LIKE ?""";
        try {
            PreparedStatement statement = db.connection.prepareStatement(sql);
            statement.setObject(1, keywords);
            String keySearch = "%" + keywords + "%";
            statement.setObject(2, keySearch);
            statement.setObject(3, keySearch);
            statement.setObject(4, keySearch);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                User user = new User();
                user.setCccd(rs.getString("cccd"));
                user.setFullName(rs.getString("fullName"));
                user.setBirthday(rs.getString("birthday"));
                user.setEmail(rs.getString("email"));
                user.setPhoneNumber(rs.getString("phoneNumber"));
                user.setGender(rs.getString("gender"));
                user.setRoleId(rs.getInt("roleID"));
                user.setRoleName(rs.getString("roleName"));
                user.setAddress(rs.getString("address"));
                list.add(user);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public static void insert(User user) {
        DBContext db = DBContext.getInstance();
        ArrayList<User> list = new ArrayList<>();
        String sql = """
                     INSERT INTO [dbo].[Users]
                                ([cccd]
                                ,[fullName]
                                ,[birthday]
                                ,[email]
                                ,[phoneNumber]
                                ,[gender]
                                ,[password]
                                ,[roleID]
                                ,[addressID])
                          VALUES
                                (?
                                ,?
                                ,?
                                ,?
                                ,?
                                ,?
                                ,?
                                ,?
                                ,?)""";
        try {
            PreparedStatement statement = db.getConnection().prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            statement.setObject(1, user.getCccd());
            statement.setObject(2, user.getFullName());
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            java.util.Date utilDate = sdf.parse(user.getBirthday());  // Chuyển thành java.util.Date
            java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());  // Chuyển thành java.sql.Date

            statement.setObject(3, sqlDate);
            statement.setObject(4, user.getEmail());
            statement.setObject(5, user.getPhoneNumber());
            statement.setObject(6, user.getGender());
            statement.setObject(7, user.getPassword());
            statement.setObject(8, user.getRoleId());
            statement.setObject(9, user.getAddressId());

            statement.executeUpdate();
            ResultSet rs = statement.getGeneratedKeys();
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    public static void update(User user) {
        DBContext db = DBContext.getInstance();
        String sql = """
                     UPDATE [dbo].[Users]
                        SET
                           [fullName] = ?
                           ,[birthday] = ?
                           ,[email] = ?
                           ,[phoneNumber] = ?
                           ,[gender] = ?
                           ,[password] = ?
                           ,[roleID] = ?
                           ,[addressID] = ?
                      WHERE [cccd] = ?""";
        try {
            PreparedStatement statement = db.connection.prepareStatement(sql);
            statement.setObject(1, user.getFullName());
            statement.setObject(2, user.getBirthday());
            statement.setObject(3, user.getEmail());
            statement.setObject(4, user.getPhoneNumber());
            statement.setObject(5, user.getGender());
            statement.setObject(6, user.getPassword());
            statement.setObject(7, user.getRoleId());
            statement.setObject(8, user.getAddressId());
            statement.setObject(9, user.getCccd());
            statement.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void delete(String cccd) {
        DBContext db = DBContext.getInstance();
        String sql = """
                     DELETE FROM [dbo].[Users]
                           WHERE cccd = ?""";
        try {
            PreparedStatement statement = db.connection.prepareStatement(sql);
            statement.setObject(1, cccd);
            statement.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Kiểm tra email đã tồn tại chưa (ngoại trừ chính người dùng đang cập nhật)
    public static boolean checkEmailExists(String email, String cccd) {
        DBContext db = DBContext.getInstance();
        String sql = "SELECT COUNT(*) FROM Users WHERE email = ? AND cccd <> ?";
        try {
            PreparedStatement statement = db.connection.prepareStatement(sql);
            statement.setObject(1, email);
            statement.setObject(2, cccd);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) > 0; // Trả về true nếu email đã tồn tại
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    // Kiểm tra số điện thoại đã tồn tại chưa (ngoại trừ chính người dùng đang cập nhật)
    public static boolean checkPhoneExists(String phone, String cccd) {
        DBContext db = DBContext.getInstance();
        String sql = "SELECT COUNT(*) FROM Users WHERE phoneNumber = ? AND cccd <> ?";
        try {
            PreparedStatement statement = db.connection.prepareStatement(sql);
            statement.setObject(1, phone);
            statement.setObject(2, cccd);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) > 0; // Trả về true nếu số điện thoại đã tồn tại
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    // Cập nhật chỉ email và số điện thoại của người dùng
    public static void updateContactInfo(String cccd, String email, String phoneNumber) {
        DBContext db = DBContext.getInstance();
        String sql = """
                     UPDATE [dbo].[Users]
                        SET [email] = ?, 
                            [phoneNumber] = ?
                      WHERE [cccd] = ?""";
        try {
            PreparedStatement statement = db.connection.prepareStatement(sql);
            statement.setObject(1, email);
            statement.setObject(2, phoneNumber);
            statement.setObject(3, cccd);
            statement.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void changePassword(String cccd, String newPassword) {
        DBContext db = DBContext.getInstance();
        String sql = """
                     UPDATE [dbo].[Users]
                        SET 
                           [password] = ?
                         
                      WHERE cccd = ?""";
        try {
            PreparedStatement ps = db.connection.prepareStatement(sql);
            ps.setObject(1, newPassword);
            ps.setObject(2, cccd);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static ArrayList<User> findAllUserByAddressId(int addressId) {
        DBContext db = DBContext.getInstance();
        ArrayList<User> list = new ArrayList<>();
        String sql = """
                     SELECT u.*, r.roleName, 
                                     CONCAT(a.street, ' - ', a.ward, ' - ', a.district, ' - ', a.city) AS address 
                                     FROM Users u 
                                     JOIN Roles r ON u.roleID = r.roleId 
                                     JOIN Address a ON u.addressID = a.addressId
                     \t\t\t\tWhere a.addressId = ?""";
        try {
            PreparedStatement ps = db.connection.prepareStatement(sql);
            ps.setObject(1, addressId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                User user = new User();
                user.setCccd(rs.getString("cccd"));
                user.setFullName(rs.getString("fullName"));
                user.setBirthday(rs.getString("birthday"));
                user.setEmail(rs.getString("email"));
                user.setPhoneNumber(rs.getString("phoneNumber"));
                user.setGender(rs.getString("gender"));
                user.setRoleId(rs.getInt("roleID"));
                user.setRoleName(rs.getString("roleName"));
                user.setAddress(rs.getString("address"));
                user.setAddressId(addressId);
                list.add(user);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public static ArrayList<User> findByKeywordsInAddressId(String keywords, int addressId) {
        DBContext db = DBContext.getInstance();
        ArrayList<User> list = new ArrayList<>();
        String sql = """
                     SELECT u.*, r.roleName,  
                                                 CONCAT(a.street, ' - ', a.ward, ' - ', a.district, ' - ', a.city) AS address  
                                          FROM Users u  
                                          JOIN Roles r ON u.roleID = r.roleId  
                                          JOIN Address a ON u.addressID = a.addressId  
                                          WHERE (cccd = ?
                     						OR	u.fullName LIKE ?  
                                             OR r.roleName LIKE ?) and a.addressId = ?""";
        try {
            PreparedStatement ps = db.connection.prepareStatement(sql);
            ps.setObject(4, addressId);
            ps.setObject(1, keywords);
            String keySearch = "%" + keywords + "%";
            ps.setObject(2, keySearch);
            ps.setObject(3, keySearch);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                User user = new User();
                user.setCccd(rs.getString("cccd"));
                user.setFullName(rs.getString("fullName"));
                user.setBirthday(rs.getString("birthday"));
                user.setEmail(rs.getString("email"));
                user.setPhoneNumber(rs.getString("phoneNumber"));
                user.setGender(rs.getString("gender"));
                user.setRoleId(rs.getInt("roleID"));
                user.setRoleName(rs.getString("roleName"));
                user.setAddress(rs.getString("address"));

                list.add(user);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public static User findByCccd(String cccd) {
        DBContext db = DBContext.getInstance();
        ArrayList<User> list = new ArrayList<>();
        String sql = """
                     SELECT  [cccd]
                           ,[fullName]
                           ,[birthday]
                           ,[email]
                           ,[phoneNumber]
                           ,[gender]
                           ,[password]
                           ,[roleID]
                           ,[addressID]
                           ,[isActive]
                       FROM [Household].[dbo].[Users]
                       WHere cccd = ?""";
        try {
            PreparedStatement ps = db.connection.prepareStatement(sql);
            ps.setString(1, cccd);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                User user = new User(rs.getString("cccd"),
                        rs.getString("fullName"),
                        rs.getString("birthday"),
                        rs.getString("email"),
                        rs.getString("phoneNumber"),
                        rs.getString("gender"),
                        rs.getString("password"),
                        rs.getInt("roleID"),
                        rs.getInt("addressID"),
                        rs.getBoolean("isActive"));

                list.add(user);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list.isEmpty() ? null : list.get(0);
    }

    public static void activeAccount(String cccd, String password) {
        DBContext db = DBContext.getInstance();
        String sql = "UPDATE [dbo].[Users]\n"
                + "   SET \n"
                + "      [password] = ?\n"
                + "      \n"
                + "      ,[isActive] = ?\n"
                + " WHERE cccd = ?";
        try {
            PreparedStatement ps = db.connection.prepareStatement(sql);
            ps.setString(1, password);
            ps.setBoolean(2, true);
            ps.setString(3, cccd);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
