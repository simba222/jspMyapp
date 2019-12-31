<%@ page contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<link href="base.css" rel="stylesheet" type="text/css">
<% request.setCharacterEncoding("euc-kr"); %>



<div class="bodywrap">
	<p class="c">★ 구구단 ★</p>
	<table class="list">
		<thead>
			<tr>
				<% for(int i=2; i<10; i++) {%>
					<th scope="col"><%= i + "단" %></th>
				<% } %>
			</tr>
		</thead>
		<tbody>
			<% for(int i=1; i<10; i++) {%>
				<tr>
					<% for(int j=2; j<10; j++) {%> 
						<td><%= j + " x " + i + " = " + i*j%></td>
					<% } %>
				</tr>
			<% } %>
		</tbody>
	</table>
</div>