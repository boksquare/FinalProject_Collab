<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib prefix="th" uri="http://www.springframework.org/tags/form" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>

<html>
<head>
    <title>Login Page</title>
</head>
<body>
    <div>
        <table>
            <tr>
                <td>
                    <form action="#" th:th:action="@{/login}" th:object="${user}" method="post">
                        <tr>
                            <td>User ID</td>
                            <td>
                                <input type="text" th:field="*{user_id}"/>
                            </td>
                        </tr>
                        <tr>
                            <td>Password</td>
                            <td><input type="password" th:field="*{password}"/></td>
                        </tr>
                        <tr>
                            <input type="submit" value="Login">
                        </tr>
                    </form>
                </td>
            </tr>
        </table>
    </div>

</body>
</html>