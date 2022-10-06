package com.novel.controller.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.novel.dao.NovelDAO;
import com.novel.dto.NovelVO;




public class novel_boardAction implements Action{
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "/view/jsp/novel_board.jsp";
	
	String title = request.getParameter("title");
	NovelDAO nDao = NovelDAO.getInstance();
	List<NovelVO> novelbord = nDao.novelboarddpage(title);
	request.setAttribute("novelbord", novelbord);
	//System.out.print(title);
	

	
	RequestDispatcher dispatcher = request.getRequestDispatcher(url);
	dispatcher.forward(request, response);	
	}
}