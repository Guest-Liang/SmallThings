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
import java.io.OutputStream;
import java.sql.Time;

/**
 */
@WebServlet("/ExportServlet")
@MultipartConfig
public class ExportDataServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public ExportDataServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ExplorationRecord record = (ExplorationRecord) request.getSession().getAttribute("EXPLOR_TREASU");
		response.setHeader("Content-Disposition", "attachment; filename=\"file.txt\"");
		response.setContentType("application/octet-stream");
		OutputStream outputStream = response.getOutputStream();
		StringBuilder sb = new StringBuilder();
		sb.append("Start Time：");
		sb.append(record.getBegintime());
		sb.append("\n");
		sb.append("End Time：");
		sb.append(record.getEndtime());
		sb.append("\n");
		sb.append("Number of Treasures：");
		sb.append(record.getTreasureCount());
		sb.append("\n");
		sb.append("Type：");
		sb.append(record.getTreasuretype());
		sb.append("\n");
		sb.append("Treasure Image：");
		sb.append(record.getImg());
		sb.append("\n");
		sb.append("Robot ID：");
		sb.append(record.getRobotId());
        byte[] buffer = sb.toString().getBytes();
        outputStream.write(buffer, 0, buffer.length);
        outputStream.close();
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
