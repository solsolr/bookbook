package com.member.controller.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.member.dao.MemberDAO;
import com.member.dto.MemberVO;

public class MemberCheckIdPassWord implements Action {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = null;
		request.setCharacterEncoding("UTF-8");
		String pw = request.getParameter("pw");
		String userid = request.getParameter("userid");
		MemberDAO mDao = MemberDAO.getInstance();
		MemberVO mVo = mDao.checkIdPassWord(pw, userid);
		if (mVo != null && mVo.getPw().equals(pw) && mVo.getUserid().equals(userid)) { // 성공
			HttpSession session = request.getSession();
			session.setAttribute("userid", userid);
			session.setAttribute("nname", mVo.getNname());
			session.setAttribute("role", mVo.getAdmin());
			// System.out.println("userid: "+userid);
			url = "/view/jsp/index.jsp";
		} else {// 실패
			url = "/view/jsp/login2.jsp";
			request.setAttribute("message", "로그인 실패: 아이디 또는 비밀번호가 틀렸습니다.");
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}
}
