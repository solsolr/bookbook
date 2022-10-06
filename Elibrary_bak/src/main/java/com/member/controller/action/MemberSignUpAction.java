package com.member.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.elibrary.controller.action.mainAction;
import com.member.dao.MemberDAO;
import com.member.dto.MemberVO;

public class MemberSignUpAction implements Action {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		MemberVO mVo = new MemberVO();
		mVo.setUserid(request.getParameter("userid"));
		mVo.setPw(request.getParameter("pw"));
		mVo.setNname(request.getParameter("nname"));
		mVo.setQuestion(Integer.parseInt(request.getParameter("question")));
		mVo.setAnswer(request.getParameter("answer"));
		MemberDAO mDao = MemberDAO.getInstance();
		mDao.insertMember(mVo);
		new mainAction().execute(request, response);
	}
}
