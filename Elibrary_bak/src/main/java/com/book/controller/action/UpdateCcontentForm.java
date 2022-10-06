package com.book.controller.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.book.dao.BookDAO;
import com.book.dto.BookVO;

/**
 * Servlet implementation class IdCheckServlet
 */
public class UpdateCcontentForm implements Action {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "/view/jsp/updateccontent_form.jsp";
		String cno = request.getParameter("cno");
		//String ccontent = request.getParameter("ccontent");
		BookDAO bDao = BookDAO.getInstance();
		BookVO bVo = bDao.ReviewSelect(cno);
		request.setAttribute("review", bVo);
		//request.setAttribute("ccontent", ccontent);

		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}

}
