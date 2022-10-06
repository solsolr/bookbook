package com.member.controller.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.member.dao.MemberDAO;
import com.member.dto.MemberVO;

public class MemberFindPasswordAction implements Action {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = null;
		String userid = request.getParameter("userid");
		int question = Integer.parseInt(request.getParameter("question"));
		String answer = request.getParameter("answer");
		
		MemberDAO mDao = MemberDAO.getInstance();
		MemberVO mVo = mDao.selectOneMemberByUserid(userid);
		if (mVo != null && mVo.getUserid().equals(userid) && mVo.getQuestion()==question && mVo.getAnswer().equals(answer)) { // 성공
			request.setAttribute("userid", mVo.getUserid());
			url = "/view/jsp/memberFindSuccess.jsp";
		} else {// 실패
			url = "/view/jsp/find_Password.jsp";
			request.setAttribute("message", "userid와 본인확인 질문, 답이 일치하지 않습니다.");
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}
}
