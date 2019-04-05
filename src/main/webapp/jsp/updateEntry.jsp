<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<%--
  Created by IntelliJ IDEA.
  User: UNOmoist
  Date: 2019/4/5
  Time: 14:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改信息</title>
</head>
<body>
<form action="${ctx}/entry/update" method="post">
    <input type="hidden" name="categoryid" value="${categoryid}"/>
    <input type="hidden" name="id" value="${entry.id}"/>
    <table>
        <thead>
        <tr>
            <th colspan="2">
                修改电子文档
            </th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>文档编号</td>
            <td>${entry.id}</td>
        </tr>
        <tr>
            <td>文档名称<span>（*）</span></td>
            <td><input type="text" name="title" value="${entry.title}"/></td>
        </tr>
        <tr>
            <td>文档摘要</td>
            <td>
                <textarea name="summary">
                    ${entry.summary}
                </textarea>
            </td>
        </tr>
        <tr>
            <td>上传人</td>
            <td>
                <input type="text" name="uploaduser" value="${entry.uploaduser}"/>
            </td>
        </tr>
        <tr>
            <td>上传时间<span>（*）</span></td>
            <td>

                <input type="text" name="createdate" value="<fmt:formatDate value="${entry.createdate}"></fmt:formatDate>"/>（yyyy-MM-dd）
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <input type="submit" value="提交"/>
                <input type="button" value="返回"/>
            </td>
        </tr>
        </tbody>
    </table>
</form>

</body>
</html>
