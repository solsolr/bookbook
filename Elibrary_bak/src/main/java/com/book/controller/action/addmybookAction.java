package com.book.controller.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.book.dao.BookDAO;
import com.book.dto.BookVO;



public class addmybookAction implements Action{
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String userid = request.getParameter("userid");
		String bno = request.getParameter("num");
		String url = null;

		BookDAO bDao = BookDAO.getInstance();
		BookVO bVo = bDao.checkaddmybook(userid, bno);
		if (bVo != null && bVo.getUserid().equals(userid) && Integer.toString(bVo.getBno()).equals(bno)){
			//System.out.print("조건안걸림1");
			url = "BookServlet?command=bookdetailedpage&num="+bno;
			request.setAttribute("message", "이미 대여한 도서 입니다.");
			
			RequestDispatcher dispatcher = request.getRequestDispatcher(url);
			dispatcher.forward(request, response);
			
		}else {
			System.out.print("조건안걸림2");
			bDao.addmybook(userid,bno);
			url = "BookServlet?command=bookdetailedpage&num="+bno;
			request.setAttribute("message", "정상적으로 처리되었습니다.");
			
			RequestDispatcher dispatcher = request.getRequestDispatcher(url);
			dispatcher.forward(request, response);
		}

//		if (bVo != null && bVo.getUserid().equals(userid) && Integer.valueOf(bVo.getBno()).equals(bno)) {
//			request.setAttribute("message", "이미 대여한 도서 입니다.");
//
//		}else {
//			bDao.addmybook(userid,bno);
//			new bookdetailedpageAction().execute(request, response);
//		}

		
		
	}

}
