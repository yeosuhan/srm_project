package com.oti.team2.util.springsecurity;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import org.json.JSONObject;

import lombok.extern.log4j.Log4j2;

@Log4j2
public class GoogleService {
	public String getAuthURL() {
		String authURL = "https://accounts.google.com/o/oauth2/auth";
		authURL += "?client_id=384557297665-3n8abq0eana7g9igakohgfsiu1q57qh3.apps.googleusercontent.com";
		authURL += "&response_type=code";
		authURL += "&redirect_uri=http://localhost:8080/login/oauth2/google/callback";
		authURL += "&email profile";
		return authURL;
	}		
	
	public String getAccessToken(String code) {
		String access_token = "";
		String refresh_token = "";
		
		try {
			String apiURL = "https://oauth2.googleapis.com/token";
			String reqMethod = "POST";
			String bodyData = "grant_type=authorization_code";
			bodyData += "&client_id=384557297665-3n8abq0eana7g9igakohgfsiu1q57qh3.apps.googleusercontent.com";
			bodyData += "&client_secret=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";
			bodyData += "&redirect_uri=http://localhost:8080/login/oauth2/google/callback";
			bodyData += "&code=" + code;
				
			//토큰을 요청한다.
			URL url = new URL(apiURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod(reqMethod);
			conn.setDoOutput(true);
			
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			bw.write(bodyData);
			bw.flush();

			int responseCode = conn.getResponseCode();
			log.info("토큰 응답코드 : " + responseCode);
			
			BufferedReader br;
			if (responseCode == 200) { // 정상 호출
				br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			} else { // 에러 발생
				br = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
			}			
			
			String br_line = "";
			String resBody = "";
			while ((br_line = br.readLine()) != null) {
				resBody += br_line;
			}
			br.close();
			bw.close();
			
			if (responseCode == 200) {
				log.info(resBody);
				JSONObject root = new JSONObject(resBody);
				access_token = root.getString("access_token");
				log.info("access_token: " + access_token);			
			} else {
				throw new Exception(resBody);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return access_token;
	}

	public Map<String, String> getUserInfo(String access_token) {
		Map<String, String> resultMap = new HashMap<>();
		
		try {
			String reqURL = "https://www.googleapis.com/oauth2/v2/userinfo";
			String reqMethod = "GET";
		
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Authorization", "Bearer " + access_token);

			int responseCode = conn.getResponseCode();
			log.info("사용자 응답코드 : " + responseCode);

			BufferedReader br;
			if (responseCode == 200) {
				br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			} else {
				br = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
			}			
			
			String br_line = "";
			String resBody = "";
			while ((br_line = br.readLine()) != null) {
				resBody += br_line;
			}
			br.close();

			if (responseCode == 200) {
				log.info(resBody);
				JSONObject root = new JSONObject(resBody);
				
				String id = root.getString("id");
				String name = root.getString("name");
				String email = root.getString("email");
				log.info("id: " + id);
				log.info("name: " + name);
				log.info("email: " + email);
				
				resultMap.put("id", id);
				resultMap.put("name", name);
				resultMap.put("email", email);	
			} else {
				throw new Exception(resBody);
			}			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return resultMap;
	}
}
