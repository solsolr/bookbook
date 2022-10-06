package com.novel.controller.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.novel.dao.NovelDAO;
import com.userrecom.dto.UserrecomVO;

public class novel_likeAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int uno = Integer.parseInt(request.getParameter("uno"));
		String userid = request.getParameter("userid");
		NovelDAO nDao = NovelDAO.getInstance();
		if(request.getParameter("userrecom").equals("Y")) {
			nDao.deleteUserRecom(uno, userid);
			nDao.updateLikeCountMinus(uno);
		} else if(request.getParameter("userrecom").equals("N")) {
			nDao.updateUserRecom(uno, userid);
			nDao.updateLikeCountPlus(uno);
		} else {
			UserrecomVO nVo = new UserrecomVO();
			nVo.setUno(uno);
			nVo.setUserid(userid);
			nVo.setRrecom("Y");
			nDao.insertUserRecom(nVo);
			nDao.updateLikeCountPlus(uno);
		}
		
		PrintWriter out = response.getWriter();
		
		if(request.getParameter("userrecom").equals("Y")) {
            out.print("N");
        } else {
            out.print("Y");
        }
	}

}
