import 'package:air_quality_application/components/InfoBigCard.dart';
import 'package:air_quality_application/utils/constants.dart';
import 'package:air_quality_application/utils/styleguides/colors.dart';
import 'package:air_quality_application/utils/widget_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:air_quality_application/utils/widget_extensions.dart';
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context).textTheme;
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Text(
                'AQI Prediction',
                style: theme.headline2?.apply(
                  fontWeightDelta: -1,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: _Prediction(
              f1: 30,
              f8: 60,
              f24: 200,
            ),
          ),
          Expanded(
            flex: 5,
            child: _DetailList(
              aqi: 43,
              pm: 0.02,
              co2: 219.45,
              co: 1.57,
              temperature: 33.8,
              humidity: 60,
            ),
          )
        ],
      ),
    ));
  }
}

class _Prediction extends StatelessWidget {
  int f1, f8, f24;
  _Prediction({Key? key, required this.f1, required this.f8, required this.f24})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _PredictItem(aqi: f1, title: 'F1 AQI'),
          _PredictItem(aqi: f8, title: 'F8 AQI'),
          _PredictItem(aqi: f24, title: 'F24 AQI')
        ],
      ),
    );
  }
}

class _PredictItem extends StatelessWidget {
  String title;
  int aqi;
  String status = StatusCode.good;
  _PredictItem({Key? key, required this.aqi, required this.title})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var theme = Theme.of(context).textTheme;
    var color = Colors.green.shade800;
    if (aqi > 50) {
      color = Colors.yellow.shade700;
      status = StatusCode.moderate;
    }
    if (aqi > 100) {
      color = Colors.deepOrangeAccent;
      status = StatusCode.unhealthySensitive;
    }
    if (aqi > 150) {
      color = Colors.red;
      status = StatusCode.unhealthy;
    }
    if (aqi > 200) {
      color = Colors.purple;
      status = StatusCode.veryUnhealthy;
    }
    if (aqi > 300) {
      color = Colors.red.shade900;
      status = StatusCode.hazardous;
    }
    return Container(
      width: size.width / 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: theme.headline3
                ?.apply(color: Colors.black, fontWeightDelta: -2),
          ).center(),
          addVerticalSpace(10),
          Text(
            'AQI: $aqi',
            style: theme.headline5?.apply(
                color: Colors.black, fontWeightDelta: -1, fontSizeFactor: 1.2),
          ).center(),
          addVerticalSpace(10),
          Text(
            status,
            style: theme.bodyText1?.apply(color: color, fontWeightDelta: 1),
          ).center()
        ],
      ),
    );
  }
}

class _DetailList extends StatelessWidget {
  double co2, co, pm, temperature, humidity;
  int aqi;
  _DetailList(
      {Key? key,
      required this.aqi,
      required this.co2,
      required this.co,
      required this.pm,
      required this.temperature,
      required this.humidity})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      color: Colors.white,
      child: Table(
        children: [
          TableRow(
            children: [
              InfoBigCard(
                firstText: '$aqi',
                secondText: 'AQI',
                icon: Icon(
                  Icons.priority_high_outlined,
                  size: 25,
                  color: lightBlueGradientColor,
                ),
              ),
              InfoBigCard(
                firstText: '$co2 ppm',
                secondText: 'CO2',
                icon: Icon(
                  Icons.speed,
                  size: 25,
                  color: lightBlueGradientColor,
                ),
              ),
            ],
          ),
          TableRow(
            children: [
              InfoBigCard(
                firstText: '$co ppm',
                secondText: 'CO',
                icon: Icon(
                  Icons.speed,
                  size: 25,
                  color: lightBlueGradientColor,
                ),
              ),
              InfoBigCard(
                firstText: '$pm mg/m3',
                secondText: 'PM2.5',
                icon: Icon(
                  Icons.delete_sweep_rounded,
                  size: 25,
                  color: lightBlueGradientColor,
                ),
              ),
            ],
          ),
          TableRow(
            children: [
              InfoBigCard(
                firstText: '$temperature C',
                secondText: 'temperature',
                icon: Icon(
                  Icons.whatshot,
                  size: 25,
                  color: lightBlueGradientColor,
                ),
              ),
              InfoBigCard(
                firstText: '$humidity %',
                secondText: 'humidity',
                icon: Icon(
                  Icons.water_damage_outlined,
                  size: 25,
                  color: lightBlueGradientColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
