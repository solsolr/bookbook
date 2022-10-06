package com.novel.controller.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.novel.dao.NovelDAO;
import com.novel.dto.NovelVO;

public class novel_updateFormAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "/view/jsp/updatenovel.jsp";
		
		String uno = request.getParameter("uno");
		
		NovelDAO nDao = NovelDAO.getInstance();
		NovelVO nVo = nDao.mynovelonelist(uno);
		request.setAttribute("novel", nVo);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
		
	}

}
