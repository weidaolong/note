<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>编辑头像</title>
<script type="text/javascript">

function ajax_post(the_url,the_param,succ_callback){
	$.ajax({
		type	: 'POST',
		cache	: false,
		url		: the_url,
		data	: the_param,
		success	: succ_callback,
		error	: function(html){
			alert("提交数据失败，代码:" +html.status+ "，请稍候再试");
		}
	});
}

	$(function($) {
			$('#target').Jcrop({
                setSelect: [ 10, 10, 200, 200 ],
                aspectRatio: 1,
                onChange: showCoords,
                onSelect: showCoords
            });
		    $('#btn_save_region').click(function(){
		      	var args = 'left='+$("#img_left").val()+'&top='+$("#img_top").val()+'&width='+$("#img_width").val()+'&height='+$("#img_height").val();
		      	ajax_post('${ctx}/user/save_portrait',args,function(json){
		      		alert(json);
					if (json) {
						json = eval("("+json+")");
						alert(json.msg);
					}else{
		        	  alert("头像更新成功");
		    		}
		    	});
		    });
	});
	
	


	function showCoords(c){
	    $('#img_left').val(c.x);
	    $('#img_top').val(c.y);
	    $('#img_width').val(c.w);
	    $('#img_height').val(c.h);
	  };
	
</script>
</head>
<body>
	<form action="save_photo" enctype="multipart/form-data" method="post">
		<input type="file" name="file" /> <input type="submit" value="提交">
	</form>
	
<form id='form_save' action="user/save_portrait" method="POST" style='display:none;'>
<input type='hidden' id='img_left' name='left' value='0'/>
<input type='hidden' id='img_top' name='top' value='0'/>
<input type='hidden' id='img_width' name='width' value='0'/>
<input type='hidden' id='img_height' name='height' value='0'/>
</form>
	<!-- ${src} -->
	<img alt="" src="${ctx}/user/view?img=Koala.jpg&tempid=<%=Math.random() %>" id="target" >

<input type='button' value='保存选中区域' id='btn_save_region' class='BUTTON SUBMIT'/>

        <input type='button' value='保存全图' id='btn_save_all' class='SUBMIT'/>
</body>
</html>