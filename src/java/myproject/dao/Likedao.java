/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package myproject.dao;

import java.sql.*;

/**
 *
 * @author User
 */
public class Likedao {

    public Likedao(Connection con) {
        this.con = con;
    }

    Connection con;

    public boolean insertLike(int pid, int uid) {
        boolean f = false;
        try {

            String q = "insert into liked(pid,uid)values(?,?)";
            PreparedStatement p = this.con.prepareStatement(q);
//            set the values now
            p.setInt(1, pid);
            p.setInt(2, uid);
            p.executeUpdate();
            f = true;

        } catch (Exception e) {
        }
        return f;
    }

    public int countLikeOnPost(int pid)  {
        int count = 0;

        try {
             String q = "select count(*) from liked  where pid=?";
        PreparedStatement p = this.con.prepareStatement(q);
        p.setInt(1, pid);
       ResultSet set= p.executeQuery();
       if(set.next())
       {
           count=set.getInt("count(*)");
       }
       
       
       
       
       
        } catch (Exception e) {
            e.printStackTrace();
        }
       

        return count;
    }
    public boolean isLikedByUser(int pid,int uid)
    {
        boolean f=false;
        
        try {
            
            PreparedStatement p=this.con.prepareStatement("select * from liked where pid=? and uid=?");
            p.setInt(1, pid);
            p.setInt(2, uid);
            ResultSet set=  p.executeQuery();
            if(set.next())
            {
                f=true;
            }
            
        } catch (Exception e) {
        }
        
        
        return f;
                
    }
    
    
    
    public boolean deleteLike(int pid,int uid)
    {
        boolean f=false;
         try {
                        PreparedStatement p=this.con.prepareStatement("delete  from liked where pid=? and uid=?");
                        p.setInt(1, pid);
                        p.setInt(2, uid);
                        p.executeUpdate();
                        f=true;

        } catch (Exception e) {
        }
        
        
        return f;
    }
}
