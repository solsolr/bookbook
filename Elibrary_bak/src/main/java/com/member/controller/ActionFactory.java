package com.member.controller;

import com.member.controller.action.Action;
import com.member.controller.action.MemberCheckIdPassWord;
import com.member.controller.action.MemberCheckPassAction;
import com.member.controller.action.MemberCheckPassFormAction;
import com.member.controller.action.MemberDeleteAction;
import com.member.controller.action.MemberFindIdAction;
import com.member.controller.action.MemberFindPasswordAction;
import com.member.controller.action.MemberFineFormAction;
import com.member.controller.action.MemberLoginFormAction;
import com.member.controller.action.MemberLogout;
import com.member.controller.action.MemberSignUpAction;
import com.member.controller.action.MemberSignUpFormAction;
import com.member.controller.action.MemberUpdatePasswordAction;
import com.member.controller.action.MemberUpdatePasswordFormAction;
import com.member.controller.action.Mypage1Action;
import com.member.controller.action.Mypage2Action;
import com.member.controller.action.MypageUpdateAction;

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
		if (command.equals("login_form")) {
			action = new MemberLoginFormAction();
		} else if(command.equals("login")) {
			action = new MemberCheckIdPassWord();
		} else if(command.equals("logout")) {
			action = new MemberLogout();
		} else if (command.equals("sign_up")) {
			action = new MemberSignUpAction();	
		}else if (command.equals("sign_up_form")) {
			action = new MemberSignUpFormAction();
		}else if (command.equals("mypage1")) {
			action = new Mypage1Action();
		}else if (command.equals("mypage2")) {
			action = new Mypage2Action();
		}else if (command.equals("mypage1_update_member")) {
			action = new MypageUpdateAction();
		}else if (command.equals("member_check_pass_form")) {
			action = new MemberCheckPassFormAction();
		} else if (command.equals("member_check_pass")) {
			action = new MemberCheckPassAction();
		} else if (command.equals("member_delete")) {
			action = new MemberDeleteAction();
		}else if (command.equals("member_fine_form")) {
			action = new MemberFineFormAction();
		} else if (command.equals("member_id_fine")) {
			action = new MemberFindIdAction();
		} else if (command.equals("member_password_fine")) {
			action = new MemberFindPasswordAction();
		} else if (command.equals("member_password_update_form")) {
			action = new MemberUpdatePasswordFormAction();
		}else if (command.equals("member_password_update")) {
			action = new MemberUpdatePasswordAction();
		}
		return action;
	}
}