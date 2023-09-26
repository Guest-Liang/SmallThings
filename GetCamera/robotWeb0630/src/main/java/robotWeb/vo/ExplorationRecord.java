package robotWeb.vo;

public class ExplorationRecord {

	private Integer recordId;
	private String robotId;
	private String treasuretype;
	private String begintime;
	private String endtime;
	private Integer treasureCount;
	private String img;
	
	public ExplorationRecord() {
		
	}
	
	public ExplorationRecord(int recordId, String startTime, String endTime, String treasureType, int treasureCount, String robotId, String img) {
		this.recordId=recordId;
		this.begintime=startTime;
		this.endtime=endTime;
		this.robotId=robotId;
		this.treasuretype=treasureType;
		this.treasureCount = treasureCount;
		this.img = img;
	}
	
	public ExplorationRecord(String startTime, String endTime, String treasureType, int treasureCount, String robotId, String img) {
		this.begintime=startTime;
		this.endtime=endTime;
		this.robotId=robotId;
		this.treasuretype=treasureType;
		this.treasureCount = treasureCount;
		this.img = img;
	}
	
	public Integer getRecordId() {
		return recordId;
	}

	public void setRecordId(Integer recordId) {
		this.recordId = recordId;
	}

	public String getRobotId() {
		return robotId;
	}
	public void setRobotId(String robotId) {
		this.robotId = robotId;
	}
	public String getTreasuretype() {
		return treasuretype;
	}
	public void setTreasuretype(String treasuretype) {
		this.treasuretype = treasuretype;
	}
	public String getBegintime() {
		return begintime;
	}
	public void setBegintime(String begintime) {
		this.begintime = begintime;
	}
	public String getEndtime() {
		return endtime;
	}
	public void setEndtime(String endtime) {
		this.endtime = endtime;
	}

	public Integer getTreasureCount() {
		return treasureCount;
	}

	public void setTreasureCount(Integer treasureCount) {
		this.treasureCount = treasureCount;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}
	
}
