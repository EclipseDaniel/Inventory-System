<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InventoryReportView.aspx.cs" Inherits="Inventory_System.InventoryReportView" %>

<!doctype html>
<html>

<head>
    <title>Cafe by the Ruins</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>
    <script src="Scripts/Chart.min.js"></script>
    <script src="Scripts/utils.js"></script>
    <link href="css/prodStyle.css" rel="stylesheet" />
    <link href="css/style.css" rel="stylesheet" />
    <style>
        canvas {
            -moz-user-select: none;
            -webkit-user-select: none;
            -ms-user-select: none;
        }
    </style>
        
</head>
<body style="align-content:center">

    <div class="navbar">
  <a href="About.aspx">Home</a>
  <a href="Contact.aspx">Contacts</a>
  <a href="PurchasingModule.aspx">Purchase</a>
  <a href="InventoryModule.aspx">Inventory</a>
  <a href="MenuModule.aspx">Menu</a>
  <a href="ProductionModule.aspx">Production</a>
  <a href="SupplierModule.aspx">Supplier</a>
  <a href="InventoryReportView.aspx">Forecasting</a>
  <div class="dropdownReport">
    <button class="dropbtnReport">Reports 
      <i class="fa fa-caret-down"></i>
    </button>
    <div class="contentNavbar">
      <a href="Reports.aspx">Purchase Order Reports</a>
      <a href="ProductionReports">Production Reports</a>
      <a href="CrystelReportsItemDetails.aspx">Item Details Reports</a>
    </div>
  </div> 
</div>

    <h1> Inventory Report View</h1>
    <div style="align-content:center; text-align:center; position:absolute; margin:200px,30px">
        <div style="width: 1550px;; vertical-align:central ">
        <canvas id="chart1"></canvas>
    </div>
    <br>
    <br>
    Chart Type:
	<select id="type">
        <option value="line">Line</option>
        <option value="bar">Bar</option>
    </select>
    <select id="unit">
        <option value="day" selected>Day</option>
        <option value="month">Month</option>
        <option value="year">Year</option>
    </select>
    <button id="update">update</button>

    <script>
        function generateData() {
            var unit = document.getElementById('unit').value;
            function unitLessThanDay() {
                return unit === 'second' || unit === 'minute' || unit === 'hour';
            }
            function beforeNineThirty(date) {
                return date.hour() < 9 || (date.hour() === 9 && date.minute() < 30);
            }
            // Returns true if outside 9:30am-4pm on a weekday
            function outsideMarketHours(date) {
                if (date.isoWeekday() > 5) {
                    return true;
                }
                if (unitLessThanDay() && (beforeNineThirty(date) || date.hour() > 16)) {
                    return true;
                }
                return false;
            }
            function randomNumber(min, max) {
                return Math.random() * (max - min) + min;
            }
            function randomBar(date, lastClose) {
                var open = randomNumber(lastClose * 0.95, lastClose * 1.05).toFixed(2);
                var close = randomNumber(open * 0.95, open * 1.05).toFixed(2);
                return {
                    t: date.valueOf(),
                    y: close
                };
            }
            var date = moment('Jan 01 1990', 'MMM DD YYYY');
            var now = moment();
            var data = [];
            var lessThanDay = unitLessThanDay();
            for (; data.length < 60 && date.isBefore(now); date = date.clone().add(1, unit).startOf(unit)) {
                if (outsideMarketHours(date)) {
                    if (!lessThanDay || !beforeNineThirty(date)) {
                        date = date.clone().add(date.isoWeekday() >= 5 ? 8 - date.isoWeekday() : 1, 'day');
                    }
                    if (lessThanDay) {
                        date = date.hour(9).minute(30).second(0);
                    }
                }
                data.push(randomBar(date, data.length > 0 ? data[data.length - 1].y : 30));
            }
            return data;
        }

        var ctx = document.getElementById('chart1').getContext('2d');
        ctx.canvas.width = 1000;
        ctx.canvas.height = 300;
        var color = Chart.helpers.color;
        var cfg = {
            type: 'bar',
            data: {
                datasets: [{
                    label: 'Invertory Status Review',
                    backgroundColor: color(window.chartColors.red).alpha(0.5).rgbString(),
                    borderColor: window.chartColors.red,
                    data: generateData(),
                    type: 'line',
                    pointRadius: 0,
                    fill: false,
                    lineTension: 0,
                    borderWidth: 2
                }]
            },
            options: {
                scales: {
                    xAxes: [{
                        type: 'time',
                        distribution: 'series',
                        ticks: {
                            source: 'data',
                            autoSkip: true
                        }
                    }],
                    yAxes: [{
                        scaleLabel: {
                            display: true,
                            labelString: 'Inventory Demand'
                        }
                    }]
                },
                tooltips: {
                    intersect: false,
                    mode: 'index',
                    callbacks: {
                        label: function (tooltipItem, myData) {
                            var label = myData.datasets[tooltipItem.datasetIndex].label || '';
                            if (label) {
                                label += ': ';
                            }
                            label += parseFloat(tooltipItem.value).toFixed(2);
                            return label;
                        }
                    }
                }
            }
        };
        var chart = new Chart(ctx, cfg);
        document.getElementById('update').addEventListener('click', function () {
            var type = document.getElementById('type').value;
            var dataset = chart.config.data.datasets[0];
            dataset.type = type;
            dataset.data = generateData();
            chart.update();
        });
    </script>
    </div>
    
</body>

</html>
