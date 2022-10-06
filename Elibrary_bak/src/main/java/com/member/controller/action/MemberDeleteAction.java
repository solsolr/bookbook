package com.member.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import com.elibrary.controller.action.mainAction;
import com.member.dao.MemberDAO;

public class MemberDeleteAction implements Action {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String userid=request.getParameter("userid");
		MemberDAO mDao=MemberDAO.getInstance();
		mDao.deleteMember(userid);
		HttpSession session = request.getSession();
		session.invalidate();
		new mainAction().execute(request, response);
	}
}
