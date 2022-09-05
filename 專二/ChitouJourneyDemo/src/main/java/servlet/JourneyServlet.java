package servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.sql.*;

import dao.JourneyDAO;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javaBean.JourneyBean;

/**
 * Servlet implementation class JourneyServlet
 */
@WebServlet("/JourneyServlet")
public class JourneyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	 private static final String CONTENT_TYPE = "text/html; charset=UTF-8";
	 private static final String CHARSET_CODE = "UTF-8";
	 
	DataSource ds = null;
	InitialContext ctxt = null;
	Connection conn = null;

	 /**
     * @see HttpServlet#HttpServlet()
     */
    public JourneyServlet() {
        super();
    }
    //??????????????????
    public void init(ServletConfig config) throws ServletException{
    	super.init(config);
    }
    
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding(CHARSET_CODE);
		response.setContentType(CONTENT_TYPE);
		
		if(request.getParameter("submitforOne")!=null) {
			submitforOne(request, response);
		}else if (request.getParameter("submitforAll")!=null) {
			submitforall(request, response);
		}
	}
	
	public void submitforOne(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException{
		try {
			
			ctxt = new InitialContext();
			
			ds = (DataSource) ctxt.lookup("java:comp/env/jdbc/chitouDB");
			//注意import類型是javax.sql.*
			conn = ds.getConnection();
			
			JourneyDAO journeyDAO = new JourneyDAO(conn);
			JourneyBean result = journeyDAO.searchJourneyOne();
			request.getSession(true).setAttribute("journeybean", result);
			request.getRequestDispatcher("/displayJourneyOne.jsp").forward(request, response);
			
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(conn !=null) {
					conn.close();
					}
			}catch (Exception e) {
					System.out.println("Connection Pool Error!");
			}
			
		}
		
	}
	public void submitforall(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
try {
			ctxt = new InitialContext();
			
			ds = (DataSource) ctxt.lookup("java:comp/env/jdbc/chitouDB");
			//注意import類型是javax.sql.*
			conn = ds.getConnection();
			
			JourneyDAO journeyDAO = new JourneyDAO(conn);
			List<JourneyBean> result = journeyDAO.searchJourneyAll();
//			int i = 1;
//			for(JourneyBean re:result) {
//				String beanName = "Journeybean" + i;
//				i++;
//				request.getSession(true).setAttribute(beanName, re);
//			}
			request.getSession(true).setAttribute("beanList", result);
			request.getRequestDispatcher("/displayJourneyAll.jsp").forward(request, response);
			
			
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(conn !=null) {
					conn.close();
					}
			}catch (Exception e) {
					System.out.println("Connection Pool Error!");
			}
			
		}
	}
	
	
	
}
