<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<%--
  Created by IntelliJ IDEA.
  User: UNOmoist
  Date: 2019/4/4
  Time: 22:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>新增电子文档</title>
</head>
<body>
<form action="${ctx}/entry/add" method="post">
    <input type="hidden" name="categoryid" value="${categoryid}"/>
    <table>
        <thead>
        <tr>
            <th colspan="2">
                增加电子文档
            </th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>文档名称<span>（*）</span></td>
            <td><input type="text" name="title"/></td>
        </tr>
        <tr>
            <td>文档摘要</td>
            <td>
                <textarea name="summary">

                </textarea>
            </td>
        </tr>
        <tr>
            <td>上传人</td>
            <td>
                <input type="text" name="uploaduser"/>
            </td>
        </tr>
        <tr>
            <td>上传时间<span>（*）</span></td>
            <td>
                <input type="text" name="createdate"/>（yyyy-MM-dd）
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
