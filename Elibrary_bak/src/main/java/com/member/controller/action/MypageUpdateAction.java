package com.member.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.member.dao.MemberDAO;
import com.member.dto.MemberVO;

public class MypageUpdateAction implements Action {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		MemberVO mVo = new MemberVO();
		mVo.setUserid(request.getParameter("userid"));
		mVo.setNname(request.getParameter("nname"));
		mVo.setPw(request.getParameter("pw"));
		mVo.setQuestion(Integer.parseInt(request.getParameter("question")));
		mVo.setAnswer(request.getParameter("answer"));
		mVo.setPayment(Integer.parseInt(request.getParameter("payment")));
		MemberDAO mDao = MemberDAO.getInstance();
		mDao.updateMember(mVo);
		new Mypage1Action().execute(request, response);
	}
}
