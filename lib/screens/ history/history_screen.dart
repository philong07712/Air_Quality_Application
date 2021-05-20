import 'package:air_quality_application/models/Data.dart';
import 'package:air_quality_application/service/HttpService.dart';
import 'package:air_quality_application/utils/styleguides/colors.dart';
import 'package:air_quality_application/utils/widget_functions.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:air_quality_application/utils/widget_extensions.dart';
import 'package:provider/provider.dart';

class HistoryScreen extends StatefulWidget {
  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  List<charts.Series<Data, DateTime>> seriesList =
      <charts.Series<Data, DateTime>>[];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var httpService = Provider.of<HttpService>(context, listen: false);
    var size = MediaQuery.of(context).size;
    var theme = Theme.of(context).textTheme;
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8),
            width: size.width,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [darkBlueGradientColor, lightBlueGradientColor])),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                'History',
                style: theme.headline5?.apply(
                    fontWeightDelta: -2,
                    fontSizeFactor: 1.2,
                    color: Colors.white),
              ).center(),
            ),
          ),
          addVerticalSpace(15),
          FutureBuilder(
            future: httpService.fetchListData(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Data> list = snapshot.data as List<Data>;

                seriesList.add(charts.Series(
                  id: 'aqi',
                  data: list,
                  domainFn: (Data newData, _) => newData.time,
                  measureFn: (Data newData, _) => newData.aqi,
                  colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
                ));
                return Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  width: size.width,
                  height: size.height * 6 / 9,
                  child: charts.TimeSeriesChart(
                    seriesList,
                    animate: true,
                    defaultRenderer:
                        charts.LineRendererConfig(includePoints: true),
                    dateTimeFactory: const charts.LocalDateTimeFactory(),
                  ),
                );
              }
              return CircularProgressIndicator();
            },
          ),
        ],
      ),
    ));
  }
}
