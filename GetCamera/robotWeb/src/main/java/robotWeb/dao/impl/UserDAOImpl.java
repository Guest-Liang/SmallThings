package robotWeb.dao.impl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import robotWeb.dao.UserDAO;
import robotWeb.db.DBConnect;
import robotWeb.vo.UserInfo;

public class UserDAOImpl implements UserDAO {
	int flag=0;
	@Override
	public int register(UserInfo regInfo) throws Exception {
		// 创建插入用户信息的SQL语句
		String sql = "INSERT INTO userinfo (username, userpassword) VALUES (?, ?)";
        DBConnect usc = null;
        PreparedStatement pstmt = null;
        
        // 下面是针对数据库的具体操作   
        try{   
            // 连接数据库   
        	usc = new DBConnect();   
            pstmt = usc.getConnection().prepareStatement(sql) ; 
            // statement = connection.prepareStatement(sql);
            
            // 设置参数
            pstmt.setString(1,regInfo.getUsername()) ;
            pstmt.setString(2,regInfo.getPassword()) ;            
            
            // 执行插入操作   
            int rowsAffected = pstmt.executeUpdate();
            // 如果插入成功，则返回true；否则返回false
            if(rowsAffected>0)
            	flag=1;
            
        }catch (SQLException e){   
            System.out.println(e.getMessage());
        }finally{   
        	// 关闭statement
        	if (pstmt != null) {
                try {
                	pstmt.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }   
        return flag ;
	}
	
	@Override
	public UserInfo findUserInfo(String userName, String pwd) {
		ResultSet res = null;
		UserInfo user = null;
		try {
			PreparedStatement pre = DBConnect.getConnection().prepareStatement("select * from userinfo where username=? and userpassword=?");
			pre.setString(1, userName);
			pre.setString(2, pwd);
			res = pre.executeQuery();
			while (res.next()) {
				user = new UserInfo();
				user.setUserId(res.getInt("user_id"));
				user.setPassword(res.getString("userpassword"));
				user.setUsername(res.getString("username"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return user;
	}
    
}       
