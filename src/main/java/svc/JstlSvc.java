package svc;

import java.util.*;
import dao.*;
import vo.*;

public class JstlSvc {
	private JstlDao jstlDao;

	public void setJstlDao(JstlDao jstlDao) {
		this.jstlDao = jstlDao;
	}

	public List<MemberInfo> getMemberList(PageInfo pi) {
		List<MemberInfo> memberList = jstlDao.getMemberList(pi);
		return memberList;
	}
}
