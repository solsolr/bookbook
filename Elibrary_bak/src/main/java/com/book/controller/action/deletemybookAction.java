package com.book.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.book.dao.BookDAO;
import com.member.controller.action.Mypage2Action;

public class deletemybookAction implements Action{
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String userid = request.getParameter("userid");
		String bno = request.getParameter("bno");
		
		//System.out.println(userid);
		//System.out.println(bno);
		
		BookDAO bDao = BookDAO.getInstance();
		bDao.deletemybook(userid,bno);
		
		new Mypage2Action().execute(request, response);
	}
}
