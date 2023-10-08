package robotWeb.servlet;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import robotWeb.dao.ExplorPictureDAO;
import robotWeb.dao.HisDAO;
import robotWeb.dao.impl.ExplorPictureDAOImpl;
import robotWeb.dao.impl.HisDAOImpl;
import robotWeb.vo.ExplorPicture;
import robotWeb.vo.ExplorationRecord;

/**
 * Servlet implementation class InsertExplorDataServlet
 */
@WebServlet("/UploadPictureServlet")
@MultipartConfig
public class UploadPictureServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public UploadPictureServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String picture = "";
		//上传的图片文件
        Part part = request.getPart("file");
        if(part!=null) {
        	
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
        	picture = "upload/"+name;
        	ExplorPictureDAO dao = new ExplorPictureDAOImpl();
        	ExplorPicture data = new ExplorPicture();
        	data.setCreateTime(new Date());
        	data.setPictureUrl(picture);
			dao.insert(data);
        }
        
         PrintWriter pw = response.getWriter();
         pw.write("0");
         pw.flush();
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
