package svc;

import java.sql.SQLException;

import org.springframework.transaction.annotation.*;
import dao.*;
import vo.*;

public class MemberSvc {
	private MemberDao memberDao;

	public void setMemberDao(MemberDao memberDao) {
		this.memberDao = memberDao;
	}

	@Transactional(rollbackFor = SQLException.class)
	public int memberInsert(MemberInfo mi) {
		int result = memberDao.memberInsert(mi);
		result += memberDao.memberPoint(mi.getMi_id());
		return result;
	}

	public int chkDupId(String uid) {
		int result = memberDao.chkDupId(uid);
		return result;
	}

	public int memberUpdate(MemberInfo mi) {
		int result = memberDao.memberUpdate(mi);
		return result;
	}
}
