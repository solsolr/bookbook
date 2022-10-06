package com.book.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.book.dao.BookDAO;
import com.member.controller.action.Mypage2Action;

public class deletemyconmmentAction implements Action{
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String userid = request.getParameter("userid");
		String bno = request.getParameter("bno");
		String cno = request.getParameter("cno");
		
		BookDAO bDao = BookDAO.getInstance();
		bDao.deletemyconmment(userid,bno,cno);
		
		new Mypage2Action().execute(request, response);
	}
}
