package robotWeb.vo;

import java.util.Date;

public class ExplorPicture {

	private Integer expPicId;
	private String pictureUrl;
	private Date createTime;
	
	public Integer getExpPicId() {
		return expPicId;
	}
	public void setExpPicId(Integer expPicId) {
		this.expPicId = expPicId;
	}
	public String getPictureUrl() {
		return pictureUrl;
	}
	public void setPictureUrl(String pictureUrl) {
		this.pictureUrl = pictureUrl;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	
}
