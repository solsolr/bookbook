package com.elibrary.controller.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.elibrary.dao.ElibraryDAO;
import com.elibrary.dto.ElibraryVO;



public class mainAction implements Action{
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "/view/jsp/main_bxslider.jsp";
		ElibraryDAO eDao = ElibraryDAO.getInstance();
		
		List<ElibraryVO> bookList = eDao.selectAllBooks_main();
		request.setAttribute("bookList", bookList);
		
		List<ElibraryVO> latestbookList = eDao.selectLatestBooks_main();
		request.setAttribute("latestbookList", latestbookList);
		
		List<ElibraryVO> selectMainNovel = eDao.selectMainNovel();
		request.setAttribute("selectMainNovel", selectMainNovel);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}
}
