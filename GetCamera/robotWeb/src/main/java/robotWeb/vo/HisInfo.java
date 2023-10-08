package robotWeb.vo;

import java.util.List;

public class HisInfo {
    private String startTime;
    private String endTime;
    private int treasureCount;
    private String treasureType;
    private String imageList;

    public HisInfo(String startTime, String endTime, int treasureCount, String treasureType, String imageList) {
        this.startTime = startTime;
        this.endTime = endTime;
        this.treasureCount = treasureCount;
        this.treasureType = treasureType;
        this.imageList = imageList;
    }

    public String getStartTime() {
        return startTime;
    }

    public void setStartTime(String startTime) {
        this.startTime = startTime;
    }

    public String getEndTime() {
        return endTime;
    }

    public void setEndTime(String endTime) {
        this.endTime = endTime;
    }

    public int getTreasureCount() {
        return treasureCount;
    }

    public void setTreasureCount(int treasureCount) {
        this.treasureCount = treasureCount;
    }

    public String getTreasureType() {
        return treasureType;
    }

    public void setTreasureType(String treasureType) {
        this.treasureType = treasureType;
    }

    public String getImageList() {
        return imageList;
    }

    public void setImageList(String imageList) {
        this.imageList = imageList;
    }
}


