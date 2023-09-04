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
			conn.setRequestMethod("POST");	// 요청시 post 방식사용
			conn.setDoOutput(true);			// post방식을 사용하기 위한 셋팅
			
			// post요청에 필요한 파라미터 생성
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			StringBuilder sb = new StringBuilder();		// StringBuilder : String인데 변화가 많은 경우 사용
			sb.append("grant_type=authorization_code");
			sb.append("&client_id=e6e39e7bba5c80547748496afe439595");
			sb.append("&redirect_uri=http://localhost:8086/sprMvcTest/kakaoLoginProc");
			sb.append("&code=" + code);
			bw.write(sb.toString());
			bw.flush();
			// conn객체에 등록된 url로 bw의 파라미터들을 가지고 실행(연결)
			
			int responseCode = conn.getResponseCode();
			System.out.println("responseCode : " + responseCode);
			// 값이 200이면 성공
			
			// 요청을 통해 얻은 JSON형식의 Response 메시지 읽어오기
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line = "", result = "";
			while ((line = br.readLine()) != null) {
				result += line;
			}
			System.out.println("result : " + result);
			// result : {"access_token":"9SAzVzh04Gol9aqwqHTOZ9X2r9TjFrArJKmbIWKQCj10aAAAAYn8Mcww","token_type":"bearer","refresh_token":"6m-mqPlrwQh4EoAXQfNs0z60p5W3ZWoeEhzjKeHoCj10aAAAAYn8Mcwv","expires_in":7199,"scope":"profile_nickname","refresh_token_expires_in":5183999}
			
			// JSON파싱 및 JSONObject객체 생성
			JSONParser p = new JSONParser();
			JSONObject jo = (JSONObject)p.parse(result);
			access_token = (String)jo.get("access_token");
			// 실제 데이터를 가져올 수 있는 코드값
			refresh_token = (String)jo.get("access_token");
			
			br.close();		bw.close();
			
		} catch(Exception e) {
			System.out.println("getAccessToken() 메소드 오류");
			e.printStackTrace();
		}
		
		return access_token;
	}

	public HashMap<String, String> getUserInfo(String accessToken) {
		// 요청하는 클라이언트마다 가진 정보가 다를 수 있기에 HashMap타입으로 리턴
		HashMap<String, String> loginInfo = new HashMap<String, String>();
		String reqURL = "https://kapi.kakao.com/v2/user/me";
		
		try {
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection)url.openConnection();
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Authorization", "Bearer " + accessToken);
			
			int responseCode = conn.getResponseCode();
			System.out.println("responseCode : " + responseCode);
			// 값이 200이면 성공
			
			// 요청을 통해 얻은 JSON형식의 Response 메시지 읽어오기
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line = "", result = "";
			while ((line = br.readLine()) != null) {
				result += line;
			}
			System.out.println("result : " + result);
			// result : {"id":2967339527,"connected_at":"2023-08-16T05:09:50Z","properties":{"nickname":"?뾼?넄誘?"},"kakao_account":{"profile_nickname_needs_agreement":false,"profile":{"nickname":"?뾼?넄誘?"},"has_email":true,"email_needs_agreement":false,"is_email_valid":true,"is_email_verified":true,"email":"solmi2013@gmail.com","has_age_range":true,"age_range_needs_agreement":false,"age_range":"20~29","has_birthday":true,"birthday_needs_agreement":false,"birthday":"0421","birthday_type":"SOLAR","has_gender":true,"gender_needs_agreement":false,"gender":"female"}}


			// JSON파싱 및 JSONObject객체 생성
			JSONParser p = new JSONParser();
			JSONObject jo = (JSONObject)p.parse(result);
			JSONObject properties = (JSONObject)jo.get("properties");
			JSONObject kakao_account = (JSONObject)jo.get("kakao_account");
			
			String nickname = properties.get("nickname").toString();
			String gender = kakao_account.get("gender").toString();
			String birthday = kakao_account.get("birthday").toString();
//			String email = kakao_account.get("email").toString();
			// 이메일은 없을 수도 있으므로 가져올 수 없음
			
			
			loginInfo.put("nickname", nickname);
			loginInfo.put("gender", gender);
			loginInfo.put("birthday", birthday);
			// 받아온 로그인 정보들을 HashMap인 loginInfo에 저장
			
		} catch(Exception e) {
			System.out.println("getUserInfo() 메소드 오류");
			e.printStackTrace();
		}
		
		return loginInfo;
	}

}
