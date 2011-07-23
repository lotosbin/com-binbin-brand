package com.binbin.task.controllers;

import com.google.api.client.auth.oauth2.draft10.AccessTokenResponse;
import com.google.api.client.googleapis.auth.oauth2.draft10.GoogleAccessProtectedResource;
import com.google.api.client.googleapis.auth.oauth2.draft10.GoogleAccessTokenRequest.GoogleAuthorizationCodeGrant;
import com.google.api.client.googleapis.auth.oauth2.draft10.GoogleAuthorizationRequestUrl;

import com.google.api.client.http.HttpTransport;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.json.jackson.JacksonFactory;

import com.google.api.services.tasks.v1.Tasks;
import com.google.api.client.http.HttpTransport;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class OAuthHelper {
	private static HttpTransport httpTransport = new NetHttpTransport();
	private static JacksonFactory jsonFactory = new JacksonFactory();
	private static String clientId = "10403666201.apps.googleusercontent.com";
	private static String clientSecret = "vq_RVZP9TAaR3OPgFiI2HNOC";
	private static String redirectUrl = "urn:ietf:wg:oauth:2.0:oob";

	public static String getUrl() {
		String scope = "https://www.googleapis.com/auth/tasks";

		// Step 1: Authorize -->
		String authorizationUrl = new GoogleAuthorizationRequestUrl(clientId,
				redirectUrl, scope).build();
		return authorizationUrl;
	}

	public static void setUp() throws IOException {
		HttpTransport ddd;
		// Point or redirect your user to the authorizationUrl.
		System.out.println("Go to the following link in your browser:");
		String authorizationUrl = getUrl();
		System.out.println(authorizationUrl);
//
//		// Read the authorization code from the standard input stream.
		BufferedReader in = new BufferedReader(new InputStreamReader(System.in));
		System.out.println("What is the authorization code?");
		String code = in.readLine();
//		// End of Step 1 <--
//
//		// Step 2: Exchange -->
		AccessTokenResponse response = new GoogleAuthorizationCodeGrant(
				httpTransport, jsonFactory, clientId, clientSecret, code,
				redirectUrl).execute();
		// End of Step 2 <--
//
		GoogleAccessProtectedResource accessProtectedResource = new GoogleAccessProtectedResource(
				response.accessToken, httpTransport, jsonFactory, clientId,
				clientSecret, response.refreshToken);

		Tasks service = new Tasks(httpTransport, accessProtectedResource,
				jsonFactory);
		service.setApplicationName("YOUR_APPLICATION_NAME");

	}

}
