<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InventoryReportView.aspx.cs" Inherits="Inventory_System.InventoryReportView" %>

<!DOCTYPE HTML>
<html>
<head>
    <script>
        window.onload = function () {

            var chart = new CanvasJS.Chart("chartContainer", {
                animationEnabled: true,
                title: {
                    text: "Product Trends By Month"
                },
                axisY: {
                    includeZero: false
                },
                toolTip: {
                    shared: true
                },
                data: [{
                    type: "line",
                    name: "Desktops",
                    showInLegend: true,
                    dataPoints: @Html.Raw(ViewBag.DataPoints1)
        }, {
                type: "line",
                name: "Laptops",
                showInLegend: true,
                dataPoints: @Html.Raw(ViewBag.DataPoints2)
	}, {
            type: "line",
                name: "Mobiles",
                    showInLegend: true,
                        dataPoints: @Html.Raw(ViewBag.DataPoints3)
        }]
});
        chart.render();
 
}
    </script>
</head>
<body>
    <div id="chartContainer" style="height: 370px; width: 100%;"></div>
    <script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
</body>
</html>
