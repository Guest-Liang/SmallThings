package robotWeb.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import robotWeb.vo.*;
import robotWeb.dao.ExplorPictureDAO;
import robotWeb.dao.impl.*;

@WebServlet("/GetNewPicture")
public class GetNewExplorPictureServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ExplorPictureDAO dao = new ExplorPictureDAOImpl();
        ExplorPicture pic = dao.findNewPicture();
        if(pic!=null) {        	
        	PrintWriter pw = response.getWriter();
        	pw.write(pic.getPictureUrl());
        	pw.flush();
        }
    }
    
}
