package com.elibrary.controller.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.elibrary.dao.ElibraryDAO;
import com.elibrary.dto.ElibraryVO;

public class booksearchpageAction implements Action{
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "/view/jsp/booksearchpage.jsp";
		String keyword = request.getParameter("keyword");
		ElibraryDAO eDao = ElibraryDAO.getInstance();
		
		List<ElibraryVO> searchList = eDao.searchbook(keyword);
		request.setAttribute("searchList", searchList);
	
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}
}