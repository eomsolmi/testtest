package ctrl;

import java.io.*;
import java.net.*;
import java.util.*;
import javax.servlet.http.*;
import org.springframework.ui.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import svc.*;
import vo.*;

@Controller
public class FreeCtrl {
	private FreeSvc freeSvc;

	public void setFreeSvc(FreeSvc freeSvc) {
		this.freeSvc = freeSvc;
	}

	@GetMapping("/freeList")
	public String freeList(Model model, HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("utf-8");
		int cpage = 1, pcnt = 0, spage = 0, rcnt = 0;
		int psize = 10, bsize = 10, num = 0;
		// 현재 페이지 번호, 페이지 수, 시작페이지, 게시글 수, 페이지 크기, 블록 크기, 번호 등을 저장할 변수
		if (request.getParameter("cpage") != null)
			cpage = Integer.parseInt(request.getParameter("cpage"));
		// 보안상의 이유와 산술연산을 위해 int형으로 형변환함

		String schtype = request.getParameter("schtype");
		String keyword = request.getParameter("keyword");
		String where = " where fl_isview = 'y' ";
		String args = "", schargs = "";
		if (schtype == null || keyword == null) {
			schtype = "";	keyword = "";
		} else if (!schtype.equals("") && !keyword.trim().equals("")) {
			URLEncoder.encode(keyword, "UTF-8");
			keyword = keyword.trim();
			if (schtype.equals("tc")) {	// 검색조건이 '제목+내용'일 경우
				where += " and (fl_title like '%" + keyword + 
					"%' or fl_content like '%" + keyword + "%') ";
			} else {
				where += " and fl_" + schtype + 
					" like '%" + keyword + "%' ";
			}
			schargs = "&schtype=" + schtype + "&keyword=" + keyword;
		}
		args = "&cpage=" + cpage + schargs;

		rcnt = freeSvc.getFreeListCount(where);
		// 검색된 게시글의 총 개수로 게시글 일련번호 출력과 전체 페이지수 계산을 위한 값
		List<FreeList> freeList = freeSvc.getFreeList(where, cpage, psize);

		pcnt = rcnt / psize;	if(rcnt % psize > 0)	pcnt++;
		spage = (cpage - 1) / bsize * bsize + 1;
		num = rcnt - (psize * (cpage - 1));
		PageInfo pi = new PageInfo();
		pi.setBsize(bsize);			pi.setCpage(cpage);
		pi.setPcnt(pcnt);			pi.setPsize(psize);
		pi.setRcnt(rcnt);			pi.setSpage(spage);
		pi.setNum(num);
		pi.setSchtype(schtype);		pi.setKeyword(keyword);
		pi.setArgs(args);			pi.setSchargs(schargs);
		// 페이징에 필요한 정보들과 검색 조건을 PageInfo형 인스턴스에 저장

		model.addAttribute("freeList", freeList);
		model.addAttribute("pi", pi);

		return "bbs/freeList";
	}

	@GetMapping("/freeView")
	public String freeView(Model model, HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("utf-8");
		int flidx = Integer.parseInt(request.getParameter("flidx"));
		int cpage = Integer.parseInt(request.getParameter("cpage"));
		String schtype = request.getParameter("schtype");
		String keyword = request.getParameter("keyword");
		String args = "?cpage=" + cpage;

		if (schtype != null && !schtype.equals("") && 
			keyword != null && !keyword.equals("")) {
			URLEncoder.encode(keyword, "UTF-8");
			args += "&schtype=" + schtype + "&keyword=" + keyword;
		}

		FreeList fl = freeSvc.getFreeInfo(flidx);
		model.addAttribute("fl", fl);
		model.addAttribute("args", args);

		return "bbs/freeView";
	}
}
