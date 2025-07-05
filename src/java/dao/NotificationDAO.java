/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;
import java.sql.*;
import java.util.ArrayList;
import model.Notifications;

/**
 *
 * @author he181
 */
public class NotificationDAO {

    public static void sentToCccd(String memberCccd, String msg) {
        DBContext db = DBContext.getInstance();
        String sql = """
                     INSERT INTO [dbo].[Notifications]
                                ([cccd]
                                ,[message]
                                ,[sentDate]
                                ,[isRead])
                          VALUES
                                (?
                                ,?
                                ,GETDATE()
                                ,0)""";
        try {
            PreparedStatement ps = db.connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setObject(1, memberCccd);
            ps.setObject(2, msg);
            
            ps.executeUpdate();
            ResultSet rs = ps.getGeneratedKeys();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public static ArrayList<Notifications> findByCccd(String cccd){
        DBContext db =  DBContext.getInstance();
        ArrayList<Notifications> list = new ArrayList<>();
        String sql = """
                     SELECT [notificationID]
                           ,[cccd]
                           ,[message]
                           ,[sentDate]
                           ,[isRead]
                       FROM [dbo].[Notifications]
                       Where cccd = ?
                        Order BY sentDate desc""";
        try {
            PreparedStatement ps = db.connection.prepareStatement(sql);
            ps.setObject(1, cccd);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {                
                Notifications notification = new Notifications(rs.getString("cccd"), 
                        rs.getString("message"), 
                        rs.getString("sentDate"), 
                        rs.getBoolean("isRead"));
                list.add(notification);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    } 

}
