package com.book.controller.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.book.dao.BookDAO;
import com.book.dto.BookVO;
import com.member.controller.action.Mypage1Action;

public class UpdateCcontent implements Action {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		BookVO bVo = new BookVO();
		bVo.setCno(Integer.parseInt(request.getParameter("cno")));
		bVo.setCcontent(request.getParameter("ccontent"));
		bVo.setCstar(Integer.parseInt(request.getParameter("cstar")));
		bVo.setUserid(request.getParameter("userid"));
		BookDAO bDao = BookDAO.getInstance();
		bDao.updateBcomment(bVo);
		
		String url = "view/jsp/updateccontent_form.jsp";
		request.setAttribute("message", "ok");
		request.setAttribute("userid", bVo.getUserid());
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
		//new Mypage2Action().execute(request, response);
	}
}
