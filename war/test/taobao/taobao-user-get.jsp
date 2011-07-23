<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript" src="/script/jquery-1.6.min.js"></script>
<script type="text/javascript" >
$(function(){
	$('#button1').click(function(){
		var form  = $('#form1');
		$.post(form.attr('action'),form.serialize(),function(data){
			$('#result').html(data);
		},'json');
	});
});
</script>
</head>
<body>
<div>
淘宝API公用账号<br/>
 	B商家测试账号(商城卖家)：<br/>
 	alipublic00	alipublic01	alipublic02	alipublic03	alipublic04	alipublic05	alipublic06
 	alipublic07	alipublic08	alipublic09	alipublic10	alipublic11	alipublic12	alipublic13
 	alipublic14	alipublic15	alipublic16	alipublic17	alipublic18	alipublic19	alipublic20
 	alipublic21	alipublic22	alipublic23	alipublic24	alipublic25	alipublic26	alipublic27
 	alipublic28	alipublic29
 	<br />
 	C商家测试账号(淘宝卖家)：<br/>
 	sandbox_c_1	sandbox_c_2	sandbox_c_3	sandbox_c_4	sandbox_c_5	sandbox_c_6	sandbox_c_7
 	sandbox_c_8	sandbox_c_9	sandbox_c_10	sandbox_c_11	sandbox_c_12	sandbox_c_13	sandbox_c_14
 	sandbox_c_15	sandbox_c_16	sandbox_c_17	sandbox_c_18	sandbox_c_19	sandbox_c_20	sandbox_c_21
 	sandbox_c_22	sandbox_c_23	sandbox_c_24	sandbox_c_25	sandbox_c_16	sandbox_c_27	sandbox_c_28
 	sandbox_c_29	sandbox_c_30
 	 	 	 	 <br/>	 	 
      买家可以选择全部账号进行试用
</div>
<div>
<form id="form1" action="/test/taobao/taobao-user-get" method="post">
    <div><textarea name="nick" rows="3" cols="60"></textarea></div>
    <div><input id='button1' type="button" value="Post Greeting" /></div>
  </form>
</div>
<div id='result'></div>
</body>
</html>