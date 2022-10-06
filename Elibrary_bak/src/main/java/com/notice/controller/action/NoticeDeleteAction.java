package com.notice.controller.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.notice.dao.NoticeDAO;

public class NoticeDeleteAction implements Action {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		if(session.getAttribute("role") == null || (Integer)session.getAttribute("role")!=1) {
			String url = "NoticeServlet?command=notice_list";
			RequestDispatcher dispatcher = request.getRequestDispatcher(url);
			dispatcher.forward(request, response);
		}
		String num=request.getParameter("num");
		NoticeDAO nDao=NoticeDAO.getInstance();
		nDao.deleteNotice(num);
		new NoticeListAction().execute(request, response);
	}
}
