package kakaoApi;

import java.io.*;
import java.net.*;
import java.util.*;
import org.json.simple.*;
import org.json.simple.parser.*;
import dao.*;
import vo.*;

public class KakaoSvc {
	public String getAccessToken(String code) {
		String access_token = "";
		String refresh_token = "";
		String reqURL = "https://kauth.kakao.com/oauth/token";
		
		try {
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection)url.openConnection();
			conn.setRequestMethod("POST");	// ��û�� post ��Ļ��
			conn.setDoOutput(true);			// post����� ����ϱ� ���� ����
			
			// post��û�� �ʿ��� �Ķ���� ����
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			StringBuilder sb = new StringBuilder();		// StringBuilder : String�ε� ��ȭ�� ���� ��� ���
			sb.append("grant_type=authorization_code");
			sb.append("&client_id=e6e39e7bba5c80547748496afe439595");
			sb.append("&redirect_uri=http://localhost:8086/sprMvcTest/kakaoLoginProc");
			sb.append("&code=" + code);
			bw.write(sb.toString());
			bw.flush();
			// conn��ü�� ��ϵ� url�� bw�� �Ķ���͵��� ������ ����(����)
			
			int responseCode = conn.getResponseCode();
			System.out.println("responseCode : " + responseCode);
			// ���� 200�̸� ����
			
			// ��û�� ���� ���� JSON������ Response �޽��� �о����
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line = "", result = "";
			while ((line = br.readLine()) != null) {
				result += line;
			}
			System.out.println("result : " + result);
			// result : {"access_token":"9SAzVzh04Gol9aqwqHTOZ9X2r9TjFrArJKmbIWKQCj10aAAAAYn8Mcww","token_type":"bearer","refresh_token":"6m-mqPlrwQh4EoAXQfNs0z60p5W3ZWoeEhzjKeHoCj10aAAAAYn8Mcwv","expires_in":7199,"scope":"profile_nickname","refresh_token_expires_in":5183999}
			
			// JSON�Ľ� �� JSONObject��ü ����
			JSONParser p = new JSONParser();
			JSONObject jo = (JSONObject)p.parse(result);
			access_token = (String)jo.get("access_token");
			// ���� �����͸� ������ �� �ִ� �ڵ尪
			refresh_token = (String)jo.get("access_token");
			
			br.close();		bw.close();
			
		} catch(Exception e) {
			System.out.println("getAccessToken() �޼ҵ� ����");
			e.printStackTrace();
		}
		
		return access_token;
	}

	public HashMap<String, String> getUserInfo(String accessToken) {
		// ��û�ϴ� Ŭ���̾�Ʈ���� ���� ������ �ٸ� �� �ֱ⿡ HashMapŸ������ ����
		HashMap<String, String> loginInfo = new HashMap<String, String>();
		String reqURL = "https://kapi.kakao.com/v2/user/me";
		
		try {
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection)url.openConnection();
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Authorization", "Bearer " + accessToken);
			
			int responseCode = conn.getResponseCode();
			System.out.println("responseCode : " + responseCode);
			// ���� 200�̸� ����
			
			// ��û�� ���� ���� JSON������ Response �޽��� �о����
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line = "", result = "";
			while ((line = br.readLine()) != null) {
				result += line;
			}
			System.out.println("result : " + result);
			// result : {"id":2967339527,"connected_at":"2023-08-16T05:09:50Z","properties":{"nickname":"?��?���?"},"kakao_account":{"profile_nickname_needs_agreement":false,"profile":{"nickname":"?��?���?"},"has_email":true,"email_needs_agreement":false,"is_email_valid":true,"is_email_verified":true,"email":"solmi2013@gmail.com","has_age_range":true,"age_range_needs_agreement":false,"age_range":"20~29","has_birthday":true,"birthday_needs_agreement":false,"birthday":"0421","birthday_type":"SOLAR","has_gender":true,"gender_needs_agreement":false,"gender":"female"}}


			// JSON�Ľ� �� JSONObject��ü ����
			JSONParser p = new JSONParser();
			JSONObject jo = (JSONObject)p.parse(result);
			JSONObject properties = (JSONObject)jo.get("properties");
			JSONObject kakao_account = (JSONObject)jo.get("kakao_account");
			
			String nickname = properties.get("nickname").toString();
			String gender = kakao_account.get("gender").toString();
			String birthday = kakao_account.get("birthday").toString();
//			String email = kakao_account.get("email").toString();
			// �̸����� ���� ���� �����Ƿ� ������ �� ����
			
			
			loginInfo.put("nickname", nickname);
			loginInfo.put("gender", gender);
			loginInfo.put("birthday", birthday);
			// �޾ƿ� �α��� �������� HashMap�� loginInfo�� ����
			
		} catch(Exception e) {
			System.out.println("getUserInfo() �޼ҵ� ����");
			e.printStackTrace();
		}
		
		return loginInfo;
	}

}
