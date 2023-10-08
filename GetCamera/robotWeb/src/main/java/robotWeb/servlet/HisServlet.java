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
import robotWeb.dao.impl.*;
import robotWeb.db.DBConnect;

@WebServlet("/findHistoryServlet")
public class HisServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String sort = request.getParameter("sort");

        HisDAO hisDao = null;
		try {
			hisDao = new HisDAOImpl(DBConnect.getConnection());
		} catch (Exception e) {
			e.printStackTrace();
		}

        List<ExplorationRecord> sortedRecords = hisDao.getAllHistory();
        
        if(sort.equals("time")) {        	
        	Collections.sort(sortedRecords, new Comparator<ExplorationRecord>() {
        		@Override
        		public int compare(ExplorationRecord r1, ExplorationRecord r2) {
        			long duration1 = calculateDuration(r1.getBegintime(), r1.getEndtime());
        			long duration2 = calculateDuration(r2.getBegintime(), r2.getEndtime());
//        			System.out.println(duration1+"-"+duration2);
        			return -1*Long.compare(duration1, duration2);
        		}
        	});
        }else {
        	Collections.sort(sortedRecords, new Comparator<ExplorationRecord>() {
        		@Override
        		public int compare(ExplorationRecord r1, ExplorationRecord r2) {
        			System.out.println(r1.getTreasureCount() +"-"+ r2.getTreasureCount());
        			return -1*(r1.getTreasureCount() - r2.getTreasureCount());
        		}
        	});
        }
        
//        for (ExplorationRecord record : sortedRecords) {
//        	System.out.println(record.getTreasureCount()+"|"+record.getBegintime());
//        }
        request.setAttribute("records", sortedRecords);

        request.getRequestDispatcher("history_sort.jsp").forward(request, response);
    }
    
    private long calculateDuration(String startTime, String endTime) {
        SimpleDateFormat format = new SimpleDateFormat("HH:mm:ss");
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
