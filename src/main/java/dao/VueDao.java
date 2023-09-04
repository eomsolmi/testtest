package dao;

import java.util.*;
import java.sql.*;
import javax.sql.*;

import org.json.simple.JSONObject;
import org.springframework.jdbc.core.*;
import org.springframework.jdbc.support.*;
import vo.*;

public class VueDao {
	private JdbcTemplate jdbc;

	public VueDao(DataSource dataSource) {
		this.jdbc = new JdbcTemplate(dataSource);
	}

	public List<FreeReply> getFreeReplyList(int flidx) {

		String sql = "select fr_idx, mi_id, fr_content, fr_ip, concat(mid(fr_date, 3, 2), '/', mid(fr_date, 6, 2), '/', mid(fr_date, 9, 2)" + 
		", ' ', mid(fr_date, 12, 5)) wdate from t_free_reply where fr_isview = 'y' and fl_idx = " + flidx;
//		System.out.println(sql);
		List<FreeReply> replyList = jdbc.query(sql, 
		(ResultSet rs, int rowNum) -> {
			FreeReply fr = new FreeReply(); 
			fr.setFr_idx(rs.getInt("fr_idx")); 
			fr.setMi_id(rs.getString("mi_id")); 
			fr.setFr_content(rs.getString("fr_content").replaceAll("\r\n", "<br />")); 
			fr.setFr_ip(rs.getString("fr_ip")); 
			fr.setFr_date(rs.getString("wdate"));
			return fr;
		});

		return replyList;
	}

	public int replyDel(int fridx, int flidx) {
		String sql = "delete from t_free_reply_gnb where fr_idx = " + fridx;
		// �����Ϸ��� ����� �����ϴ� Ÿ ���̺��� ���ڵ带 ���� ������ �� ����� �����ؾ��� (�������Ἲ�� ������� �ʰ�
		int result = jdbc.update(sql);
		
		sql = "delete from t_free_reply where fr_idx = " + fridx;
		result = jdbc.update(sql);

		if (result == 1) {	// ����� ���� �Ǿ�����
			sql = "update t_free_list set fl_reply = fl_reply - 1 where fl_reply > 0 and fl_idx = " + flidx;
			jdbc.update(sql);
			// ��۰����� 0���� Ŭ�� ���� (���̳ʽ��� �Ǵ� ���� ����)
			// ����� ���ϴ� �Խñ��� ��� �� 1����
		}
		
		return result;
	}
	
	public JSONObject replyInsert(FreeReply fr) {
		String sql = "insert into t_free_reply (fl_idx, mi_id, fr_content, fr_ip) values (?, ?, ?, ?)";
		int result = jdbc.update(sql, fr.getFl_idx(), fr.getMi_id(), fr.getFr_content(), fr.getFr_ip());
		
		JSONObject jo = null;
		// �ۿ����� JSONObject�� �� �� �ֵ��� �ۿ��� ����
		if (result == 1) {
			sql = "update t_free_list set fl_reply = fl_reply + 1 where fl_idx = " + fr.getFl_idx();
			jdbc.update(sql);
			// ����� �߰� �Ǿ����Ƿ� �Խñ��� ��� �� 1����
			
			sql = "select fr_idx, mi_id, fr_content, fr_ip, concat(mid(fr_date, 3, 2), '/', mid(fr_date, 6, 2), '/', mid(fr_date, 9, 2), ' ', mid(fr_date, 12, 5)) wdate from t_free_reply " + 
			" where fl_idx = " + fr.getFl_idx() + " order by fr_idx desc limit 0, 1";
			jo = jdbc.queryForObject(sql, new RowMapper<JSONObject>() {
				@Override
				public JSONObject mapRow(ResultSet rs, int rowNum) throws SQLException {
					JSONObject jo = new JSONObject();
					jo.put("fridx", rs.getInt("fr_idx"));
					jo.put("miid", fr.getMi_id());
					jo.put("frip", fr.getFr_ip());
					jo.put("frcontent", fr.getFr_content());
					jo.put("frdate", rs.getString("wdate"));
					return jo;
				}
			});
		}
		return jo;
	}

	public int replyUpdate(FreeReply fr) {
		String sql = "update t_free_reply set fr_content = '" + fr.getFr_content() + "' where fr_idx = " + fr.getFr_idx();
		int result = jdbc.update(sql);
		return result;
	}
	
}
