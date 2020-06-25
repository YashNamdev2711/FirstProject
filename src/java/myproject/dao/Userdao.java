/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package myproject.dao;

import java.sql.*;
import myproject.entities.User;

/**
 *
 * @author User
 */
public class Userdao {

    private final Connection con;
    private int userId;
    private int userid;

    public Userdao(Connection con) {
        this.con = con;
    }

    // method to insert user values to database
    public boolean saveuser(User user) {
        boolean f = false;
        try {

            //write a code here jiisey user databasse me insert kar sake values
            String query = "insert into user(name ,email,password,gender,about) values(?,?,?,?,?)";
            PreparedStatement pstmt = this.con.prepareStatement(query);
            pstmt.setString(1, user.getName());
            pstmt.setString(2, user.getEmail());
            pstmt.setString(3, user.getPassword());
            pstmt.setString(4, user.getGender());
            pstmt.setString(5, user.getAbout());
           
            
            pstmt.executeUpdate();
            f = true;

        } catch (SQLException e) {
        }
        return f;
    }
    
    //by user email and user passwword 
    public User getUserbyemailandpassword(String email,String password)
    {
        User user=null;
        
        try{
            String query="select * from user where email=? and password =?";
            PreparedStatement pstmt=con.prepareStatement(query);
            pstmt.setString(1, email);
            pstmt.setString(2, password);
           ResultSet set= pstmt.executeQuery();
           if(set.next())
           {
               user =new User();
               // data base se data liya h 
               String name=set.getString("name");
               // user ke obj me uska name segt kardiya jo value apn ne database se li thi
               
               user.setName(name);
               user.setId(set.getInt("id"));
               user.setEmail(set.getString("email"));
               user.setPassword(set.getString("password"));
               user.setGender(set.getString("gender"));
               user.setAbout(set.getString("about"));
//               user.setDateTime(set.getTimestamp("reg_date "));
               
           }
        }catch(SQLException e)
        {
        }
        
        
        
        
        
        
        
        return user;
    }

    public User getUserByEmailAndPassword(String userEmail, String userPassword) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

   

    public boolean updateUser(User user) {

        boolean f = false;
        try {

            String query = "update user set name=? , email=? , password=? , gender=? ,about=? , profile=? where  id =?";
            PreparedStatement p = con.prepareStatement(query);
            p.setString(1, user.getName());
            p.setString(2, user.getEmail());
            p.setString(3, user.getPassword());
            p.setString(4, user.getGender());
            p.setString(5, user.getAbout());
            p.setString(6, user.getProfile());
            p.setInt(7, user.getId());

            p.executeUpdate();
            f = true;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }
    
    
    public boolean saveUser(User user) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    










  public User getUserByUserId(int userId) {
        User user = null;
        try {
            String q = "select * from user where id=?";
            PreparedStatement ps = this.con.prepareStatement(q);
            ps.setInt(1, userId);
            ResultSet set = ps.executeQuery();
            if (set.next()) {
                user = new User();

//             data from db
                String name = set.getString("name");
//             set to user object
                user.setName(name);

                user.setId(set.getInt("id"));
                user.setEmail(set.getString("email"));
                user.setPassword(set.getString("password"));
                user.setGender(set.getString("gender"));
                user.setAbout(set.getString("about"));
                user.setDateTime(set.getTimestamp("rdate"));
                user.setProfile(set.getString("profile"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;
    }

        
        
        
        
        
    
    
      
      
      
}
