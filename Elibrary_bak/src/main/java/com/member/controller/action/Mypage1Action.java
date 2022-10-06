package com.member.controller.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.member.dao.MemberDAO;
import com.member.dto.MemberVO;

public class Mypage1Action implements Action{
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "/view/jsp/mypage1.jsp";
		HttpSession session = request.getSession();
		String userid = (String)session.getAttribute("userid");
		MemberDAO mDao = MemberDAO.getInstance();
		MemberVO mVo = mDao.selectOneMemberByUserid(userid);
		request.setAttribute("member", mVo);
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		session.setAttribute("nname", mVo.getNname());
		dispatcher.forward(request, response);
	}
}
