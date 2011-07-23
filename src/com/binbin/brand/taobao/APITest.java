package com.binbin.brand.taobao;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.Map;
import java.util.TreeMap;
public class APITest {
    	protected static String testUrl = "http://gw.api.tbsandbox.com/router/rest";//ɳ�价�����õ�ַ
    	protected static String appkey = "12263714";
    	protected static String secret = "sandbox9341f392b7f5d1858d2e5121a";
    	public static String testUserGet(){
        	 TreeMap<String, String> apiparamsMap = new TreeMap<String, String>();
        	 apiparamsMap.put("format", "xml");
        	 apiparamsMap.put("method", "taobao.user.get");
        	 apiparamsMap.put("sign_method","md5");
        	 apiparamsMap.put("app_key",appkey);
        	 apiparamsMap.put("v", "2.0");
        	 //apiparamsMap.put("session",request.getParameter("session"));��������Ҫsessionkey
        	 String timestamp =new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
        	 apiparamsMap.put("timestamp",timestamp);
        	 apiparamsMap.put("fields","user_id,uid,nick");//��Ҫ��ȡ���ֶ�
        	 apiparamsMap.put("nick","andyy_tan");
        	 //����ǩ��
        	 String sign = Util.md5Signature(apiparamsMap,secret);
        	 apiparamsMap.put("sign", sign);
        	 StringBuilder param = new StringBuilder();
        	 for (Iterator<Map.Entry<String, String>> it = apiparamsMap.entrySet()
        	 .iterator(); it.hasNext();) {
            	 Map.Entry<String, String> e = it.next();
            	 param.append("&").append(e.getKey()).append("=").append(e.getValue());
        	 }
        	 return param.toString().substring(1);
    	}
    	public static String GetTestUserGet(){
    		 String result = Util.getResult(testUrl,testUserGet());
        	 return result;
    	}
    	public static void main(String[] args) {
        	 String result = Util.getResult(testUrl,testUserGet());
        	 System.out.print(result);
    	}
}
