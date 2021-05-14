import 'package:air_quality_application/utils/widget_functions.dart';
import 'package:flutter/material.dart';

class RecommendScreen extends StatelessWidget {
  int aqi = 108;
  String status = 'Unhealthy for Sensitive Groups';
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                child: Text(
                  'Recommend',
                  style: theme.headline2?.apply(
                    fontWeightDelta: -1,
                  ),
                ),
              ),
            ),
            addVerticalSpace(15),
            Text('Current AQI', style: theme.headline3?.apply()),
            addVerticalSpace(15),
            Text(
              '$aqi',
              style: theme.headline4?.apply(
                fontSizeFactor: 1.5,
              ),
            ),
            addVerticalSpace(15),
            Text(
              status,
              style: theme.headline6?.apply(
                  color: Colors.deepOrange.shade700, fontSizeFactor: 1.5),
            ),
            addVerticalSpace(16),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              child: _DetailRecommend(
                  sensitive: 'People with asthma are the group most at risk.',
                  effect:
                      ' Increasing likelihood of respiratory symptoms, such as chest tightness and breathing discomfort, in people with asthma.',
                  caution:
                      'People with asthma should consider limiting outdoor exertion.'),
            )
          ],
        ),
      ),
    );
  }
}

class _DetailRecommend extends StatelessWidget {
  String sensitive, effect, caution;
  _DetailRecommend(
      {Key? key,
      required this.sensitive,
      required this.effect,
      required this.caution})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context).textTheme;
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Sensitive Groups',
            style: theme.headline4?.apply(),
          ),
          addVerticalSpace(10),
          Text(
            sensitive,
            style: theme.headline6?.apply(
                fontSizeFactor: 1.2,
                fontWeightDelta: -1,
                color: Colors.grey.shade800,
            heightFactor: 1.5),
          ),
          addVerticalSpace(30),
          Text(
            'Health Effects Statements',
            style: theme.headline4?.apply(),
          ),
          addVerticalSpace(10),
          Text(
            effect,
            style: theme.headline6?.apply(
                fontSizeFactor: 1.2,
                fontWeightDelta: -1,
                color: Colors.grey.shade800,
            heightFactor: 1.5),
          ),
          addVerticalSpace(30),
          Text(
            'Cautionary Statements',
            style: theme.headline4?.apply(),
          ),
          addVerticalSpace(10),
          Text(
            caution,

            style: theme.headline6?.apply(
                fontSizeFactor: 1.2,
                fontWeightDelta: -1,
                color: Colors.grey.shade800,
            heightFactor: 1.5),
          ),
        ],
      ),
    );
  }
}
