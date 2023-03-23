import 'dart:async';
import 'dart:convert';
import 'dart:developer' as dev;
import 'package:coinplay/model/quickapi.dart';
import 'package:http/http.dart' as http;
import 'package:coinplay/service/api.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:provider/provider.dart';

class ChartPage extends StatefulWidget {
  ChartPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _ChartPageState createState() => _ChartPageState();
}

//using a random function
class _ChartPageState extends State<ChartPage> {
  StreamController _coinStream = StreamController();
  double time = 0;

  void getData() async {
    var apiurl =
        "https://api.coingecko.com/api/v3/simple/price?ids=bitcoin%2Cethereum%2Ctether%2Cusd-coin%2Cbinancecoin%2Chex%2Cripple%2Cokb%2Ccardano%2Cmatic-network&vs_currencies=inr";
    var response = await http.get(Uri.parse(apiurl));
    var buffer = json.decode(response.body);

    var data = buffer['${widget.title}'];
    dev.log(data['inr'].toString() + " Data");
    _coinStream.sink.add(data['inr']);
  }

  void setCoinChartData() {
    List<double> datas = [];
  }

  LineChartData data = LineChartData();
  void setChartData() {
    data = LineChartData(
        gridData: FlGridData(
          show: false,
          drawVerticalLine: false,
          getDrawingHorizontalLine: (value) {
            return FlLine(
              color: Color(0xff37434d),
              strokeWidth: 1,
            );
          },
          getDrawingVerticalLine: (value) {
            return FlLine(
              color: Color(0xff37434d),
              strokeWidth: 1,
            );
          },
        ),
        titlesData: FlTitlesData(
          show: true,
        ),
        borderData: FlBorderData(
          show: false,
          border: Border.symmetric(
              horizontal: BorderSide(color: Color(0xff37434d), width: 1)),
        ),
        maxX: 300,
        minY: 0,
        lineBarsData: [
          LineChartBarData(
              spots: flspots,
              isCurved: true,
              // colors: gradientColors,
              gradient: LinearGradient(colors: [Colors.blue, Colors.purple]),
              barWidth: 2,
              isStrokeCapRound: true,
              dotData: FlDotData(
                show: false,
              ),
              belowBarData: BarAreaData(
                  show: false,
                  gradient:
                      LinearGradient(colors: [Colors.blue, Colors.purple]))),
        ]);
  }

  List<FlSpot> flspots = [];

  List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];

  @override
  void initState() {
    super.initState();
    setChartData();

    Timer.periodic(Duration(seconds: 10), (timer) {
      setState(() {
        time = time + 10;
      });
      getData();
    });
  }

  @override
  Widget build(BuildContext context) {
    // return SizedBox(
    //   height: MediaQuery.of(context).size.height * .7,
    //   width: MediaQuery.of(context).size.width,
    //   child: LineChart(data),
    // );
    return Container(
      child: StreamBuilder(
        stream: _coinStream.stream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            flspots.add(FlSpot(time, snapshot.data));
            return LineChart(
              LineChartData(
                gridData: FlGridData(
                  show: false,
                  drawVerticalLine: false,
                  getDrawingHorizontalLine: (value) {
                    return FlLine(
                      color: Color(0xff37434d),
                      strokeWidth: 1,
                    );
                  },
                  getDrawingVerticalLine: (value) {
                    return FlLine(
                      color: Color(0xff37434d),
                      strokeWidth: 1,
                    );
                  },
                ),
                titlesData: FlTitlesData(
                  show: true,
                ),
                borderData: FlBorderData(
                  show: false,
                  border: Border.symmetric(
                    horizontal: BorderSide(color: Color(0xff37434d), width: 1),
                  ),
                ),
                // maxY: (snapshot.data + 1),
                maxX: 600,
                // minY: snapshot.data - 1,
                lineBarsData: [
                  LineChartBarData(
                    spots: flspots,
                    isCurved: true,
                    // colors: gradientColors,
                    gradient: LinearGradient(
                      colors: [Colors.blue, Colors.purple],
                    ),
                    barWidth: 2,
                    isStrokeCapRound: true,
                    dotData: FlDotData(
                      show: false,
                    ),
                    belowBarData: BarAreaData(
                      show: false,
                      gradient: LinearGradient(
                        colors: [
                          Colors.blue,
                          Colors.purple,
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
