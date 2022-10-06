package com.book.controller.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.book.dao.BookDAO;
import com.book.dto.BookVO;

public class BcommentInsertAction implements Action {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		BookVO bVo = new BookVO();
		bVo.setUserid(request.getParameter("userid"));
		bVo.setBno(Integer.parseInt(request.getParameter("bno")));
		bVo.setCstar(Integer.parseInt(request.getParameter("cstar")));
		bVo.setCcontent(request.getParameter("ccontent"));
		BookDAO bDao = BookDAO.getInstance();
		bDao.insertBcomment(bVo);
		
		String url = "BookServlet?command=bookdetailedpage&num="+bVo.getBno();
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);		
	}
}
