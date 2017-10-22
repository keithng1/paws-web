package Listeners;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Utilities.ContactUsUtil;

/**
 * Servlet implementation class Contact
 */
@WebServlet("/Contact")
public class Contact extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Contact() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	
		if(request.getParameter("name")!=null)
		{
			if(request.getParameter("email")!=null)
			{
				if(request.getParameter("message")!=null)
				{
						String name = request.getParameter("name");
						String email = request.getParameter("email");
						String message = request.getParameter("message");
						String ip = request.getParameter("ip");
						if(ip == null)
						{
							ip = "0.0.0.0";
						}
						ContactUsUtil cuUtil = new ContactUsUtil();
						
						System.out.print("Contact.java" + cuUtil.isLastEntry(name, email, message));
						if(!cuUtil.isLastEntry(name, email, message))
							cuUtil.submitContactUs(name, email, message, ip);
					
				}
			}
		}
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
