package com.novel.controller.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.novel.dao.NovelDAO;
import com.novel.dto.NovelVO;

public class novellistAction implements Action{
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "/view/jsp/novellist.jsp";
		
		NovelDAO nDao = NovelDAO.getInstance();
		List<NovelVO> novelList = nDao.selectAllNovel();
		request.setAttribute("novelList", novelList);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}
}
