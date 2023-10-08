package robotWeb.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.Part;

import robotWeb.dao.HisDAO;
import robotWeb.dao.impl.HisDAOImpl;
import robotWeb.vo.ExplorationRecord;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.sql.Time;

/**
 * 保存探索历史记录Servlet
 */
@WebServlet("/SaveHistoryServlet")
@MultipartConfig
public class SaveHistoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public SaveHistoryServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//上传的图片文件
        Part part = request.getPart("file");
        String header = part.getHeader("content-disposition");
        String path = header.substring(header.indexOf("filename=") + 10, header.length() - 1);
        String name = getRealName(path);
        String realPath = this.getServletContext().getRealPath("/upload/"+name);
        File file = new File(realPath);

        InputStream inputStream = part.getInputStream();
        FileOutputStream outputStream = new FileOutputStream(file);
        int len = -1;
        byte[] bytes = new byte[1024];
        while ((len = inputStream.read(bytes)) != -1) {
            outputStream.write(bytes, 0, len);
        }
        //关闭IO流
        outputStream.close();
        inputStream.close();
        //删除临时文件
        System.out.println("上传的图片文件" + name);
        
        //保存探索信息
        String robotId = request.getParameter("robotId");
        String treasuretype = request.getParameter("treasuretype");
        int treasureCount = Integer.parseInt(request.getParameter("treasureCount"));
        
        String picture = "upload/"+name;
        ExplorationRecord record = new ExplorationRecord();
        record.setRobotId(robotId);
        record.setBegintime(request.getParameter("begintime")+":00");
        record.setEndtime(request.getParameter("endtime")+":00");
        record.setTreasuretype(treasuretype);
        record.setTreasureCount(treasureCount);
        record.setImg(picture);
        HisDAO dao = new HisDAOImpl();
        dao.saveHistory(record);//插入到数据库

        response.sendRedirect("history.jsp");//保存成功后，跳转到列表页面
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}

    /**
     * 根据文件的路径获取文件真实名称
     *
     * @param path
     *            文件的路径
     * @return 文件名称
     */
    public static String getRealName(String path) {
        int index = path.lastIndexOf("\\");
        if (index == -1) {
            index = path.lastIndexOf("/");
        }
        return path.substring(index + 1);
    }
}
