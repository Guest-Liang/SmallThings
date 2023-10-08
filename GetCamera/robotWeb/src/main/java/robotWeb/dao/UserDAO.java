package robotWeb.dao;

import robotWeb.vo.*;

public interface UserDAO {
	
	public int register(UserInfo regInfo) throws Exception;
	
	UserInfo findUserInfo(String userName, String pwd);
}
