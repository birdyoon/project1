<%@ page contentType="text/html; charset=euc-kr" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- 
<%@ page import="java.util.List"  %>
<%@ page import="com.model2.mvc.service.domain.*" %>
<%@ page import="com.model2.mvc.view.product.*" %>
<%@ page import="com.model2.mvc.common.Search" %>
<%@page import="com.model2.mvc.common.Page"%>
<%@page import="com.model2.mvc.common.util.CommonUtil"%>

<%
	List<Product> list= (List<Product>)request.getAttribute("list");
	Page resultPage=(Page)request.getAttribute("resultPage");
	Search search=(Search)request.getAttribute("search");
	String menu = (String)request.getAttribute("menu");
	
	String searchCondition = CommonUtil.null2str(search.getSearchCondition());
	String searchKeyword = CommonUtil.null2str(search.getSearchKeyword());
%>	
--%>


<html>
<head>
<title>��ǰ �����ȸ</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<script type="text/javascript">
//�˻� / page �ΰ��� ��� ��� Form ������ ���� JavaScrpt �̿�
<!--
function fncGetList(currentPage) {
		document.getElementById("currentPage").value = currentPage;
	   	document.detailForm.submit();	
}
-->
</script>

</head>

<body bgcolor="#ffffff" text="#000000">

<div style="width:98%; margin-left:10px;">

<!--  <form name="detailForm" action="/listProduct.do?&menu=${menu }" method="post"> -->
<form name="detailForm" action="/product/listProduct?&menu=${menu }" method="post">

<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37">
			<img src="/images/ct_ttl_img01.gif" width="15" height="37"/>
		</td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left:10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">
					<%-- 
					<% if(menu.equals("manage")){	%>
									��ǰ ����						
					<% } else {%>	
								��ǰ �����ȸ 	
					<% } %>
					--%>
			<%--		<c:set var="name" value="manage"/>  --%>
					<c:choose>
					
						<c:when test= "${menu.equals('manage') }" >
								��ǰ ���� 
						</c:when>
			 		
			 			<c:when test= "${menu.equals('search') }">
			 					��ǰ �����ȸ
			 			</c:when>
			 								 	
					 </c:choose>
					</td>
				</tr>
			</table>
		</td>
		<td width="12" height="37">
			<img src="/images/ct_ttl_img03.gif" width="12" height="37"/>
		</td>
	</tr>
</table>


<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		
		<td align="right">
			<select name="searchCondition" class="ct_input_g" style="width:80px">
		<%-- 		<option value="0" <%= (searchCondition.equals("0") ? "selected" : "")%>>��ǰ��ȣ</option>
					<option value="1" <%= (searchCondition.equals("1") ? "selected" : "")%>>��ǰ��</option>
					<option value="2" <%= (searchCondition.equals("2") ? "selected" : "")%>>��ǰ����</option>
		--%>	
				<option value="0"  ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>��ǰ��ȣ</option>
				<option value="1"  ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>��ǰ��</option>
				<option value="2"  ${ ! empty search.searchCondition && search.searchCondition==2 ? "selected" : "" }>��ǰ����</option>
			</select>
			
			<input type="text" name="searchKeyword"  <%--  "<%=searchKeyword %>" --%>
					 value="${! empty search.searchKeyword ? search.searchKeyword : ""}"
						 class="ct_input_g" style="width:200px; height:19px" >
						 
		</td>
		<td align="right" width="70">
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="17" height="23">
						<img src="/images/ct_btnbg01.gif" width="17" height="23">
					</td>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top:3px;">
						<a href="javascript:fncGetList('1');">�˻�</a>
					</td>
					<td width="14" height="23">
						<img src="/images/ct_btnbg03.gif" width="14" height="23">
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>


<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<%-- 
		<td colspan="11" >��ü <%= resultPage.getTotalCount() %> �Ǽ�, ���� <%=resultPage.getCurrentPage() %> ������</td>
		--%>
		<td colspan="11" >
			��ü  ${resultPage.totalCount } �Ǽ�, ���� ${resultPage.currentPage}  ������
		</td>
	</tr>
	<tr>
		<td class="ct_list_b" width="100">No</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">��ǰ��</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">����</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">�����</td>	
		<td class="ct_line02"></td>
		<td class="ct_list_b">�������</td>	
	</tr>
	<tr>
		<td colspan="11" bgcolor="808285" height="1"></td>
	</tr>
	<%-- 	
	<% 
		for(int i=0; i<list.size(); i++) {
			Product vo = list.get(i);
	%>	
	<tr class="ct_list_pop">
		<td align="center"><%= i + 1 %></td>
		<td></td>
				
		<td align="left">
			<a href="/getProduct.do?prodNo=<%=vo.getProdNo() %>&menu=<%=menu%>"><%= vo.getProdName() %></a>
		</td>
		<% System.out.println(vo.getProdNo()); %>
		<td></td>
		<td align="left"><%= vo.getPrice() %></td>
		<td></td>
		<td align="left"><%= vo.getManuDate() %></td>
		<td></td>
		<td align="left">	�Ǹ���	</td>
	--%>	
		
		<c:set var="i" value="0" />
		<c:forEach var="product" items="${list}">
		<c:set var="i" value="${ i+1 }" />
		<tr class="ct_list_pop">
			<td align="center">${product.prodNo }</td>
			<td></td>	
			<!-- <td align="left"><a href="/getProduct.do?prodNo=${product.prodNo}&menu=${menu}">${product.prodName}</a></td>  -->	
			<td align="left"><a href="/product/getProduct?prodNo=${product.prodNo}&menu=${menu}">${product.prodName}</a></td>
			<td></td>
			<td align="left">${product.price}</td>
			<td></td>
			<td align="left">${product.manuDate}</td>
			<td></td>
			<td align="left">	�Ǹ���	</td>
	</tr>
	<tr>
		<td colspan="11" bgcolor="D6D7D6" height="1"></td>
	</tr>	
	<%-- 	<% } %> --%>
	</c:forEach>
			
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<td align="center">
			<input type="hidden" id="currentPage" name="currentPage" value=""/>
		<%-- 	
		<% if( resultPage.getCurrentPage() <= resultPage.getPageUnit() ){ %>
					�� ����
			<% }else{ %>
					<a href="javascript:fncGetProductList('<%=resultPage.getCurrentPage()-1%>')">�� ����</a>
			<% } %>

			<%	for(int i=resultPage.getBeginUnitPage();i<= resultPage.getEndUnitPage() ;i++){	%>
					<a href="javascript:fncGetProductList('<%=i %>');"><%=i %></a>
			<% 	}  %>
	
			<% if( resultPage.getEndUnitPage() >= resultPage.getMaxPage() ){ %>
					���� ��
			<% }else{ %>
					<a href="javascript:fncGetProductList('<%=resultPage.getEndUnitPage()+1%>')">���� ��</a>
			<% } %>
		--%>
		
			<jsp:include page="../common/pageNavigator.jsp"/>
			
		<%--
			for(int i=1 ; i<=totalPage ; i++){
		--%>
		<%-- 	<a href= "/listProduct.do?page=<%=i%>&menu=<%=menu%>"><%=i %></a> --%>
		<%--
			}
		--%>
	   	</td>
	</tr>
</table>
<!--  ������ Navigator �� -->

</form>
</div>

</body>
</html>