package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Indirizzo;
import model.Studente;
import persistence.DatabaseManager;
import persistence.dao.IndirizzoDao;
import persistence.dao.StudenteDao;

public class IscriviStudente extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		RequestDispatcher dispacher = 
				req.getRequestDispatcher("iscriviStudente.jsp");
		dispacher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String matricola = req.getParameter("matricola");
		String nome = req.getParameter("nome");
		String cognome = req.getParameter("cognome");
		String dataNascita = req.getParameter("dataNascita");
		String password = req.getParameter("password");
		String indirizzo = req.getParameter("indirizzo");
	
		DateFormat format = new SimpleDateFormat
							("yyyy-mm-dd", Locale.ITALIAN);
		Date date;
		try {
			date = format.parse(dataNascita);
			Studente stud = 
					new Studente(matricola, nome, cognome, date);
			
			IndirizzoDao indirizzoDao = 
					DatabaseManager.getInstance()
					.getDaoFactory().getIndirizzoDAO();
			Indirizzo indir = indirizzoDao
					.findByPrimaryKey(Long.parseLong(indirizzo));
			stud.setIndirizzo(indir);
			
			StudenteDao studenteDao = 
					DatabaseManager.getInstance()
					.getDaoFactory().getStudenteDAO();
			studenteDao.save(stud);
			studenteDao.setPassword(stud, password);
			
			req.setAttribute("studente", stud);
			
			RequestDispatcher dispacher = 
					req.getRequestDispatcher("iscriviStudente.jsp");
			dispacher.forward(req, resp);
			
			//resp.setContentType("text/html");
			
			
//			PrintWriter out = resp.getWriter();
//			out.println("<html>");
//			out.println("<head><title>Iscrizione studente</title></head>");
//			out.println("<body>");
//			out.println("<h1>Abbiamo iscritto il seguente studente:</h1>");
//			out.println(matricola);
//			out.println(nome);
//			out.println(cognome);
//			out.println(dataNascita);
//			out.println(password);
//			out.println(indirizzo);
//			out.println("</body>");
//			out.println("</html>");	
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			
	}
}
