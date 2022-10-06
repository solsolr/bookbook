package com.notice.controller.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.notice.dao.NoticeDAO;
import com.notice.dto.NoticeVO;



public class NoticeUpdateAction implements Action {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		if(session.getAttribute("role") == null || (Integer)session.getAttribute("role")!=1) {
			String url = "NoticeServlet?command=notice_list";
			RequestDispatcher dispatcher = request.getRequestDispatcher(url);
			dispatcher.forward(request, response);
		}
		NoticeVO nVo = new NoticeVO();
		nVo.setNum(Integer.parseInt(request.getParameter("num")));
		nVo.setNname(request.getParameter("nname"));
		nVo.setPass(request.getParameter("pass"));
		nVo.setTitle(request.getParameter("title"));
		nVo.setContent(request.getParameter("content"));
		NoticeDAO nDao = NoticeDAO.getInstance();
		nDao.updateNotice(nVo);
		new NoticeListAction().execute(request, response);
	}
}
