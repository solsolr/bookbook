package com.book.controller.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.book.dao.BookDAO;
import com.book.dto.BookVO;

public class bookdetailedpageAction implements Action{
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "/view/jsp/bookdetailedpage.jsp";
		String num = request.getParameter("num");
		
		BookDAO bDao = BookDAO.getInstance();
		BookVO bVo = bDao.bookdetailedpage(num);
		request.setAttribute("detaile", bVo);
		List<BookVO> bcommentList = bDao.selectAllBcomment(num);
		request.setAttribute("bcommentList", bcommentList);

		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}
}
