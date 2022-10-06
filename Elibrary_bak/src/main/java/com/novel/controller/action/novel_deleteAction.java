package com.novel.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.member.controller.action.Mypage2Action;
import com.novel.dao.NovelDAO;

public class novel_deleteAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int uno=Integer.parseInt(request.getParameter("uno"));
		NovelDAO nDao=NovelDAO.getInstance();
		nDao.deletemynovel(uno);
		new Mypage2Action().execute(request, response);
		
	}

}
