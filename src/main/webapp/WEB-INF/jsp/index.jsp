<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>

<html>
<head>
    <title>CIS 3368 Final Project</title>
</head>

<body>
    <h2>Please Select a Region</h2>
    <form method="get" action="/get/">
        <select name ="name">
            <option value="USA">United States</option>
            <option value="India">India</option>
            <option value="China">China</option>
            <option value="Brazil">Brazil</option>
            <option value="Russia">Russia</option>
            <option value="France">France</option>
            <option value="Spain">Spain</option>
            <option value="UK">United Kingdom</option>
            <option value="Italy">Italy</option>
            <option value="Argentina">Argentina</option>
            <option value="Colombia">Colombia</option>
            <option value="Mexico">Mexico</option>
            <option value="Germany">Germany</option>
            <option value="Poland">Poland</option>
            <option value="Iran">Iran</option>
            <option value="Peru">Peru</option>
            <option value="South Africa">South Africa</option>
            <option value="Ukraine">Ukraine</option>
        </select>
        <input type ="submit" value="Submit">
    </form>
    <hr/>
    <div>
        <h2>Region</h2> <%=request.getParameter("name")%>
        <h2>Total Cases</h2> <%=request.getParameter("total_cases")%>
        <h2>New Cases</h2> <%=request.getParameter("new_cases")%>
        <h2>Deaths</h2> <%=request.getParameter("deaths")%>
        <h2>Recovered</h2> <%=request.getParameter("recovered")%>
    </div>
    <br>
    <table>
        <tr>
            <th>Region</th>
            <th>Total Cases</th>
            <th>New Cases</th>
            <th>Deaths</th>
            <th>Recovered</th>
            <th>User ID</th>
            <c:forEach var = "covid_table" items ="${covidapi}">

        <tr>

        <td>${covid_table.getName()}</td>
        <td>${covid_table.getTotal_cases()}</td>
        <td>${covid_table.getNew_cases()}</td>
        <td>${covid_table.getDeaths()}</td>
        <td>${covid_table.getRecovered()}</td>
        <td>${covid_table.getUser_id()}</td>
        </tr>
            </c:forEach>

    </table>
        <br>
        <form method="post" action="/save">
            <input type="hidden" name="id" value="">
            <input type="hidden" name="name" value= "<%=request.getParameter("name")%>">
            <input type="hidden" name="total_cases" value="<%=request.getParameter("total_cases")%>">
            <input type="hidden" name="new_cases" value="<%=request.getParameter("new_cases")%>">
            <input type="hidden" name="deaths" value="<%=request.getParameter("deaths")%>">
            <input type="hidden" name="recovered" value="<%=request.getParameter("recovered")%>">
            <input type="hidden" name="user_id" value="<%=request.getParameter("user_id")%>">
            <input type="submit" value="Save to Table">
        </form>

    <div>
        <a href="/graph">Open Graph</a>
    </div>

</body>

</html>