package test;

import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.io.BufferedReader;
import java.io.IOException;

public class ApiExplorerOld {
    public static void main(String[] args) throws IOException {
    	String charSet = "UTF-8";
        StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/1262000/CountryPopulationService2/getCountryPopulationList2"); /*URL*/
        urlBuilder.append("?serviceKey=lMIejRsgTvsP6PSj9V6oqXo4DYZHbL2Mpzn%2BeSUlDR0CkZepPELg%2BrqZsdBgpTAskBnwd%2FYm61gU3SkDyAqsVA%3D%3D"); /*Service Key*/
        urlBuilder.append("&pageNo=1"); /*페이지 번호*/
        urlBuilder.append("&numOfRows=10"); /*한 페이지 결과 수*/
//        urlBuilder.append("?" + URLEncoder.encode("serviceKey", charSet) + "=lMIejRsgTvsP6PSj9V6oqXo4DYZHbL2Mpzn%2BeSUlDR0CkZepPELg%2BrqZsdBgpTAskBnwd%2FYm61gU3SkDyAqsVA%3D%3D"); /*Service Key*/
//        urlBuilder.append("&" + URLEncoder.encode("pageNo", charSet) + "=" + URLEncoder.encode("1", charSet)); /*페이지 번호*/
//        urlBuilder.append("&" + URLEncoder.encode("numOfRows", charSet) + "=" + URLEncoder.encode("10", charSet)); /*한 페이지 결과 수*/
//        urlBuilder.append("&" + URLEncoder.encode("cond[country_nm::EQ]","UTF-8") + "=" + URLEncoder.encode("가나", "UTF-8")); /*국가명*/
//        urlBuilder.append("&" + URLEncoder.encode("cond[country_iso_alp2::EQ]","UTF-8") + "=" + URLEncoder.encode("GH", "UTF-8")); /*ISO 2자리코드*/
//        urlBuilder.append("&" + URLEncoder.encode("returnType", charSet) + "=" + URLEncoder.encode("JSON", charSet)); /*XML 또는 JSON*/
        urlBuilder.append("&returnType=JSON"); /*XML 또는 JSON*/
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
        System.out.println(sb.toString());
    }
}
