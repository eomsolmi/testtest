package svc;

import java.util.List;

import org.json.simple.JSONObject;

import dao.*;
import vo.*;

public class VueSvc {
	private VueDao vueDao;

	public void setVueDao(VueDao vueDao) {
		this.vueDao = vueDao;
	}

	public List<FreeReply> getFreeReplyList(int flidx) {
		List<FreeReply> replyList = vueDao.getFreeReplyList(flidx);
		return replyList;
	}

	public int replyDel(int fridx, int flidx) {
		int result = vueDao.replyDel(fridx, flidx);
		return result;
	}

	public JSONObject replyInsert(FreeReply fr) {
		JSONObject jo = vueDao.replyInsert(fr);
		return jo;
	}

	public int replyUpdate(FreeReply fr) {
		int result = vueDao.replyUpdate(fr);
		return result;
	}

}
