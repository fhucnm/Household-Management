/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.util.ArrayList;
import model.Role;
import java.sql.*;
/**
 *
 * @author he181
 */
public class RoleDAO {
    public static ArrayList<Role> findAll(){
        DBContext db = DBContext.getInstance();
        ArrayList<Role> list = new ArrayList<>();
        try {
            String sql = """
                         SELECT [roleId]
                               ,[roleName]
                           FROM [Household].[dbo].[Roles]""";
            PreparedStatement statement = db.connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while(rs.next()){
                Role role = new Role(rs.getInt("roleId"), rs.getString("roleName"));
                list.add(role);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
    
    public static Role findByRoleId(int roleId){
        DBContext db = DBContext.getInstance();
        ArrayList<Role> list = new ArrayList<>();
        try {
            String sql = """
                         SELECT [roleId]
                               ,[roleName]
                           FROM [dbo].[Roles]
                           WHERE roleId = ?""";
            PreparedStatement statement = db.connection.prepareStatement(sql);
            statement.setObject(1, roleId);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {                
                Role role = new Role(rs.getInt("roleId"),
                        rs.getString("roleName"));
                list.add(role);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list.get(0);
    }
}
