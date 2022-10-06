package com.member.controller.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.member.dao.MemberDAO;
import com.member.dto.MemberVO;

public class MemberUpdatePasswordAction implements Action {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		MemberVO mVo = new MemberVO();
		mVo.setUserid(request.getParameter("userid"));
		mVo.setPw(request.getParameter("pw"));
		MemberDAO mDao = MemberDAO.getInstance();
		mDao.updateMemberPassword(mVo);

		String url = "view/jsp/updatepassword.jsp";
		request.setAttribute("message", "ok");
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}
}
