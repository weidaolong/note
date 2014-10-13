<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>数据库备份与恢复</title>
<link rel="stylesheet" href="${ctx}/static/dropzone/css/basic.css" />
<link rel="stylesheet" href="${ctx}/static/dropzone/css/dropzone.css" />
<script type="text/javascript" src="${ctx}/static/dropzone/dropzone.js"></script>
<script type="text/javascript">
</script>
</head>
<body>
<form action="/" class="dropzone" id="aaa">
  <input type="hidden" name="additionaldata" value="1" />
  <input type="hidden" name="yahu" value="2" />

  <!-- If you want control over the fallback form, just add it here: -->
  <div class="fallback"> <!-- This div will be removed if the fallback is not necessary -->
    <input type="file" name="youfilename" />
    etc...
  </div>
</form>
<script type="text/javascript">
Dropzone.options.aaa = {
		  paramName: "file", // The name that will be used to transfer the file
		  maxFilesize: 2, // MB
		  autoProcessQueue: false,
		  init: function() {
			    this.on("addedfile", function(file) { alert("Added file."); 

		        // Create the remove button
		        var removeButton = Dropzone.createElement("<button>Remove file</button>");


		        // Capture the Dropzone instance as closure.
		        var _this = this;

		        // Listen to the click event
		        removeButton.addEventListener("click", function(e) {
		          // Make sure the button click doesn't submit the form:
		          e.preventDefault();
		          e.stopPropagation();

		          // Remove the file preview.
		          _this.removeFile(file);
		          // If you want to the delete the file on the server as well,
		          // you can do the AJAX request here.
		        });

		        // Add the button to the file preview element.
		        file.previewElement.appendChild(removeButton);
		      });
			  },
		  accept: function(file, done) {
		    if (file.name == "justinbieber.jpg") {
		      done("Naha, you don't.");
		    }
		    else { done(); }
		    alert("ghgh");
		  }
		};
    </script>

	<div class="panel panel-default">
		<div class="panel-heading">数据库备份</div>
		<div class="panel-body">
			<button type="button" class="btn btn-default">执行备份</button>
		</div>
	</div>
	<div class="panel panel-default">
		<div class="panel-heading">数据库恢复</div>
		<div class="panel-body">
			<button type="button" class="btn btn-default">执行备份</button>
		</div>
	</div>

</body>
</html>