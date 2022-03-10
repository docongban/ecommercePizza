/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import connection.DBConnection;
import enity.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author docon
 */
public class DAO {
    Connection conn=null;
    PreparedStatement ps = null;
    ResultSet rs=null;
    
    public List<Category> getAllCategory(){
        List<Category> list=new ArrayList<>();
        
        String query= "select * from category";
        
        try {
            conn = new DBConnection().getDBConnection();
            ps = conn.prepareStatement(query);
            
            rs = ps.executeQuery();
            while(rs.next()){
                list.add(new Category(rs.getInt(1), rs.getString(2), rs.getDate(3), rs.getDate(4)));
            }
        } catch (Exception e) {
        }
        return list;
    }
    
    public Category getCategoryByID(String id){
        String query= "select * from category where id = ?";
        
        try {
            conn = new DBConnection().getDBConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            
            rs = ps.executeQuery();
            while(rs.next()){
                return(new Category(rs.getInt(1), rs.getString(2), rs.getDate(3), rs.getDate(4)));
            }
        } catch (Exception e) {
        }
        return null;
    }
    
    public List<Product> getAllProduct(){
        List<Product> list=new ArrayList<>();
        
        String query= "SELECT * FROM products";
        
        try {
            conn = new DBConnection().getDBConnection();
            ps = conn.prepareStatement(query);
            
            rs = ps.executeQuery();
            while(rs.next()){
                list.add(new Product(rs.getInt(1), 
                        rs.getString(2), 
                        rs.getDouble(3), 
                        rs.getString(4),
                        rs.getString(5),
                        rs.getInt(6),
                        rs.getDate(7),
                        rs.getDate(8)));
            }
        } catch (Exception e) {
        }
        return list;
    }
    
    public List<Product> getProductById(String id){
        List<Product> list=new ArrayList<>();
        
        String query= "select * from products where id_category=?";
        
        try {
            conn = new DBConnection().getDBConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            
            rs = ps.executeQuery();
            while(rs.next()){
                list.add(new Product(rs.getInt(1), 
                        rs.getString(2), 
                        rs.getDouble(3), 
                        rs.getString(4),
                        rs.getString(5),
                        rs.getInt(6),
                        rs.getDate(7),
                        rs.getDate(8)));
            }
        } catch (Exception e) {
        }
        return list;
    }
    
    public List<Product> getProductBySearch(String title){
        List<Product> list=new ArrayList<>();
        
        String query= "select * from products where title like ?";
        
        try {
            conn = new DBConnection().getDBConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, "%" + title + "%");
            
            rs = ps.executeQuery();
            while(rs.next()){
                list.add(new Product(rs.getInt(1), 
                        rs.getString(2), 
                        rs.getDouble(3), 
                        rs.getString(4),
                        rs.getString(5),
                        rs.getInt(6),
                        rs.getDate(7),
                        rs.getDate(8)));
            }
        } catch (Exception e) {
        }
        return list;
    }
    
    public Account login(String phone, String pass){
        String query = "select * from accounts where phone=? and pass = ?";
        
        try {
            conn = new DBConnection().getDBConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, phone);
            ps.setString(2, pass);
            
            rs = ps.executeQuery();
            while(rs.next()){
                return(new Account(rs.getInt(1), 
                        rs.getString(2), 
                        rs.getString(3), 
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7),
                        rs.getInt(8),
                        rs.getDate(9),
                        rs.getDate(10)));
            }
        } catch (Exception e) {
        }
        return null;
    }
    
    public Account checkAccountExist(String phone){
        String query = "select * from accounts where phone=? ";
        
        try {
            conn = new DBConnection().getDBConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, phone);
            
            rs = ps.executeQuery();
            while(rs.next()){
                return(new Account(rs.getInt(1), 
                        rs.getString(2), 
                        rs.getString(3), 
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7),
                        rs.getInt(8),
                        rs.getDate(9),
                        rs.getDate(10)));
            }
        } catch (Exception e) {
        }
        return null;
    }
    
    public void signup(String fullname, String email, String address, String phone, String pass){
        String query = "INSERT INTO accounts (fullname, email, address, phone, pass, isSell, isAdmin, created_at, updated_at) \n"
                + "VALUES (?,?,?,?,?,0,0,?,?)";
        
        try {
            conn = new DBConnection().getDBConnection();
            ps = conn.prepareStatement(query);
            
            Date d=new Date();
                java.sql.Date sqlDate = new java.sql.Date(d.getTime());
            
            ps.setString(1, fullname);
            ps.setString(2, email);
            ps.setString(3, address);
            ps.setString(4, phone);
            ps.setString(5, pass);
            ps.setDate(6, sqlDate);
            ps.setDate(7, sqlDate);
            
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
    
    
//    test
    public static void main(String[] args) {
        DAO dao=new DAO();
        List<Product> listC= dao.getProductById("3");
//        System.out.println(dao.getCategoryByID("2").getName());
        List<Product> list= dao.getProductBySearch("Xông Khói");
        System.out.println(dao.login("0123456789", "123456").getFullname());
        
        for(Product c:list){
            System.out.println(c);
        }
    }
}
