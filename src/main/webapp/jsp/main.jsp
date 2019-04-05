<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<%--
  Created by IntelliJ IDEA.
  User: UNOmoist
  Date: 2019/4/4
  Time: 11:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<div>
    <form action="${ctx}/category/query/categoryId" method="post">
        <span>分类文档：</span>
        <select name="id">
            <option value="0">全部</option>
            <c:forEach items="${categories}" var="obj">
                <option value="${obj.id}" <c:if test="${categoryId eq obj.id}"
                        >selected
                        </c:if>>${obj.name}
                </option>
            </c:forEach>
        </select>
        <input type="submit" value="查询"/>
        <%--<a href="${ctx}/entry/addTo">新增电子文档</a>--%>
        <input type="button" value="新增电子文档" id="addBtn"/>
    </form>
</div>
<div>
    <table>
        <thead>
        <tr><th colspan="6"><h2>电子文档</h2></th></tr>
        <tr>
            <th>文档编号</th>
            <th>文档名称</th>
            <th>文档摘要</th>
            <th>上传人</th>
            <th>上传时间</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
            <c:forEach items="${entries}" var="obj">
                <tr>
                    <td>${obj.id}</td>
                    <td>${obj.title}</td>
                    <td>${obj.summary}</td>
                    <td>${obj.uploaduser}</td>
                    <td><fmt:formatDate value="${obj.createdate}"></fmt:formatDate></td>
                    <td>
                        <%--<a href="${ctx}/entry/updateTo/${obj.id}}">修改</a>--%>
                        <a href="${ctx}/entry/updateTo/${obj.id}">修改</a>
                        <a href="${ctx}/entry/delete/${obj.id}">删除</a>
                    </td>
                </tr>
            </c:forEach>
        <%--<tr>--%>
            <%--<td colspan="6">--%>
                <%--<c:if test="${successFlag} eq true">--%>
                    <%--<span style="color: red">修改成功</span>--%>
                <%--</c:if>--%>
            <%--</td>--%>
        <%--</tr>--%>
        </tbody>
    </table>

</div>
<script src="${ctx}/static/jQuery/jquery-3.3.1.min.js"></script>
<script>
    $(function () {
      $('#addBtn').click(function () {
          //获取当前分类id
          var id =  $('form select').val();
          if( id == 0)
          {
              alert('请先选择分类信息');
              return false;
          }
          window.location = '${ctx}/entry/addTo/' + id;
      })
    })
</script>
</body>
</html>
