package com.member.controller.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.member.dao.MemberDAO;
import com.member.dto.MemberVO;

public class MemberFindIdAction implements Action {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = null;
		String nname = request.getParameter("nname");
		int question = Integer.parseInt(request.getParameter("question"));
		String answer = request.getParameter("answer");
		
		MemberDAO mDao = MemberDAO.getInstance();
		MemberVO mVo = mDao.selectOneMemberByNname(nname);
		if (mVo != null && mVo.getNname().equals(nname) && mVo.getQuestion()==question && mVo.getAnswer().equals(answer)) { // 성공
			request.setAttribute("userid", mVo.getUserid());
			url = "/view/jsp/memberFindSuccess.jsp";
		} else {// 실패
			url = "/view/jsp/find_Id.jsp";
			request.setAttribute("message", "닉네임과 본인확인 질문, 답이 일치하지 않습니다.");
		}		
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}
}