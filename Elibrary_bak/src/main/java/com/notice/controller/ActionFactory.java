package com.notice.controller;

import com.notice.controller.action.Action;
import com.notice.controller.action.NoticeCheckPassAction;
import com.notice.controller.action.NoticeCheckPassFormAction;
import com.notice.controller.action.NoticeDeleteAction;
import com.notice.controller.action.NoticeListAction;
import com.notice.controller.action.NoticeUpdateAction;
import com.notice.controller.action.NoticeUpdateFormAction;
import com.notice.controller.action.NoticeViewAction;
import com.notice.controller.action.NoticeWriteAction;
import com.notice.controller.action.NoticeWriteFormAction;

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
		/* 추가된 부분 */
		if (command.equals("notice_list")) {
			action = new NoticeListAction();
		} else if (command.equals("notice_write_form")) {
			action = new NoticeWriteFormAction();
		} else if (command.equals("notice_write")) {
			action = new NoticeWriteAction();
		} else if (command.equals("notice_view")) {
			action = new NoticeViewAction();
		} else if (command.equals("notice_check_pass_form")) {
			action = new NoticeCheckPassFormAction();
		} else if (command.equals("notice_check_pass")) {
			action = new NoticeCheckPassAction();
		} else if (command.equals("notice_update_form")) {
			action = new NoticeUpdateFormAction();
		} else if (command.equals("notice_update")) {
			action = new NoticeUpdateAction();
		} else if (command.equals("notice_delete")) {
			action = new NoticeDeleteAction();
		}
		return action;
	}
}
