package kakaoApi;

import java.io.*;
import java.net.*;
import java.util.*;
import javax.servlet.http.*;
import org.json.simple.*;
import org.json.simple.parser.*;
import org.springframework.stereotype.*;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class KakaoCtrl {
	private KakaoSvc kakaoSvc;

	public void setKakaoSvc(KakaoSvc kakaoSvc) {
		this.kakaoSvc = kakaoSvc;
	}
	
	@GetMapping("/kakaoMap")	// "/" : 루트 (ex:프로젝트이름까지)
	public String kakaoMap() {	// 다른 곳에서 접근하기 때문에 public / return하는 값이 string 이기 때문에 String
		return "kakao/kakaoMap";
	}
	
	@GetMapping("/kakaoBook")
	public String kakaoBook() {
		return "kakao/kakaoBook";
	}
	
	@GetMapping("/kakaoLogin")
	public String kakaoLogin() {
		return "kakao/kakaoLogin";
	}
	
	@GetMapping("/kakaoLoginProc")
	public String kakaoLoginProc(Model model, String code) throws Exception {
//		System.out.println(code);
		// code : kakao.com으로부터 정보를 받기 위한 코드값
		String accessToken = kakaoSvc.getAccessToken(code);
		// 로그인 정보를 받기 위한 코드를 받아옴
		HashMap<String, String> loginInfo = kakaoSvc.getUserInfo(accessToken);
		// 실제 데이터를 HashMap 인스턴스로 받아옴
		
		System.out.println("loginInfo : " + loginInfo);
		System.out.println("nickname : " + loginInfo.get("nickname"));
		System.out.println("gender : " + loginInfo.get("gender"));
		System.out.println("birthday : " + loginInfo.get("birthday"));
		
		model.addAttribute("loginInfo", loginInfo);
		
		return "redirect:/";	// 로그인 처리 후 이동할 페이지 주소	
		// url에서 proc을 보여주지 않기 위해 redirect로 이동함 (spring은 기본이 dispatcher방식이기 때문에)
	}
}
