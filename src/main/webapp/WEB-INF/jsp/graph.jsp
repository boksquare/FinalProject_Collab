
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<style><%@include file="../css/style.css"%></style>

<head>


    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

    <script src="https://code.highcharts.com/highcharts.js"></script>

    <script src="https://code.highcharts.com/modules/data.js"></script>

    <script src="https://code.highcharts.com/modules/exporting.js"></script>

    <script src="https://code.highcharts.com/modules/export-data.js"></script>

    <script type="text/javascript">

        $(function() {

            Highcharts.chart('container', {

                data: {

                    table: 'tableContent'

                },

                chart: {

                    type: 'column'

                },

                title: {

                    text: 'Data extracted from a HTML table in the page'

                },

                yAxis: {

                    allowDecimals: false,

                    title: {

                        text: 'Total Cases'

                    }

                },

                tooltip: {

                    formatter: function() {

                        return '<b>' + this.series.name + '</b><br/>' +

                            this.point.y + ' ' + this.point.name.toLowerCase();

                    }

                }

            });



        });

    </script>

</head>
<body>

<div id="container" style="width: 100%; height: 400px;"> </div>

<table id = "tableContent" class = graph>
    <thead>
    <tr>
        <th>Region</th>
        <th>Total Cases</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var = "covid_table" items ="${covidapi}">
        <tr>
            <td>${covid_table.getName()}</td>
            <td>${covid_table.getTotal_cases()}</td>
        </tr>
    </c:forEach>
    </tbody>

</table>
<div>
    <a href="/index" style="color:white">Go Back</a>
</div>
</body>
</html>