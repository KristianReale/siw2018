package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.CorsoDiLaurea;
import persistence.DatabaseManager;
import persistence.dao.CorsoDiLaureaDao;

public class GetCorsiDiLaurea extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String valueDip = req.getParameter("valueDip");
		
		CorsoDiLaureaDao dao =DatabaseManager.getInstance()
				.getDaoFactory().getCorsoDiLaureaDAO();
		List<CorsoDiLaurea> corsiDiLaureaTutti = dao.findAll();
		List<CorsoDiLaurea> corsiDiLaurea = new ArrayList<CorsoDiLaurea>();
		for (CorsoDiLaurea corsoDiLaurea : corsiDiLaureaTutti){	
			if (corsoDiLaurea.getDipartimento().getCodice() == Long.parseLong(valueDip)){
				corsiDiLaurea.add(corsoDiLaurea);
			}
		}
		
		req.setAttribute("corsiDiLaurea", corsiDiLaurea);
		
		RequestDispatcher dispacher = 
				req.getRequestDispatcher("report/getCorsiDiLaurea.jsp");
		
		dispacher.forward(req, resp);
	}
}
