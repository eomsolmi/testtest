package dao;

import java.util.*;
import java.sql.*;
import javax.sql.*;
import org.springframework.jdbc.core.*;
import org.springframework.jdbc.support.*;
import vo.*;

public class FreeDao {
	private JdbcTemplate jdbc;

	public FreeDao(DataSource dataSource) {
		this.jdbc = new JdbcTemplate(dataSource);
	}

	public int getFreeListCount(String where) {
	// �˻���(�˻�� ���� ���) �Խñ��� �� ������ �����ϴ� �޼ҵ�
		String sql = "select count(*) from t_free_list " + where;
		int rcnt = jdbc.queryForObject(sql, Integer.class);
		return rcnt;
	}

	public List<FreeList> getFreeList(String where, int cpage, int psize) {
	// �Խñ��� ����� FreeList�� �ν��Ͻ��� ������ List�� �����ϴ� �޼ҵ�
		String sql = "select fl_idx, fl_title, fl_reply, fl_writer, fl_read, if(curdate() = date(fl_date), right(fl_date, 8), " + 
		"mid(fl_date, 3, 8)) wdate from t_free_list " + where + " order by fl_idx desc limit " + ((cpage - 1) * psize) + ", " + psize;

		List<FreeList> freeList = jdbc.query(sql, 
		(ResultSet rs, int rowNum) -> {
			FreeList fl = new FreeList();
			fl.setFl_idx(rs.getInt("fl_idx"));
			fl.setFl_writer(rs.getString("fl_writer"));
			fl.setFl_read(rs.getInt("fl_read"));
			fl.setFl_date(rs.getString("wdate").replace("-", "."));

			String title = "";	int cnt = 30;
			if (rs.getInt("fl_reply") > 0) {
				title = " [" + rs.getInt("fl_reply") + "]";
				cnt -= 3;
			}
			if (rs.getString("fl_title").length() > cnt)
				title = rs.getString("fl_title").substring(0, cnt - 3) + "..." + title;
			else
				title = rs.getString("fl_title") + title;
			fl.setFl_title(title);
			return fl;
		});

		return freeList;
	}

	public int readUpdate(int flidx) {
	// ������ �Խñ��� ��ȸ���� 1���� ��Ű�� �޼ҵ�
		String sql = "update t_free_list set fl_read = fl_read + 1 " + 
			" where fl_idx = " + flidx;
		int result = jdbc.update(sql);
		return result;
	}

	public FreeList getFreeInfo(int flidx) {
	// ������ �Խñ��� ������ FreeList�� �ν��Ͻ��� �����ϴ� �޼ҵ�
		int result = readUpdate(flidx);	// ��ȸ�� ����

		String sql = "select * from t_free_list " + 
		" where fl_isview = 'y' and fl_idx = " + flidx;
		FreeList fl = jdbc.queryForObject(sql, 
		new RowMapper<FreeList>() {
			@Override
			public FreeList mapRow(ResultSet rs, int rowNum) throws SQLException {
				FreeList fl = new FreeList();
				fl.setFl_idx(rs.getInt("fl_idx"));
				fl.setFl_ismem(rs.getString("fl_ismem"));
				fl.setFl_writer(rs.getString("fl_writer"));
				fl.setFl_title(rs.getString("fl_title"));
				fl.setFl_content(rs.getString("fl_content").replace("\r\n", "<br />"));
				fl.setFl_reply(rs.getInt("fl_reply"));
				fl.setFl_read(rs.getInt("fl_read"));
				fl.setFl_ip(rs.getString("fl_ip"));
				fl.setFl_date(rs.getString("fl_date"));
				return fl;
			}
		});

		return fl;
	}
}