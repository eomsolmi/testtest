package svc;

import java.util.*;
import dao.*;
import vo.*;

public class JsonSvc {
	private JsonDao jsonDao;

	public void setJsonDao(JsonDao jsonDao) {
		this.jsonDao = jsonDao;
	}

	public List<MemberInfo> getMemberList(String where) {
		List<MemberInfo> memberList = jsonDao.getMemberList(where);
		return memberList;
	}

}
