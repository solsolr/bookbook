package com.novel.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.member.controller.action.Mypage2Action;
import com.novel.dao.NovelDAO;
import com.novel.dto.NovelVO;

public class novel_insertAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		NovelVO nVo = new NovelVO();
		HttpSession session = request.getSession();
		nVo.setNname((String)session.getAttribute("nname"));
		nVo.setUtitle(request.getParameter("utitle"));
		nVo.setUsubtitle(request.getParameter("usubtitle"));
		nVo.setUcontent(request.getParameter("ucontent"));
		nVo.setUimage(request.getParameter("uimage"));
		nVo.setUscale(request.getParameter("uscale"));
		NovelDAO nDao = NovelDAO.getInstance();
		nDao.novel_insert(nVo);
		new Mypage2Action().execute(request, response);		
	}

}
