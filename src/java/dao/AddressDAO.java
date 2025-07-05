/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.util.ArrayList;
import model.Address;
import java.sql.*;
import java.util.HashSet;
import java.util.Set;
import model.Role;
import model.User;

/**
 *
 * @author he181
 */
public class AddressDAO {

    

    public static Address findByAddressId(int addressId) {
        DBContext db = DBContext.getInstance();
        ArrayList<Address> list = new ArrayList<>();
        try {

            String sql = """
                         SELECT *
                           FROM [Household].[dbo].[Address]
                         WHERE addressId = ?""";
            PreparedStatement statement = db.connection.prepareStatement(sql);
            statement.setObject(1, addressId);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Address address = new Address(rs.getInt("addressId"),
                        rs.getString("district"),
                        rs.getString("street"),
                        rs.getString("city"),
                        rs.getString("ward"));
                list.add(address);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list.get(0);
    }

    public static ArrayList<Address> findAll() {
        ArrayList<Address> list = new ArrayList<>();
        DBContext db = DBContext.getInstance();
        String sql = """
                     SELECT [addressId]
                           ,[street]
                           ,[ward]
                           ,[district]
                           ,[city]
                       FROM [dbo].[Address]""";

        try {
            PreparedStatement statement = db.connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Address address = new Address(rs.getInt("addressId"),
                        rs.getString("district"),
                        rs.getString("street"),
                        rs.getString("city"),
                        rs.getString("ward"));
                list.add(address);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    

    
    
}
