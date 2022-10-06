package com.member.controller.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.member.dao.MemberDAO;
import com.member.dto.MemberVO;

public class MemberCheckPassAction implements Action {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = null;
		String userid = request.getParameter("userid");
		String pass = request.getParameter("pass");
		MemberDAO mDao = MemberDAO.getInstance();
		MemberVO mVo = mDao.selectOneMemberByUserid(userid);
		if (mVo.getPw().equals(pass)) { // 성공
			url = "/view/jsp/membercheckSuccess.jsp";
		} else {// 실패
			url = "/view/jsp/memberCheckPass.jsp";
			request.setAttribute("message", "비밀번호가 틀렸습니다.");
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}
}
