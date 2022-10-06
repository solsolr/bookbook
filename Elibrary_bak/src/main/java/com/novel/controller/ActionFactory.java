package com.novel.controller;


import com.novel.controller.action.Action;
import com.novel.controller.action.novel_boardAction;
import com.novel.controller.action.novel_deleteAction;
import com.novel.controller.action.novel_insertAction;
import com.novel.controller.action.novel_likeAction;
import com.novel.controller.action.novel_updateAction;
import com.novel.controller.action.novel_updateFormAction;
import com.novel.controller.action.novel_viewAction;
import com.novel.controller.action.novel_writeformAction;
import com.novel.controller.action.novellistAction;


public class ActionFactory {
	private static ActionFactory instance = new ActionFactory();

	private ActionFactory() {
		super();
	}

	public static ActionFactory getInstance() {
		return instance;
	}
	
	public Action getAction(String command) {
		Action action = null;
		System.out.println("ActionFactory :" + command);
		if(command.equals("novellist")) {
			action = new novellistAction();
		}else if(command.equals("novel_board")) {
			action = new novel_boardAction();
		}else if(command.equals("novel_View")) {
			action = new novel_viewAction();
		}else if(command.equals("novel_like"))  {
			action = new novel_likeAction();
		}else if(command.equals("updatemybookform")) {
			action = new novel_updateFormAction();
		}else if(command.equals("updatemybook")) {
			action = new novel_updateAction();
		}else if(command.equals("deletemybook")) {
			action = new novel_deleteAction();
		}else if(command.equals("novel_writeform")) {
			action = new novel_writeformAction();
		}else if(command.equals("novel_insert")) {
			action = new novel_insertAction();
		}
			
		return action;
	}
}