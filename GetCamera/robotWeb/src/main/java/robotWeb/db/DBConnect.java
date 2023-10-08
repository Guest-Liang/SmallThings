package robotWeb.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnect {
	private static final String DBDRIVER = "com.mysql.cj.jdbc.Driver" ;   
    private static final String DBURL = "jdbc:mysql://localhost:3306/robotwebdb" ;   
    private static final String DBUSER = "root" ;   
    // private static final String DBPASSWORD = "Pxy78625964587" ;   
    private static final String DBPASSWORD = "1023mysql" ;   
    private static Connection conn = null ; 
    
    public DBConnect()   {   
        try{   
            Class.forName(DBDRIVER) ;   
            this.conn = DriverManager.getConnection(DBURL,DBUSER,DBPASSWORD) ;  
        }catch (Exception e){ 
        	System.out.println(e.getMessage());  
        	}   
    }   
  
    // 取得数据库连接   
    public static Connection getConnection(){   
    	try {
			if(DBConnect.conn==null) {
				Class.forName(DBDRIVER) ;   
				DBConnect.conn = DriverManager.getConnection(DBURL,DBUSER,DBPASSWORD) ;  
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
        return DBConnect.conn ;   
    }   
  
    // 关闭数据库连接   
    public void close(){   
        try{   
            this.conn.close() ;   
        }catch (Exception e){ }          
    }
}