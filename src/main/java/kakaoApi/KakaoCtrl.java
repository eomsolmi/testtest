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
	
	@GetMapping("/kakaoMap")	// "/" : ��Ʈ (ex:������Ʈ�̸�����)
	public String kakaoMap() {	// �ٸ� ������ �����ϱ� ������ public / return�ϴ� ���� string �̱� ������ String
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
		// code : kakao.com���κ��� ������ �ޱ� ���� �ڵ尪
		String accessToken = kakaoSvc.getAccessToken(code);
		// �α��� ������ �ޱ� ���� �ڵ带 �޾ƿ�
		HashMap<String, String> loginInfo = kakaoSvc.getUserInfo(accessToken);
		// ���� �����͸� HashMap �ν��Ͻ��� �޾ƿ�
		
		System.out.println("loginInfo : " + loginInfo);
		System.out.println("nickname : " + loginInfo.get("nickname"));
		System.out.println("gender : " + loginInfo.get("gender"));
		System.out.println("birthday : " + loginInfo.get("birthday"));
		
		model.addAttribute("loginInfo", loginInfo);
		
		return "redirect:/";	// �α��� ó�� �� �̵��� ������ �ּ�	
		// url���� proc�� �������� �ʱ� ���� redirect�� �̵��� (spring�� �⺻�� dispatcher����̱� ������)
	}
}
