package robotWeb.servlet;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import robotWeb.vo.*;
import robotWeb.dao.HisDAO;
import robotWeb.dao.RobotDAO;
import robotWeb.dao.impl.*;
import robotWeb.db.DBConnect;

@WebServlet("/connectRobotServlet")
public class ConnectRobotServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    	if(request.getSession().getAttribute("LOGIN_USER")==null) {
    		//未登录，跳转到登录页面
    		response.sendRedirect("login.jsp");
    	}else {    		
    		UserInfo user = (UserInfo) request.getSession().getAttribute("LOGIN_USER");
    		//根据当前登录用户，查询对应的机器人
    		RobotDAO dao = new RobotDaoImpl();
    		RobotInfo robot = dao.findMyRobots(user.getUserId());
    		request.setAttribute("robot", robot);
    		request.setAttribute("userInfo", user);
    		request.getRequestDispatcher("profile.jsp").forward(request, response);
    	}
    	
    }

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(req, resp);
	}
    
    
}
