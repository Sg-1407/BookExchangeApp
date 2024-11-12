package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.UserDAOImpl;
import com.DB.DBConnect;
import com.entity.User;
@WebServlet("/update_profile")
public class UpdateProfileServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int id=Integer.parseInt(req.getParameter("uid"));
			String name=req.getParameter("fname");
			String email=req.getParameter("email");
			String phno=req.getParameter("phno");
			String address=req.getParameter("address");
			String landmark=req.getParameter("landmark");
			String city=req.getParameter("city");
			String state=req.getParameter("state");
			String pincode=req.getParameter("pincode");
			
			User us=new User();
			us.setId(id);
			us.setName(name);
			us.setEmail(email);
			us.setPhno(phno);
			us.setAddress(address);
			us.setLandmark(landmark);
			us.setCity(city);
			us.setState(state);
			us.setPincode(pincode);
			
			HttpSession session=req.getSession();
			UserDAOImpl dao=new UserDAOImpl(DBConnect.getConn());
			
			
			
				boolean f2=dao.updateProfile(us);
				if(f2)
				{
					session.setAttribute("succMsg","Profile Update Successfully..");
					resp.sendRedirect("admin/home.jsp");
				}else {
					session.setAttribute("failedMsg","Something wrong on server");
					resp.sendRedirect("admin/home.jsp");
				}
					
	
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);
		}
	}
	

}
