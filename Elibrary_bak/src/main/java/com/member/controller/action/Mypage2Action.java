package com.member.controller.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.book.dao.BookDAO;
import com.book.dto.BookVO;
import com.novel.dao.NovelDAO;
import com.novel.dto.NovelVO;

public class Mypage2Action implements Action{
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String url = "/view/jsp/mypage2.jsp";	
		String userid = (String)session.getAttribute("userid");
		String nname = (String)session.getAttribute("nname");

		BookDAO bDao = BookDAO.getInstance();
		List<BookVO> mybookList = bDao.mybooklist(userid);
		request.setAttribute("mybookList", mybookList);

		List<BookVO> myconmmentlist = bDao.myconmmentlist(userid);
		request.setAttribute("myconmmentlist", myconmmentlist);
		
		
		NovelDAO nDao = NovelDAO.getInstance();
		List<NovelVO> mynovellist = nDao.mynovellist(nname);
		request.setAttribute("mynovellist", mynovellist);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}
}
