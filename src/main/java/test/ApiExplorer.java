package test;

import java.io.*;
import java.net.*;

public class ApiExplorer {
    public static void main(String[] args) throws IOException {
    	// URL�� ����� ���� StringBuilder ����
        StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/1262000/CountryPopulationService2/getCountryPopulationList2"); /*URL*/

        // Open API�� ��û �԰ݿ� �´� ������Ʈ�� ����
        urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=lMIejRsgTvsP6PSj9V6oqXo4DYZHbL2Mpzn%2BeSUlDR0CkZepPELg%2BrqZsdBgpTAskBnwd%2FYm61gU3SkDyAqsVA%3D%3D"); /*Service Key*/
        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*������ ��ȣ*/
        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("10", "UTF-8")); /*�� ������ ��� ��*/
        // urlBuilder.append("&" + URLEncoder.encode("cond[country_nm::EQ]","UTF-8") + "=" + URLEncoder.encode("����", "UTF-8")); /*������*/
        // urlBuilder.append("&" + URLEncoder.encode("cond[country_iso_alp2::EQ]","UTF-8") + "=" + URLEncoder.encode("GH", "UTF-8")); /*ISO 2�ڸ��ڵ�*/
        urlBuilder.append("&" + URLEncoder.encode("returnType","UTF-8") + "=" + URLEncoder.encode("JSON", "UTF-8")); /*XML �Ǵ� JSON*/

        // URL ��ü ����
        URL url = new URL(urlBuilder.toString());
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");
        System.out.println("Response code: " + conn.getResponseCode());

        BufferedReader rd;
        // Open API���� ���� �����͸� �޾� ������ ��ü ����
        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }

        StringBuilder sb = new StringBuilder();
        // �޾ƿ� ������ ��ü�� ���ڿ��� ������ ��ü
        String line;	// �޾ƿ� �����͸� �� �پ� ���ڿ��� �޾� ������ ��ü
        while ((line = rd.readLine()) != null) {
        // �о���� �� ���� ���ڿ��� line�� ����(���̻� �о���� �����Ͱ� ������ null)
            sb.append(line);
            // �о���� �� ���� ���ڿ��� ���ʴ�� sb�� ���� ����
        }
        rd.close();
        conn.disconnect();

        System.out.println(sb.toString());
    }
}
