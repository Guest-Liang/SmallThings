package robotWeb.vo;

public class UserInfo {
	private Integer userId; 
	private String username;
	private String password;
	
	public UserInfo() {
		
	}

	public UserInfo(String username, String password) {
        this.username = username;
        this.password = password;
    }
	
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}    
}
