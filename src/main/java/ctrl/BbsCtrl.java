package ctrl;

import java.io.*;
import java.util.*;
import javax.servlet.http.*;
import org.springframework.stereotype.*;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import svc.*;
import vo.*;

@Controller
public class BbsCtrl {
	@GetMapping("/bbsFormIn")
	public String bbsFormIn() {
		return "bbs/bbsFormIn";
	}

	@PostMapping("/bbsProcIn")
	public String bbsProcIn(MultipartFile[] uploadFile) {
	// 받아오는 file컨트롤의 이름과 매개변수의 이름이 같아야 함
		String uploadPath = "D:/sey/spring/sprSite/src/main/webapp/resources/img";
		String files = "";
		for (MultipartFile file : uploadFile) {
			File saveFile = new File(uploadPath, file.getOriginalFilename());
			// 저장할 파일 객체 생성
			try {
				file.transferTo(saveFile);
				files += "," + file.getOriginalFilename();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return "redirect:/bbsView?files=" + files.substring(1);
	}

	@GetMapping("/bbsView")
	public String bbsView(Model model, HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("utf-8");
		String[] files = request.getParameter("files").split(",");
		model.addAttribute("files", files);
		return "bbs/bbsView";
	}
}
