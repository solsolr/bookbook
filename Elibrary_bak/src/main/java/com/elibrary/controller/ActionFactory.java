package com.elibrary.controller;

import com.elibrary.controller.action.Action;
import com.elibrary.controller.action.booksearchpageAction;
import com.elibrary.controller.action.mainAction;

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
		if(command.equals("main")) {
			action = new mainAction();
		}else if (command.equals("booksearchpage")) {
			action = new booksearchpageAction();
		}
		return action;
	}
}