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
import java.sql.ResultSet;
import java.util.ArrayList;
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
    
//    test
    public static void main(String[] args) {
        DAO dao=new DAO();
        List<Product> listC= dao.getProductById("3");
        for(Product c:listC){
            System.out.println(c);
        }
    }
}
