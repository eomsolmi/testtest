package dao;

import java.util.*;
import java.sql.*;
import javax.sql.*;
import org.springframework.jdbc.core.*;
import org.springframework.jdbc.support.*;
import vo.*;

public class JsonDao {
	private JdbcTemplate jdbc;

	public JsonDao(DataSource dataSource) {
		this.jdbc = new JdbcTemplate(dataSource);
	}

	public List<MemberInfo> getMemberList(String where) {
		String sql = "select mi_id, mi_birth, mi_phone, mi_point, " + 
		"concat(mi_name, '(', mi_gender, ')') miname " + 
		" from t_member_info where mi_status = 'a' " + where;

		List<MemberInfo> memberList = jdbc.query(sql, 
		(ResultSet rs, int rowNum) -> {
			MemberInfo mi = new MemberInfo();
			mi.setMi_id(rs.getString("mi_id"));
			mi.setMi_name(rs.getString("miname"));
			mi.setMi_birth(rs.getString("mi_birth"));
			mi.setMi_phone(rs.getString("mi_phone"));
			mi.setMi_point(rs.getInt("mi_point"));
			return mi;
		});

		return memberList;
	}
}
