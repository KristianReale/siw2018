package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Studente;
import persistence.DatabaseManager;
import persistence.dao.StudenteDao;

public class DammiStudenti extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		StudenteDao dao =DatabaseManager.getInstance()
			.getDaoFactory().getStudenteDAO();
		List<Studente> studs = dao.findAll();
		req.setAttribute("studenti", studs);
		
		RequestDispatcher dispacher = 
				req.getRequestDispatcher
						("report/studenti.jsp");
		dispacher.forward(req, resp);
		
//		PrintWriter out = resp.getWriter();
//		out.println("<html>");
//		out.println("<table border = 1");
//		out.println("<tr>");
//		out.println("<th>Matricola</th>");
//		out.println("<th>Nome</th>");
//		out.println("<th>Cognome</th>");
//		out.println("<th>Data di Nascita</th>");
//		out.println("<th>Indirizzo</th>");
//		out.println("</tr>");
//		for (Studente s : dao.findAll()){
//			out.println("<tr>");
//			out.println("<td>");
//			out.println(s.getMatricola());
//			out.println("</td>");
//			out.println("<td>");
//			out.println(s.getNome());
//			out.println("</td>");
//			out.println("<td>");
//			out.println(s.getCognome());
//			out.println("</td>");
//			out.println("<td>");
//			out.println(s.getDataNascita());
//			out.println("</td>");
//			out.println("<td>");
//			out.println(s.getIndirizzo());
//			out.println("</td>");
//			out.println("</tr>");
//		}
//		out.println("</table>");
//		out.println("</html>");
		
		
		
		
		
		
		
	}
	
	
	
	
	
	
	
	
	
	
}
