package robotWeb.dao.impl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.sql.Date;

import robotWeb.dao.ExplorPictureDAO;
import robotWeb.db.DBConnect;
import robotWeb.vo.ExplorPicture;

public class ExplorPictureDAOImpl implements ExplorPictureDAO {

	@Override
	public void insert(ExplorPicture picture) {
		// 创建插入用户信息的SQL语句
				String sql = "INSERT INTO explor_pic (pic_url, create_time) VALUES (?, ?)";
		        DBConnect usc = null;
		        PreparedStatement pstmt = null;
		        
		        // 下面是针对数据库的具体操作   
		        try{   
		            // 连接数据库   
		        	usc = new DBConnect();   
		            pstmt = usc.getConnection().prepareStatement(sql) ; 
		            // statement = connection.prepareStatement(sql);
		            
		            // 设置参数
		            pstmt.setString(1,picture.getPictureUrl()) ;
		            pstmt.setTimestamp(2,  new Timestamp(System.currentTimeMillis())) ;           
		            
		            // 执行插入操作   
		            int rowsAffected = pstmt.executeUpdate();
		            System.out.println("插入图片数据："+rowsAffected);
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
	}

	@Override
	public ExplorPicture findNewPicture() {
		ResultSet res = null;
		ExplorPicture picture=null;
		try {
			PreparedStatement pre = DBConnect.getConnection().prepareStatement("select * from explor_pic order by create_time desc limit 0,1");
			res = pre.executeQuery();
			while (res.next()) {
				picture = new ExplorPicture();
				picture.setPictureUrl(res.getString("pic_url"));
				picture.setCreateTime(res.getDate("create_time"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return picture;
	}

}
