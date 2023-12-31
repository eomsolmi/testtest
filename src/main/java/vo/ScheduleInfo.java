package vo;

public class ScheduleInfo {
	private int si_idx;
	private String mi_id, si_date, si_time, si_content, si_regdate;

	public ScheduleInfo(int si_idx, String mi_id, String si_date, 
		String si_time, String si_content, String si_regdate) {
		this.si_idx = si_idx;			this.mi_id = mi_id;
		this.si_date = si_date;			this.si_time = si_time;
		this.si_content = si_content;	this.si_regdate = si_regdate;
	}

	public int getSi_idx() {
		return si_idx;
	}
	public void setSi_idx(int si_idx) {
		this.si_idx = si_idx;
	}
	public String getMi_id() {
		return mi_id;
	}
	public void setMi_id(String mi_id) {
		this.mi_id = mi_id;
	}
	public String getSi_date() {
		return si_date;
	}
	public void setSi_date(String si_date) {
		this.si_date = si_date;
	}
	public String getSi_time() {
		return si_time;
	}
	public void setSi_time(String si_time) {
		this.si_time = si_time;
	}
	public String getSi_content() {
		return si_content;
	}
	public void setSi_content(String si_content) {
		this.si_content = si_content;
	}
	public String getSi_regdate() {
		return si_regdate;
	}
	public void setSi_regdate(String si_regdate) {
		this.si_regdate = si_regdate;
	}
}
