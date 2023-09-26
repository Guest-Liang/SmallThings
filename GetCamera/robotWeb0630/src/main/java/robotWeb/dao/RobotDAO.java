package robotWeb.dao;

import java.util.List;

import robotWeb.vo.RobotInfo;

public interface RobotDAO {

	/**
	 * 查找所有机器人
	 * @return
	 */
	List<RobotInfo> findAllRobots();

	/**
	 * 查找我的机器人
	 * @param userId
	 * @return
	 */
	RobotInfo findMyRobots(Integer userId);

	/**
	 * 根据ID查找机器人
	 * @param id
	 * @return
	 */
	RobotInfo findRobotById(Integer id);
	
	/**
	 * 更新机器人信息
	 * @param robot
	 */
	void updateRobot(RobotInfo robot);
}
