package com.notice.controller.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.notice.dao.NoticeDAO;
import com.notice.dto.NoticeVO;



public class NoticeCheckPassAction implements Action {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = null;
		HttpSession session = request.getSession();
		if(session.getAttribute("role") == null || (Integer)session.getAttribute("role")!=1) {
			url = "NoticeServlet?command=notice_list";
			RequestDispatcher dispatcher = request.getRequestDispatcher(url);
			dispatcher.forward(request, response);
		}
		String num = request.getParameter("num");
		String pass = request.getParameter("pass");
		NoticeDAO nDao = NoticeDAO.getInstance();
		NoticeVO nVo = nDao.selectOneNoticeByNum(num);
		if (nVo.getPass().equals(pass)) { // 성공
			url = "/view/jsp/checkSuccess.jsp";
		} else {// 실패
			url = "/view/jsp/noticeCheckPass.jsp";
			request.setAttribute("message", "비밀번호가 틀렸습니다.");
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}
}
