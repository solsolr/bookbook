package com.novel.controller.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.novel.dao.NovelDAO;
import com.novel.dto.NovelVO;


public class novel_viewAction implements Action{
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "/view/jsp/novelView.jsp";
		String num = request.getParameter("num");
		NovelDAO nDao = NovelDAO.getInstance();
		nDao.updateReadCount(num);
		NovelVO nVo = nDao.selectNovelRead(num);	
		request.setAttribute("novel",nVo);
		HttpSession session = request.getSession();
		if(session.getAttribute("userid")!="") {
			String userrecom = nDao.userrecomCheck(num, (String)session.getAttribute("userid"));
			request.setAttribute("userrecom",userrecom);
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);	
	}
}
