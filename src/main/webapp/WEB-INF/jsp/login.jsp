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
                    <form>
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
                            <a href="/index" style="color:black">Submit User Login</a>
                        </tr>
                    </form>
                </td>
            </tr>
        </table>
    </div>

</body>
</html>