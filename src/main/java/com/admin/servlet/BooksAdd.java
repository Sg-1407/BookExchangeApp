package com.admin.servlet;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.DAO.BookDAOImpl;
import com.DAO.UserDAOImpl;
import com.DB.DBConnect;
import com.entity.BookDtls;

@WebServlet("/add_books")
@MultipartConfig
public class BooksAdd extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String bookName = req.getParameter("bname");
			String author = req.getParameter("author");
			String price = req.getParameter("price");
			String genre = req.getParameter("genre");
			String categories = req.getParameter("categories");
			String status = req.getParameter("status");
			Part part = req.getPart("bimg");
			String fileName = part.getSubmittedFileName();
	
			String email=req.getParameter("email");
			
			BookDtls b = new BookDtls(bookName, author, price, categories, status, fileName, email, genre);
			
			//System.out.println(b);

			BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
			
			HttpSession session = req.getSession();
			if (fileName.endsWith(".png") || fileName.endsWith("jpg")) {
				boolean f = dao.addBooks(b);

				if (f) {

					String path = getServletContext().getRealPath("") + "book";
				//		System.out.println(path);
					File file = new File(path);

					part.write(path + File.separator + fileName);

					session.setAttribute("succMsg", "Book Add Sucessfully");
					resp.sendRedirect("admin/add_books.jsp");

				} else {
					session.setAttribute("failedMsg", "Something wrong on Server");
					resp.sendRedirect("admin/add_books.jsp");
				}
			} else {
				session.setAttribute("failedMsg", "invalid format!! please add jpg or png");
				resp.sendRedirect("admin/add_books.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
