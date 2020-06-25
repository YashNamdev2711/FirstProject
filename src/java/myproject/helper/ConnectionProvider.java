
package myproject.helper;
import java.sql.*;
public class ConnectionProvider {
    
    public static Connection con;
    
    public static Connection getConnection()
    {
        //now we are going to make a connection through database
        try
        {
        if(con==null)
        {
             // load a driver first
             Class.forName("com.mysql.cj.jdbc.Driver");
            //step 3 opening database connection to mysql server
            String db_url="jdbc:mysql://localhost:3306/project1";
            String db_uname="root";
            String db_upass="root";
            
           con=DriverManager.getConnection(db_url,db_uname,db_upass);
        }
              
        }catch(Exception e)
            
        {
            e.printStackTrace();
        }
        
        
        return con;
    }
    
}
