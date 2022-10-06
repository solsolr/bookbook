package com.book.controller.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.book.dao.BookDAO;
import com.book.dto.BookVO;

public class myconmmentAction implements Action{
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "/view/jsp/mypage2.jsp";
		String userid = request.getParameter("userid");
		
		BookDAO bDao = BookDAO.getInstance();
		List<BookVO> myconmmentlist = bDao.myconmmentlist(userid);
		request.setAttribute("myconmmentlist", myconmmentlist);

		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}
	
}