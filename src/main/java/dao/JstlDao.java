package dao;

import java.util.*;
import java.sql.*;
import javax.sql.*;
import org.springframework.jdbc.core.*;
import org.springframework.jdbc.support.*;
import vo.*;

public class JstlDao {
	private JdbcTemplate jdbc;

	public JstlDao(DataSource dataSource) {
		this.jdbc = new JdbcTemplate(dataSource);
	}

	public List<MemberInfo> getMemberList(PageInfo pi) {
		String sql = "select * from t_member_info ";
		if (pi.getSchtype() != null && !pi.getSchtype().equals("") && 
			pi.getKeyword() != null && !pi.getKeyword().equals("")) {
			sql += " where mi_" + pi.getSchtype() + 
				" like '%" + pi.getKeyword() + "%'";
		}

		List<MemberInfo> memberList = jdbc.query(sql, 
		(ResultSet rs, int rowNum) -> {
			MemberInfo mi = new MemberInfo();
			mi.setMi_id(rs.getString("mi_id"));			mi.setMi_pw(rs.getString("mi_pw"));
			mi.setMi_name(rs.getString("mi_name"));		mi.setMi_gender(rs.getString("mi_gender"));
			mi.setMi_birth(rs.getString("mi_birth"));	mi.setMi_phone(rs.getString("mi_phone"));
			mi.setMi_email(rs.getString("mi_email"));	mi.setMi_isad(rs.getString("mi_isad"));
			mi.setMi_point(rs.getInt("mi_point"));		mi.setMi_status(rs.getString("mi_status"));
			mi.setMi_date(rs.getString("mi_date"));		mi.setMi_lastlogin(rs.getString("mi_lastlogin"));
			return mi;
		});

		return memberList;
	}
}
