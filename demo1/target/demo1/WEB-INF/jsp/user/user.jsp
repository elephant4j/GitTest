<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<title>人事管理系统 ——用户管理</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta http-equiv="pragma" content="no-cache" />
	<meta http-equiv="cache-control" content="no-cache" />
	<meta http-equiv="expires" content="0" />    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3" />
	<meta http-equiv="description" content="This is my page" />
	<link href="${ctx}/css/css.css" type="text/css" rel="stylesheet" />
	<link rel="stylesheet" type="text/css" href="${ctx}/js/ligerUI/skins/Aqua/css/ligerui-dialog.css"/>
	<link href="${ctx}/js/ligerUI/skins/ligerui-icons.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="${ctx }/js/jquery-1.11.0.js"></script>
    <script type="text/javascript" src="${ctx }/js/jquery-migrate-1.2.1.js"></script>
	<script src="${ctx}/js/ligerUI/js/core/base.js" type="text/javascript"></script>
	<script src="${ctx}/js/ligerUI/js/plugins/ligerDrag.js" type="text/javascript"></script> 
	<script src="${ctx}/js/ligerUI/js/plugins/ligerDialog.js" type="text/javascript"></script>
	<script src="${ctx}/js/ligerUI/js/plugins/ligerResizable.jss" type="text/javascript"></script>
	<link href="${ctx}/css/pager.css" type="text/css" rel="stylesheet" />
	
	<script type="text/javascript">
		$(function(){
	 	   /** 获取上一次选中的部门数据 */
	 	   var boxs  = $("input[type='checkbox'][id^='box_']");
	 	   
	 	  /** 给数据行绑定鼠标覆盖以及鼠标移开事件  */
	    	$("tr[id^='data_']").hover(function(){
	    		$(this).css("backgroundColor","#eeccff");
	    	},function(){
	    		$(this).css("backgroundColor","#ffffff");
	    	})
	    	
	    	
	 	   /** 删除员工绑定点击事件 */
	 	   $("#delete").click(function(){
	 		   /** 获取到用户选中的复选框  */
	 		   var checkedBoxs = boxs.filter(":checked");
	 		   if(checkedBoxs.length < 1){
	 			   $.ligerDialog.error("请选择一个需要删除的用户！");
	 		   }else{
	 			   /** 得到用户选中的所有的需要删除的ids */
	 			   var ids = checkedBoxs.map(function(){
	 				   return this.value;
	 			   })
	 			   
	 			   $.ligerDialog.confirm("确认要删除吗?","删除用户",function(r){
	 				   if(r){
	 					   //alert("删除："+ids.get());
	 					   // 发送请求
	 					   window.location = "${ctx }/user/removeUser?ids=" + ids.get();
	 				   }
	 			   });
	 		   }
	 	   })
	    })
	</script>
</head>
<body>
	<!-- 导航 -->
	<table width="100%" border="0" cellpadding="0" cellspacing="0">
	  <tr><td height="10"></td></tr>
	  <tr>
	    <td width="15" height="32"><img src="${ctx}/images/main_locleft.gif" width="15" height="32"></td>
		<td class="main_locbg font2"><img src="${ctx}/images/pointer.gif">&nbsp;&nbsp;&nbsp;当前位置：用户管理 &gt; 用户查询</td>
		<td width="15" height="32"><img src="${ctx}/images/main_locright.gif" width="15" height="32"></td>
	  </tr>
	</table>
	
	<table width="100%" height="90%" border="0" cellpadding="5" cellspacing="0" class="main_tabbor">
	  <!-- 查询区  -->
	  <tr valign="top">
	    <td height="30">
		  <table width="100%" border="0" cellpadding="0" cellspacing="10" class="main_tab">
		    <tr>
			  <td class="fftd">
			  	<form name="empform" method="post" id="empform" action="${ctx}/user/selectUser">
				    <table width="100%" border="0" cellpadding="0" cellspacing="0">
					  <tr>
					    <td class="font3">
					    	用户名：<input type="text" name="username">
					    	用户状态：<input type="text" name="status">
					    	 <input type="submit" value="搜索"/>
					    	<input id="delete" type="button" value="删除"/>
					    </td>
					  </tr>
					</table>
				</form>
			  </td>
			</tr>
		  </table>
		</td>
	  </tr>
	  
	  <!-- 数据展示区 -->
	  <tr valign="top">
	    <td height="20">
		  <table width="100%" border="1" cellpadding="5" cellspacing="0" style="border:#c2c6cc 1px solid; border-collapse:collapse;">
		    <tr class="main_trbg_tit" align="center">
			  <td><input type="checkbox" name="checkAll" id="checkAll"></td>
			  <td>登录名</td>
			  <td>密码</td>
			  <td>用户名</td>
			  <td>状态</td>
			  <td>创建时间</td>
			  <td align="center">操作</td>
			</tr>
			<c:forEach items="${requestScope.pageInfo.list}" var="user" varStatus="stat">
				<tr id="data_${stat.index}" align="center" class="main_trbg" onMouseOver="move(this);" onMouseOut="out(this);">
					<td><input type="checkbox" id="box_${stat.index}" value="${user.id}"></td>
					 <td>${user.loginname }</td>
					  <td>${user.password }</td>
					  <td>${user.username }</td>
					  <td>${user.status }</td>
					  <td><f:formatDate value="${user.createDate}" 
								type="date" dateStyle="long"/></td>
					 <td align="center" width="40px;"><a href="${ctx}/user/updateUser?flag=1&id=${user.id}">
							<img title="修改" src="${ctx}/images/update.gif"/></a>
					  </td>
				</tr>
			</c:forEach>
		  </table>
		</td>
	  </tr>
	  <!-- 分页标签 -->

		<tr>
			<td height="30">
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td width="33%"><div align="left">
								<span class="STYLE22">&nbsp;&nbsp;&nbsp;&nbsp;共有<strong>
									${pageInfo.total}</strong> 条记录，当前第<strong>${pageInfo.pageNum}</strong> 页，共 <strong>${pageInfo.pages}</strong> 页</span>
						</div>
						</td>
						<td width="67%">
							<table width="312" border="0" align="right" cellpadding="0" cellspacing="0">
								<tr>
									<td width="49">
										<div align="center">
											<span class="STYLE22">
											<a href="${pageContext.request.contextPath }/user/selectUser?pageNum=1">首页</a>
											</span>
										</div>
									</td>
									<td width="49">
										<div align="center">
											<span class="STYLE22">
											<a href="${pageContext.request.contextPath }/user/selectUser?pageNum=${pageInfo.pageNum-1}">上一页</a>
											</span>
										</div>
									</td>
									<td width="49"><span class="STYLE22">
									    <div align="center">
											<span class="STYLE22">
											<a href="${pageContext.request.contextPath }/user/selectUser?pageNum=${pageInfo.pageNum+1}">下一页</a>
											</span>
										</div>
									</td>
									<td width="49">
										<div align="center">
											<span class="STYLE22"><a href="${pageContext.request.contextPath }/user/selectUser?pageNum=${pageInfo.pages}">尾页</a></span>
										</div>
									</td>
									<td width="37" class="STYLE22"><div align="center">转到</div>
									</td>
									<td width="22">
										<div align="center">
											<input type="text" name="num" id="num" value="${pageInfo.pageNum}" style="width:20px; height:12px; font-size:12px; border:solid 1px #7aaebd;" />
										</div>
									</td>
									<td width="22" class="STYLE22"><div align="center">页</div>
									</td>
									<td width="35">
										<div align="center">
											<span class="STYLE22"><a style="cursor:pointer;" onclick="jump()">跳转</a></span>
										</div>
									</td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
			</td>
		</tr>








	  <%--<tr valign="top"><td align="center" class="font3">
	  	 <fkjava:pager
	  	        pageIndex="${requestScope.pageInfo.pageNum}"
	  	        pageSize="${requestScope.pageInfo.pageSize}"
	  	        recordCount="${requestScope.pageInfo.total}"
	  	        style="digg"
	  	        submitUrl="${ctx}/user/selectUser?pageNum=${requestScope.pageInfo.pageNum + 1}"/>
	  </td></tr>--%>
	</table>
	<div style="height:10px;"></div>

	<script type="text/javascript">
		$().ready(function(){
			$("#checkbox11").click(function(){
				if($(this).attr("checked")){
					$(":checkbox").attr("checked",true);
				}else{
					$(":checkbox").attr("checked",false);
				}
			})
		})
		function jump() {

			var num = document.getElementById("num").value;
			if (!/^[1-9][0-9]*$/.test(num)) {
				alert("请输入正确的页码");
				return;
			}

			if (num > ${pageInfo.pageNum}) {
				alert("页码超出范围");
				return;
			}

			window.location.href = "${pageContext.request.contextPath }/user/selectUser?pageNum="
					+ num;

		}
	</script>
</body>
</html>