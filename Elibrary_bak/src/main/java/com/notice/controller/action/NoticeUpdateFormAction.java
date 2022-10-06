package com.notice.controller.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.notice.dao.NoticeDAO;
import com.notice.dto.NoticeVO;

public class NoticeUpdateFormAction implements Action {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "/view/jsp/noticeUpdate.jsp";
		HttpSession session = request.getSession();
		if(session.getAttribute("role") == null || (Integer)session.getAttribute("role")!=1) {
			url = "NoticeServlet?command=notice_list";
			RequestDispatcher dispatcher = request.getRequestDispatcher(url);
			dispatcher.forward(request, response);
		}
		String num = request.getParameter("num");
		NoticeDAO nDao = NoticeDAO.getInstance();
		nDao.updateReadCount(num);
		NoticeVO nVo = nDao.selectOneNoticeByNum(num);
		request.setAttribute("notice", nVo);
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}
}
