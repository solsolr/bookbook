package com.book.controller.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.book.dao.BookDAO;
import com.book.dto.BookVO;



public class bookGenrelistAction implements Action{
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "/view/jsp/bookslist.jsp";
		String genre = request.getParameter("genre");
		System.out.println(genre);
		
		BookDAO bDao = BookDAO.getInstance();
		List<BookVO> bookList = bDao.selectGenreBooks(genre);
		request.setAttribute("bookList", bookList);
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}
}
