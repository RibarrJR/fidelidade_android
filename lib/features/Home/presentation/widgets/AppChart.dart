import 'package:fidelidade_android/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'dart:math';
import 'package:intl/intl.dart';

import 'AppChartButton.dart';

class _ChartData {
  _ChartData(this.x, this.y1, this.y2);
  final String x;
  final double? y1;
  final double? y2;
}

class AppChart extends StatefulWidget {
  const AppChart({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _AppChart();
  }
}

class _AppChart extends State<AppChart> {
  Map buttons = {
    'btn1Selected': false,
    'btn2Selected': true,
    'btn3Selected': false,
  };
  List<_ChartData> data = <_ChartData>[];
  final _tooltip = TooltipBehavior(enable: true);

  List<double> _generateListOfNumber(int count) {
    Random random = Random();
    List<double> list = [];
    for (var i = 0; i < count; i++) {
      double randomNumber = random.nextInt(100).toDouble();
      list.add(randomNumber);
    }
    return list;
  }

  List<String> _createListOfDatesWithGivenNumber(int numberOfDays) {
    List<String> datesList = [];

    for (var i = 0; i < numberOfDays; i++) {
      var currentDate = DateTime.now();
      var date = currentDate.subtract(Duration(days: i));
      var day = date.day;
      String month = DateFormat('MMM').format(date);
      datesList.insert(0, '$day $month');
    }
    return datesList;
  }

  void _resetButtons() {
    buttons['btn1Selected'] = false;
    buttons['btn2Selected'] = false;
    buttons['btn3Selected'] = false;
  }

  void onButtonSelected(String btn) {
    setState(() {
      _resetButtons();
      buttons[btn] = true;
    });

    switch (btn) {
      case 'btn1Selected':
        generateChartValues(7);
        break;
      case 'btn2Selected':
        generateChartValues(15);
        break;
      case 'btn3Selected':
        generateChartValues(30);
        break;
      default:
    }
  }

  void generateChartValues(int amount) {
    List<double> listOfCoinsValues = [];
    List<double> listOfCurrencyValues = [];
    List<String> listofDays = [];
    data = [];
    listOfCoinsValues = _generateListOfNumber(amount);
    listOfCurrencyValues = _generateListOfNumber(amount);
    listofDays = _createListOfDatesWithGivenNumber(amount);
    for (var i = 0; i < amount; i++) {
      data.add(_ChartData(
          listofDays[i], listOfCurrencyValues[i], listOfCoinsValues[i]));
    }
  }

  @override
  void initState() {
    onButtonSelected('btn2Selected');
    int amount = 15;
    generateChartValues(amount);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: disabledBg,
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      padding: const EdgeInsets.only(top: 10.0),
      margin: const EdgeInsets.all(16.00),
      child: Column(
        children: [
          Center(
            child: Container(
              margin: const EdgeInsets.only(bottom: 6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  AppChartButton(
                    label: '7 dias',
                    name: 'btn1Selected',
                    onSelect: onButtonSelected,
                    selected: buttons['btn1Selected'],
                  ),
                  AppChartButton(
                    label: '15 dias',
                    name: 'btn2Selected',
                    onSelect: onButtonSelected,
                    selected: buttons['btn2Selected'],
                  ),
                  AppChartButton(
                    label: '30 dias',
                    name: 'btn3Selected',
                    onSelect: onButtonSelected,
                    selected: buttons['btn3Selected'],
                  ),
                ],
              ),
            ),
          ),
          SfCartesianChart(
            backgroundColor: disabledBg,
            enableSideBySideSeriesPlacement: true,
            plotAreaBorderWidth: 0,
            plotAreaBorderColor: Colors.transparent,
            primaryXAxis: CategoryAxis(
                name: 'eixo x',
                isVisible: true,
                labelStyle: const TextStyle(color: primaryColor),
                borderColor: Colors.transparent,
                majorGridLines: const MajorGridLines(color: Colors.transparent),
                majorTickLines: const MajorTickLines(size: 0),
                axisLine: const AxisLine(color: Colors.transparent)),
            primaryYAxis: NumericAxis(
                name: 'eixo y',
                labelStyle: const TextStyle(color: primaryColor),
                minimum: 0,
                // interval: 10,
                majorGridLines: const MajorGridLines(color: gray),
                majorTickLines: const MajorTickLines(size: 0),
                axisLine: const AxisLine(color: Colors.transparent)),
            tooltipBehavior: _tooltip,
            series: [
              ColumnSeries(
                  borderColor: primaryColor,
                  borderRadius: const BorderRadius.all(Radius.circular(4)),
                  borderWidth: 2,
                  dataSource: data,
                  opacity: 1,
                  xValueMapper: (_ChartData data, _) => data.x,
                  yValueMapper: (_ChartData data, _) => data.y1,
                  name: "coins",
                  color: primaryColor,
                  spacing: 0.2,
                  width: 0.5,
                  dataLabelSettings: const DataLabelSettings(isVisible: false)),
              ColumnSeries(
                  borderColor: primaryColor,
                  borderRadius: const BorderRadius.all(Radius.circular(4)),
                  borderWidth: 2,
                  dataSource: data,
                  width: 0.5,
                  xValueMapper: (_ChartData data, _) => data.x,
                  yValueMapper: (_ChartData data, _) => data.y2,
                  name: "money",
                  color: Colors.white,
                  spacing: 0.2,
                  dataLabelSettings: const DataLabelSettings(isVisible: false)),
            ],
          ),
          Container(
            height: 5,
            decoration: const BoxDecoration(
              color: disabledBg,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(8.0),
                bottomLeft: Radius.circular(8.0),
              ),
            ),
          )
        ],
      ),
    );
  }
}
