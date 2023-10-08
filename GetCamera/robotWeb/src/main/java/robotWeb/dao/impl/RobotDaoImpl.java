package robotWeb.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;
import java.util.ArrayList;
import java.util.List;

import robotWeb.dao.RobotDAO;
import robotWeb.db.DBConnect;
import robotWeb.vo.RobotInfo;

public class RobotDaoImpl implements RobotDAO {

	private Connection connection = DBConnect.getConnection();
	
	@Override
	public List<RobotInfo> findAllRobots() {
        List<RobotInfo> list = new ArrayList<>();
        
        String query = "SELECT * FROM robotinfo";
        try (PreparedStatement statement = connection.prepareStatement(query)) {
            try (ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                	RobotInfo robot = new RobotInfo();
                	robot.setRobotId(resultSet.getString("robotId"));
                	robot.setRobotName(resultSet.getString("robotname"));
                	robot.setSituation(resultSet.getInt("situation"));
                	robot.setUserId(resultSet.getInt("user_id"));
                	list.add(robot);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
		return list;
	}
    
	@Override
	public RobotInfo findMyRobots(Integer userId) {
		RobotInfo robot = null;
        String query = "SELECT * FROM robotinfo where user_id=?";
        try (PreparedStatement statement = connection.prepareStatement(query)) {
        	statement.setInt(1, userId);
            try (ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                	robot = new RobotInfo();
                	robot.setRobotId(resultSet.getString("robotId"));
                	robot.setRobotName(resultSet.getString("robotname"));
                	robot.setSituation(resultSet.getInt("situation"));
                	robot.setUserId(resultSet.getInt("user_id"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
		return robot;
	}

	@Override
	public RobotInfo findRobotById(Integer id) {
		RobotInfo robot = null;
        String query = "SELECT * FROM robotinfo where robotId=?";
        try (PreparedStatement statement = connection.prepareStatement(query)) {
        	statement.setInt(1, id);
            try (ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                	robot = new RobotInfo();
                	robot.setRobotId(resultSet.getString("robotId"));
                	robot.setRobotName(resultSet.getString("robotname"));
                	robot.setSituation(resultSet.getInt("situation"));
                	robot.setUserId(resultSet.getInt("user_id"));
                	robot.setLastName(resultSet.getString("last_name"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
		return robot;
	}

	@Override
	public void updateRobot(RobotInfo robot) {
		// UPDATE robotwebdb.robotinfo SET robotname = '阿尔法狗', user_id = 4, situation = 0, last_name = NULL WHERE robotId = '3';
		String query = "UPDATE robotwebdb.robotinfo SET robotname = ?, user_id = ?, situation = ?, last_name = ? WHERE robotId =?";
        try {
        	PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1, robot.getRobotName());
            statement.setInt(2, robot.getUserId());
            statement.setInt(3, robot.getSituation());
            statement.setString(4, robot.getLastName());
            statement.setString(5, robot.getRobotId());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
		
	}

}
