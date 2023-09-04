package ctrl;

import java.io.*;
import java.net.*;
import java.util.*;
import javax.servlet.http.*;
import org.json.simple.*;
import org.json.simple.parser.*;
import org.springframework.stereotype.*;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import svc.*;
import vo.*;

@Controller
public class JsonCtrl {
	private JsonSvc jsonSvc;

	public void setJsonSvc(JsonSvc jsonSvc) {
		this.jsonSvc = jsonSvc;
	}

	@GetMapping("/jsonIndex")
	public String jsonIndex() {
		return "json/jsonIndex";
	}

	@GetMapping("/jsObject")
	public String jsObject() {
		return "json/jsObject";
	}

	@GetMapping("/test01Stringify")
	public String test01Stringify() {
		return "json/test01Stringify";
	}

	@GetMapping("/test02Parse")
	public String test02Parse() {
		return "json/test02Parse";
	}

	@GetMapping("/whyJson")
	public String whyJson() {
		return "json/whyJson";
	}

	@RequestMapping(value="/noJson", method=RequestMethod.GET, produces="application/text; charset=utf8")
	@ResponseBody	// 占쌘뱄옙占쏙옙 占쏙옙체占쏙옙 http 占쏙옙占쏙옙占� 占쏙옙체占쏙옙 占쏙옙환占싹울옙 클占쏙옙占싱억옙트占쏙옙 占쏙옙占쏙옙
	public String noJson() {
		String[] arr = {"홍占썸동", "占쏙옙占쏙옙치", "占쌈뀐옙占쏙옙"};
		String result = "";
		for (int i = 0 ; i < arr.length ; i++) {
			result += "," + arr[i];
		}

		return result.substring(1);
	}

	@RequestMapping(value="/useJson", method=RequestMethod.GET, produces="application/text; charset=utf8")
	@ResponseBody
	public String useJson() {
		String[] arr = {"홍占썸동", "占쏙옙占쏙옙치", "占쌈뀐옙占쏙옙"};
		org.json.JSONArray result = new org.json.JSONArray(arr);
		// JSONArray占쏙옙 List占쏙옙 占쏙옙占쏙옙占�(특占쏙옙, ArrayList)

		return result.toString();
	}

	@GetMapping("/jsonFile")
	public String jsonFile() {
		return "json/jsonFile";
	}

	@GetMapping("/jsonArray1")
	public String jsonArray1() {
		return "json/jsonArray1";
	}

	@PostMapping("/jsonArray2")
	public String jsonArray2(HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("utf-8");
		String jsonStr = request.getParameter("jsonArr");

		JSONParser p = new JSONParser();
		// 특占쏙옙 占쏙옙占쌘울옙 占쏙옙占쏙옙 JSON占쏙옙체占쏙옙 占쏙옙환占쏙옙 占쏙옙 占쏙옙占쏙옙求占� 占싸쏙옙占싹쏙옙
		JSONArray jsonArr = new JSONArray();
		jsonArr = (JSONArray)p.parse(jsonStr);
		// json占쏙옙占쏙옙占쏙옙 占쏙옙占쌘울옙(jsonStr)占쏙옙 JSONArray占쏙옙 占쏙옙환占싹울옙 占쏙옙占쏙옙
		// JSONArray占쏙옙 占썼열占쏙옙占쏙옙 List占쏙옙 占쏙옙占쏙옙占�(특占쏙옙, ArrayList)
		for (int i = 0 ; i < jsonArr.size() ; i++) {
			JSONObject jo = (JSONObject)jsonArr.get(i);
			// jsonArr占쏙옙 占쏙옙占쏙옙獵占� 占쏙옙恬占� JSONObject占쏙옙 占싸쏙옙占싹쏙옙占쏙옙 占쏙옙환
			// JSONArray占쏙옙 占쏙옙占쏙옙트(List)占싱므뤄옙 占싸듸옙占쏙옙占쏙옙호占쏙옙 占싱울옙占싹울옙 占쏙옙占쏙옙占싶몌옙 占쏙옙占쏙옙
			System.out.println("id : " + jo.get("id") + 
				" / addr : " + jo.get("addr"));
			// JSONObject占쏙옙 占쏙옙(Map)占싱므뤄옙 키占쏙옙 占싱울옙占싹울옙 占쏙옙占쏙옙占싶몌옙 占쏙옙占쏙옙占쏙옙
		}

		request.setAttribute("jsonStr", jsonStr.replaceAll("\"", "\'"));
		// json占쏙옙占쏙옙占쏙옙 占쏙옙占쌘울옙占쏙옙 request占쏙옙 占쏙옙占쏙옙

		return "json/jsonArray2";
	}

	@GetMapping("/jsonArrayDb1")
	public String jsonArrayDb1(HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("utf-8");
		String schtype = request.getParameter("schtype");
		String keyword = request.getParameter("keyword");
		String where = "";
		if (schtype == null || keyword == null) {
			schtype = "";	keyword = "";
		} else if (!schtype.equals("") && !keyword.equals("")) {
			URLEncoder.encode(keyword);
			keyword = keyword.trim();
			where = " and mi_" + schtype + " like '%" + keyword + "%' ";
		}

		List<MemberInfo> memberList = jsonSvc.getMemberList(where);
		PageInfo pi = new PageInfo();
		pi.setSchtype(schtype);		pi.setKeyword(keyword);

		request.setAttribute("pi", pi);
		request.setAttribute("memberList", memberList);

		return "json/jsonArrayDb1";
	}

	@PostMapping("/jsonArrayDb2")
	public String jsonArrayDb2(HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("utf-8");
		String jsonStr = request.getParameter("jsonStr");
		JSONParser p = new JSONParser();
		JSONArray jsonArr = new JSONArray();
		jsonArr = (JSONArray)p.parse(jsonStr);
		// json占쏙옙占쏙옙占쏙옙 占쏙옙占쌘울옙占쏙옙 JSONArray占쏙옙 占쏙옙환占싹울옙 占쏙옙占쏙옙
		for (int i = 0 ; i < jsonArr.size() ; i++) {
			JSONObject jo = (JSONObject)jsonArr.get(i);
			// jsonArr 占썼열占쏙옙 占쌍댐옙 占쏙옙占쏙옙占싶몌옙 占십곤옙 占쏙옙占쏙옙占� JSONObject占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙
			System.out.println("id : " + jo.get("id") + 
				" / name : " + jo.get("name"));
		}

		request.setAttribute("jsonStr", 
			jsonStr.replaceAll("\"", "\'"));
		return "json/jsonArrayDb2";
	}

	@GetMapping("/jsonArray3")
	public String jsonArray3() {
		return "json/jsonArray3";
	}

	@GetMapping("/addrOpenApi")
	public String addrOpenApi() {
		return "json/addrOpenApi";
	}

	@GetMapping("/openApi1")
	public String openApi1(HttpServletRequest request) throws Exception {
		int cpage = 1, psize = 10, rcnt = 0, bsize = 10;
		// �쁽�옱 �럹�씠吏� 踰덊샇, �럹�씠吏� �겕湲�, �뜲�씠�꽣 媛쒖닔, 釉붾줉 �겕湲�
		if (request.getParameter("cpage") != null)
			cpage = Integer.parseInt(request.getParameter("cpage"));
		if (request.getParameter("psize") != null)
			psize = Integer.parseInt(request.getParameter("psize"));

		StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/1262000/CountryPopulationService2/getCountryPopulationList2"); /*URL*/
        urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=lMIejRsgTvsP6PSj9V6oqXo4DYZHbL2Mpzn%2BeSUlDR0CkZepPELg%2BrqZsdBgpTAskBnwd%2FYm61gU3SkDyAqsVA%3D%3D"); /*Service Key*/
        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode(cpage + "", "UTF-8"));
        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode(psize + "", "UTF-8"));
        // urlBuilder.append("&" + URLEncoder.encode("cond[country_nm::EQ]","UTF-8") + "=" + URLEncoder.encode("媛��굹", "UTF-8"));
        // urlBuilder.append("&" + URLEncoder.encode("cond[country_iso_alp2::EQ]","UTF-8") + "=" + URLEncoder.encode("GH", "UTF-8"));
        urlBuilder.append("&" + URLEncoder.encode("returnType","UTF-8") + "=" + URLEncoder.encode("JSON", "UTF-8"));

        URL url = new URL(urlBuilder.toString());
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");
        System.out.println("Response code: " + conn.getResponseCode());

        BufferedReader rd;
        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }

        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = rd.readLine()) != null) {
            sb.append(line);
        }
        rd.close();
        conn.disconnect();

        JSONParser p = new JSONParser();
        JSONObject jo = (JSONObject)p.parse(sb.toString());
        JSONArray dataList = (JSONArray)jo.get("data");
        rcnt = Integer.parseInt(jo.get("totalCount").toString());
        PageInfo pi = new PageInfo();
        pi.setCpage(cpage);		pi.setPsize(psize);
        pi.setBsize(bsize);		pi.setRcnt(rcnt);
        // �럹�씠吏뺤쓣 �쐞�븳 �젙蹂대�� PageInfo�삎 �씤�뒪�꽩�뒪 pi�뿉 ���옣

        request.setAttribute("pi", pi);
        request.setAttribute("dataList", dataList);

        return "json/openApi1";
	}

	@GetMapping("/openApi2")
	public String openApi2(HttpServletRequest request) throws Exception {
		StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/1262000/CountryCovid19SafetyServiceNew/getCountrySafetyNewsListNew"); /*URL*/
        urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=lMIejRsgTvsP6PSj9V6oqXo4DYZHbL2Mpzn%2BeSUlDR0CkZepPELg%2BrqZsdBgpTAskBnwd%2FYm61gU3SkDyAqsVA%3D%3D"); /*Service Key*/
        urlBuilder.append("&" + URLEncoder.encode("returnType","UTF-8") + "=" + URLEncoder.encode("JSON", "UTF-8")); /*XML �삉�뒗 JSON*/
        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("10", "UTF-8")); /*�븳 �럹�씠吏� 寃곌낵 �닔*/
        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*�럹�씠吏� 踰덊샇*/
        // urlBuilder.append("&" + URLEncoder.encode("cond[country_nm::EQ]","UTF-8") + "=" + URLEncoder.encode("媛��굹", "UTF-8")); /*�븳湲� 援�媛�紐�*/
        // urlBuilder.append("&" + URLEncoder.encode("cond[country_iso_alp2::EQ]","UTF-8") + "=" + URLEncoder.encode("GH", "UTF-8")); /*ISO 2�옄由ъ퐫�뱶*/
        URL url = new URL(urlBuilder.toString());
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");
        System.out.println("Response code: " + conn.getResponseCode());
        BufferedReader rd;
        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = rd.readLine()) != null) {
            sb.append(line);
        }
        rd.close();
        conn.disconnect();
        // System.out.println(sb.toString());

        JSONParser p = new JSONParser();
        JSONObject jo = (JSONObject)p.parse(sb.toString());
        JSONArray dataList = (JSONArray)jo.get("data");

        request.setAttribute("dataList", dataList);

		return "json/openApi2";
	}
}
