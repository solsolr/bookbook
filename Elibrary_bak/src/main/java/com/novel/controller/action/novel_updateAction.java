package com.novel.controller.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.member.controller.action.Mypage2Action;
import com.novel.dao.NovelDAO;
import com.novel.dto.NovelVO;


public class novel_updateAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		request.setAttribute("command", "mypage2");
		request.setAttribute("userid", session.getAttribute("userid"));
		request.setAttribute("nname", session.getAttribute("nname"));

		String url = "MemberServlet";
		
		NovelVO nVo = new NovelVO();
		nVo.setUno(Integer.parseInt(request.getParameter("uno")));
		nVo.setUsubtitle(request.getParameter("usubtitle"));
		nVo.setUcontent(request.getParameter("ucontent"));
		nVo.setUimage(request.getParameter("uimage"));
		NovelDAO nDao = NovelDAO.getInstance();
		nDao.updatemynovel(nVo);
		
		new Mypage2Action().execute(request, response);
	}

}
