package com.project.petpal.member.model.vo;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.message.BasicNameValuePair;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

public class KakaoLoginApi {

	//토큰 만들어주는 메소드
	public JsonNode getAccessToken(String autorize_code) {
		 
        final String RequestUrl = "https://kauth.kakao.com/oauth/token";
 
        final List<NameValuePair> postParams = new ArrayList<NameValuePair>();
 
        postParams.add(new BasicNameValuePair("grant_type", "authorization_code"));
 
        postParams.add(new BasicNameValuePair("client_id", "d8bef86f08e813e18aa9c8170d315353"));
 
        postParams.add(new BasicNameValuePair("redirect_uri", "http://localhost:9090/petpal/kakaoLogin"));
 
        postParams.add(new BasicNameValuePair("code", autorize_code));
 
        final HttpClient client = HttpClientBuilder.create().build();
 
        final HttpPost post = new HttpPost(RequestUrl);
 
        JsonNode returnNode = null;
 
        try {
 
            post.setEntity(new UrlEncodedFormEntity(postParams));
 
            final HttpResponse response = client.execute(post);
 
            ObjectMapper mapper = new ObjectMapper();
 
            returnNode = mapper.readTree(response.getEntity().getContent());
 
        } catch (UnsupportedEncodingException e) {
 
            e.printStackTrace();
 
        } catch (ClientProtocolException e) {
 
            e.printStackTrace();
 
        } catch (IOException e) {
 
            e.printStackTrace();
 
        } finally {
 
        }
 
        return returnNode;
 
    }

	//정보 불러오는 메소드
	public static JsonNode getKakaoUserInfo(JsonNode accessToken) { 
			final String RequestUrl = "https://kapi.kakao.com/v2/user/me"; 
			final HttpClient client = HttpClientBuilder.create().build(); 
			final HttpPost post = new HttpPost(RequestUrl); 
			post.addHeader("Authorization", "Bearer " + accessToken); 
			JsonNode returnNode = null; 
			try { 
				final HttpResponse response = client.execute(post); 
				// JSON 형태 반환값 처리 
				ObjectMapper mapper = new ObjectMapper(); 
				returnNode = mapper.readTree(response.getEntity().getContent()); 
			} catch (ClientProtocolException e) {
				e.printStackTrace(); 
			} catch (IOException e) {
				e.printStackTrace(); 
			} finally {
				// clear resources
			} 
			
			return returnNode; 
			
	}
	
	//연결 주소 url 만들어주는 메소드
	public static String getAuthorizationUrl(HttpSession session) { 
		String kakaoUrl = "https://kauth.kakao.com/oauth/authorize?" + "client_id=" + "d8bef86f08e813e18aa9c8170d315353" + "&redirect_uri=" + "http://localhost:9090/petpal/kakaoLogin" + "&response_type=code"; 
		return kakaoUrl; 
	}

		
	


}
