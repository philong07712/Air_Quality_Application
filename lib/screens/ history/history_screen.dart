import 'package:air_quality_application/models/Data.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
class HistoryScreen extends StatefulWidget {
  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  List<charts.Series<Data, DateTime>> seriesList = <charts.Series<Data, DateTime>>[];


  @override
  void initState() {
    super.initState();
    _generateData();
  }

  _generateData() {
    final data = [
      new Data(aqi: 30, time: DateTime(2021, 4, 26)),
      new Data(aqi: 40, time: DateTime(2021, 4, 27)),
      new Data(aqi: 150, time: DateTime(2021, 4, 28)),
      new Data(aqi: 80, time: DateTime(2021, 4, 29)),
      new Data(aqi: 77, time: DateTime(2021, 4, 30)),
      new Data(aqi: 44, time: DateTime(2021, 5, 1)),
      new Data(aqi: 64, time: DateTime(2021, 5, 2)),
      new Data(aqi: 31, time: DateTime(2021, 5, 3)),
      new Data(aqi: 29, time: DateTime(2021, 5, 4)),
      new Data(aqi: 86, time: DateTime(2021, 5, 5)),
    ];

    seriesList.add(
      charts.Series(
        id: 'aqi',
        data: data,
        domainFn: (Data newData,_) => newData.time,
        measureFn: (Data newData,_) => newData.aqi,
        colorFn: (_,__) => charts.MaterialPalette.blue.shadeDefault,
        measureLowerBoundFn: (Data newData, _) => newData.aqi - 5,
        measureUpperBoundFn: (Data newData, _) => newData.aqi + 5,

      )
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var theme = Theme.of(context).textTheme;
    return SafeArea(child: Scaffold(
      body: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Text(
                'History',
                style: theme.headline2?.apply(
                  fontWeightDelta: -1,
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            width: size.width,
            height: size.height * 6 / 9,
            child: charts.TimeSeriesChart(
              seriesList,
              animate: true,
              defaultRenderer: charts.LineRendererConfig(includePoints: true),
              dateTimeFactory: const charts.LocalDateTimeFactory(),
            ),
          ),
        ],
      ),
    ));
  }
}
