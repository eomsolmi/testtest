package vo;

public class PageInfo {
	private int cpage, pcnt, spage, rcnt, psize, bsize, num;
	// 현재 페이지 번호, 페이지 수, 시작페이지, 게시글 수, 페이지 크기, 블록 크기, 번호
	private String schtype, keyword, args, schargs;
	// 검색조건, 검색어, 페이지 쿼리스트링, 검색 쿼리스트링

	public int getCpage() {
		return cpage;
	}
	public void setCpage(int cpage) {
		this.cpage = cpage;
	}
	public int getPcnt() {
		return pcnt;
	}
	public void setPcnt(int pcnt) {
		this.pcnt = pcnt;
	}
	public int getSpage() {
		return spage;
	}
	public void setSpage(int spage) {
		this.spage = spage;
	}
	public int getRcnt() {
		return rcnt;
	}
	public void setRcnt(int rcnt) {
		this.rcnt = rcnt;
	}
	public int getPsize() {
		return psize;
	}
	public void setPsize(int psize) {
		this.psize = psize;
	}
	public int getBsize() {
		return bsize;
	}
	public void setBsize(int bsize) {
		this.bsize = bsize;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getSchtype() {
		return schtype;
	}
	public void setSchtype(String schtype) {
		this.schtype = schtype;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getArgs() {
		return args;
	}
	public void setArgs(String args) {
		this.args = args;
	}
	public String getSchargs() {
		return schargs;
	}
	public void setSchargs(String schargs) {
		this.schargs = schargs;
	}
}
