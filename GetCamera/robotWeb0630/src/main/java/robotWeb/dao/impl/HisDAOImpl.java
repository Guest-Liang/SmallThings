package robotWeb.dao.impl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import robotWeb.dao.HisDAO;
import robotWeb.db.DBConnect;
import robotWeb.vo.*;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.List;

import java.sql.Connection;

public class HisDAOImpl implements HisDAO {

    private Connection connection = DBConnect.getConnection();

    public HisDAOImpl() {
    	
    }
    
    public HisDAOImpl(Connection connection) {
        this.connection = connection;
    }

    @Override
    public List<ExplorationRecord> getSortedHistoryRecords(String robotId, String sort) {
        List<ExplorationRecord> records = getHistoryByRobotID(robotId);

        if (sort.equals("根据探索时长排序")) {
            Collections.sort(records, new Comparator<ExplorationRecord>() {
                @Override
                public int compare(ExplorationRecord r1, ExplorationRecord r2) {
                    long duration1 = calculateDuration(r1.getBegintime(), r1.getEndtime());
                    long duration2 = calculateDuration(r2.getBegintime(), r2.getEndtime());

                    return Long.compare(duration1, duration2);
                }
            });
        } else if (sort.equals("根据宝藏类型排序")) {
            Collections.sort(records, new Comparator<ExplorationRecord>() {
                @Override
                public int compare(ExplorationRecord r1, ExplorationRecord r2) {
                    return r1.getTreasuretype().compareTo(r2.getTreasuretype());
                }
            });
        }

        return records;
    }

    @Override
    public List<ExplorationRecord> getHistoryByRobotID(String robotID) {
        List<ExplorationRecord> historyList = new ArrayList<>();
        SimpleDateFormat format = new SimpleDateFormat("HH:mm:ss");
        
        String query = "SELECT * FROM explorationrecord WHERE robotID = ?";
        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, robotID);
            try (ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                	int recordId = resultSet.getInt("recordId");
                    String startTime = format.format(resultSet.getString("begintime"));
                    String endTime = format.format(resultSet.getTime("endtime"));
                    String treasureType = resultSet.getString("treasureType");
                    String robotId = resultSet.getString("robotId");
                    String img = resultSet.getString("img");
                    int treasureCount = resultSet.getInt("Treasure_Count");
                    ExplorationRecord record = new ExplorationRecord(recordId, startTime, endTime, treasureType, treasureCount, robotId, img);
                    historyList.add(record);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return historyList;
    }
    
    @Override
    public List<ExplorationRecord> getAllHistory() {
        List<ExplorationRecord> historyList = new ArrayList<>();
        String query = "SELECT * FROM explorationrecord";
        try (PreparedStatement statement = connection.prepareStatement(query)) {
            try (ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                	int recordId = resultSet.getInt("recordId");
                    String startTime = resultSet.getString("begintime");
                    String endTime = resultSet.getString("endtime");
                    String treasureType = resultSet.getString("treasureType");
                    String robotId = resultSet.getString("robotId");
                    String img = resultSet.getString("img");
                    int treasureCount = resultSet.getInt("Treasure_Count");
                    ExplorationRecord record = new ExplorationRecord(recordId, startTime, endTime, treasureType, treasureCount, robotId, img);
                    historyList.add(record);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return historyList;
    }

    @Override
    public void deleteHistory(int historyID) {
        String query = "DELETE FROM explorationrecord WHERE historyID = ?";
        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, historyID);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void saveHistory(ExplorationRecord record) {
        String query = "INSERT INTO robotwebdb.explorationrecord (robotId, Treasuretype, Treasure_Count, begintime, endtime,img) VALUES (?,?,?,?,?,?)";
        Time beginTime = Time.valueOf(record.getBegintime());
        Time endTime = Time.valueOf(record.getEndtime());
        try {
        	PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1, record.getRobotId());
            statement.setString(2, record.getTreasuretype());
            statement.setInt(3, record.getTreasureCount());
            statement.setTime(4, beginTime);
            statement.setTime(5, endTime);
            statement.setString(6, record.getImg());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private long calculateDuration(String startTime, String endTime) {
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        try {
            Date start = format.parse(startTime);
            Date end = format.parse(endTime);
            long duration = end.getTime() - start.getTime();

            return duration;
        } catch (ParseException e) {
            e.printStackTrace();
        }

        return 0;
    }

}
