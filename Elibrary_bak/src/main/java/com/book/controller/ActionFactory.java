package com.book.controller;


import com.book.controller.action.Action;
import com.book.controller.action.BcommentInsertAction;
import com.book.controller.action.UpdateCcontent;
import com.book.controller.action.UpdateCcontentForm;
import com.book.controller.action.addmybookAction;
import com.book.controller.action.bookGenrelistAction;
import com.book.controller.action.bookdetailedpageAction;
import com.book.controller.action.booklistAction;
import com.book.controller.action.deletemybookAction;
import com.book.controller.action.deletemyconmmentAction;


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
		if(command.equals("booklist")) {
			action = new booklistAction();
		}else if (command.equals("bookdetailedpage")) {
			action = new bookdetailedpageAction();
		}else if (command.equals("bookgenrelist")) {
			action = new bookGenrelistAction();
		}else if (command.equals("deletemybook")) {
			action = new deletemybookAction();
		}else if (command.equals("addmybook")) {
			action = new addmybookAction();
		}else if (command.equals("bcomment_insert")) {
			action = new BcommentInsertAction();
		}else if (command.equals("update_ccontent_form")) {
			action = new UpdateCcontentForm();
		}else if (command.equals("ccontent_update")) {
			action = new UpdateCcontent();
		}else if (command.equals("deletemyconmment")) {
			action = new deletemyconmmentAction();	
		}
		return action;
	}
}