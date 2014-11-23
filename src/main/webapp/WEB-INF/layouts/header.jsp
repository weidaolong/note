<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
 <!-- Fixed navbar -->
    <nav class="navbar navbar-default navbar-fixed-top" role="navigation">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">NOTE</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">NOTE</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav">
            <li class="active"><a href="${ctx }/">主页</a></li>
          </ul>
          <ul class="nav navbar-nav navbar-right">
			<shiro:guest>
	            <li><a href="${ctx }/register">注册</a></li>
	            <li><a href="${ctx }/login">登录</a></li>
			</shiro:guest>
			<shiro:user>
	            <li class="dropdown">
	              <a href="#" class="dropdown-toggle" data-toggle="dropdown"><shiro:principal property="name"/> <span class="caret"></span></a>
	              <ul class="dropdown-menu" role="menu">
	                <li><a href="${ctx}/account">后台管理</a></li>
	                <li class="divider"></li>
	                <li><a href="${ctx}/account">后台管理</a></li>
	                <li> <a href="${ctx}/logout">退出</a></li>
	              </ul>
	            </li>
				
			</shiro:user>
            <li><a href="${ctx }/mylist">我的事项</a></li>
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </nav>
 