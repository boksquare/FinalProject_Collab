
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>

<html>
<head>
    <title>CIS 3368 Final Project</title>
    <style><%@include file="../css/style.css"%></style>
</head>

<body>
<h2>Please Select a Region</h2>
<form method="get" action="/get/">
    <select name ="name">
        <option value="usa">United States</option>
        <option value="india">India</option>
        <option value="china">China</option>
        <option value="brazil">Brazil</option>
        <option value="russia">Russia</option>
        <option value="france">France</option>
        <option value="spain">Spain</option>
        <option value="uk">United Kingdom</option>
        <option value="italy">Italy</option>
        <option value="argentina">Argentina</option>
        <option value="colombia">Colombia</option>
        <option value="mexico">Mexico</option>
        <option value="germany">Germany</option>
        <option value="poland">Poland</option>
        <option value="iran">Iran</option>
        <option value="peru">Peru</option>
        <option value="south_africa">South Africa</option>
        <option value="turkey">Turkey</option>
        <option value="belgium">Belgium</option>
        <option value="indonesia">Indonesia</option>
        <option value="iraq">Iraq</option>
        <option value="netherlands">Netherlands</option>
        <option value="chile">Chile</option>
        <option value="czechia">Czechia</option>
        <option value="romania">Romania</option>
        <option value="bangladesh">Bangladesh</option>
        <option value="philippines">Philippines</option>
        <option value="pakistan">Pakistan</option>
        <option value="canada">Canada</option>
        <option value="morocco">Morocco</option>
        <option value="saudi_arabia">Saudi Arabia</option>
        <option value="switzerland">Switzerland</option>
        <option value="israel">Israel</option>
        <option value="portugal">Portugal</option>
        <option value="austria">Austria</option>
        <option value="sweden">Sweden</option>
        <option value="hungary">Hungary</option>
        <option value="nepal">Nepal</option>
        <option value="jordan">Jordan</option>
        <option value="serbia">Serbia</option>
        <option value="ecuador">Ecuador</option>
        <option value="kazakhstan">Kazakhstan</option>

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
<table class = container>
    <tr>
        <th>Region</th>
        <th>Date</th>
        <th>Total Cases</th>
        <th>New Cases</th>
        <th>Deaths</th>
        <th>Recovered</th>
        <th>User ID</th>
        <c:forEach var = "covid_table" items ="${covidapi}">

    <tr>

        <td>${covid_table.getName()}</td>
        <td>${covid_table.getDate()}</td>
        <td>${covid_table.getTotal_cases()}</td>
        <td>${covid_table.getNew_cases()}</td>
        <td>${covid_table.getDeaths()}</td>
        <td>${covid_table.getRecovered()}</td>
        <td>${covid_table.getUsername()}</td>
    </tr>
    </c:forEach>

</table>
<br>
<form method="post" action="/save">
    <input type="hidden" name="id" value="">
    <input type="hidden" name="name" value= "<%=request.getParameter("name")%>">
    <input type="hidden" name="date" value= "">
    <input type="hidden" name="total_cases" value="<%=request.getParameter("total_cases")%>">
    <input type="hidden" name="new_cases" value="<%=request.getParameter("new_cases")%>">
    <input type="hidden" name="deaths" value="<%=request.getParameter("deaths")%>">
    <input type="hidden" name="recovered" value="<%=request.getParameter("recovered")%>">
    <input type="hidden" name="username" value="<%=request.getParameter("username")%>">
    <input type="submit" value="Save to Table">
</form>

<div>
    <a href="/graph" style="color:white">Open Graph</a>
</div>

</body>

</html>

