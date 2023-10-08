package robotWeb.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import robotWeb.vo.*;
import robotWeb.dao.UserDAO;
import robotWeb.dao.impl.*;

@WebServlet("/regServlet")
public class UserRegServlet extends HttpServlet {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //保存管理员信息
        String username = request.getParameter("userName");
        String password = request.getParameter("password");
     // 创建RegInfo对象
        UserInfo regInfo = new UserInfo(username, password);        
        
        UserDAO regDAO = new UserDAOImpl();
        // 调用RegDAO进行用户注册
        int success = 0;
        try {
        		success=regDAO.register(regInfo);
        } catch(Exception e) {
        	e.printStackTrace();
        }

        if (success==1) {
            HttpSession session=request.getSession();
            // 注册成功，跳转到登录页面
            request.setAttribute("msg", "注册成功，请登录");
            response.sendRedirect("login.jsp");
        } else {
            // 注册失败，
        	request.setAttribute("msg", "注册失败");
        	request.getRequestDispatcher("/register.jsp").forward(request,response);
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
