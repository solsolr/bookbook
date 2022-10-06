package com.notice.controller.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.notice.dao.NoticeDAO;
import com.notice.dto.NoticeVO;

public class NoticeViewAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "/view/jsp/noticeView.jsp";
		String num = request.getParameter("num");
		NoticeDAO nDao = NoticeDAO.getInstance();
		nDao.updateReadCount(num);
		NoticeVO nVo = nDao.selectOneNoticeByNum(num);
		request.setAttribute("notice", nVo);
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}
}
