package com.sod.utils;

import java.util.HashMap;
import java.util.Set;

import com.cloopen.rest.sdk.CCPRestSmsSDK;


public class SDKTestSendTemplateSMS {


	public static void test(String tele,String str){
		HashMap<String, Object> result = null;


		CCPRestSmsSDK restAPI = new CCPRestSmsSDK();
		

		restAPI.init("app.cloopen.com", "8883");
		

		restAPI.setAccount("8aaf07085f333ef6015f4e514fe50c23", "f95a73be28c34a5194626ac92d668ae1");
		
		

		restAPI.setAppId("8aaf07085f333ef6015f4e5151550c2a");
		
		

		result = restAPI.sendTemplateSMS(tele,"1" ,new String[]{str,"30"});
		
		System.out.println("SDKTestGetSubAccounts result=" + result);
		if("000000".equals(result.get("statusCode"))){
			System.out.println("发送成功");
		}else{
			System.out.println("错误码=" + result.get("statusCode") +" 错误信息= "+result.get("statusMsg"));
		}
	}

}
