package com.notice.controller.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.notice.dao.NoticeDAO;
import com.notice.dto.NoticeVO;


public class NoticeListAction implements Action{
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "/view/jsp/noticeList.jsp";
		NoticeDAO nDao = NoticeDAO.getInstance();
		List<NoticeVO> noticeList = nDao.selectAllNotices();
		request.setAttribute("noticeList", noticeList);
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}
}
