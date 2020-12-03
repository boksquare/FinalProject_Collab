<!DOCTYPE html>

<html>

<head>
    <title>CIS 3368 Final Project</title>
</head>

<body>
    <h2>Please Select a Region</h2>
    <form method="get" action="/get/">
        <input type="text" id = "name" name="name">
        <input type ="submit" value="Submit">
    </form>
    <hr/>
    <div>
        <h2> Total Cases</h2> <%=request.getParameter("total_cases")%>
        <h2>Total Deaths</h2> <%=request.getParameter("Total Deaths")%>
        <h2>New Cases</h2> <%=request.getParameter("Total_cases_today")%>
    </div>


</body>

</html>