package robotWeb.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import robotWeb.vo.*;
import robotWeb.dao.HisDAO;
import robotWeb.dao.RobotDAO;
import robotWeb.dao.UserDAO;
import robotWeb.dao.impl.*;

/**
 * 撤销机器人的姓名修改
 *
 */
@WebServlet("/revokeRobotServlet")
public class RevokeRobotServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer id = Integer.parseInt(request.getParameter("id"));
        RobotDAO dao = new RobotDaoImpl();
		RobotInfo robot = dao.findRobotById(id);
		if(robot.getLastName()==null || robot.getLastName().equals("")) {
			response.sendRedirect("connectRobotServlet");
		}else {
			robot.setRobotName(robot.getLastName());
			robot.setLastName("");
			try {
				dao.updateRobot(robot);
				request.setAttribute("msg", "撤销机器人名称成功");
			} catch (Exception e) {
				e.printStackTrace();
				request.setAttribute("msg", "修改失败！");
			}
			response.sendRedirect("connectRobotServlet");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}
}
