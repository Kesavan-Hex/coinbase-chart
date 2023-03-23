import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

import '../constants.dart';

class Middle extends ChangeNotifier {
  Widget iconRow() {
    return Padding(
      padding: const EdgeInsets.only(right: 30, left: 30, top: 30),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Consts.primary.withOpacity(1),
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              margin: const EdgeInsets.only(right: 35),
              padding: const EdgeInsets.all(10),
              child: Icon(Icons.navigation_outlined),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Consts.primary.withOpacity(1),
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              margin: const EdgeInsets.only(right: 40),
              padding: const EdgeInsets.all(10),
              child: Icon(Icons.download),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Consts.primary.withOpacity(1),
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              margin: const EdgeInsets.only(right: 40),
              padding: const EdgeInsets.all(10),
              child: Icon(Icons.qr_code_scanner),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Consts.primary.withOpacity(1),
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              margin: const EdgeInsets.only(right: 40),
              padding: const EdgeInsets.all(10),
              child: Icon(Icons.history),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Consts.primary.withOpacity(1),
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              margin: const EdgeInsets.only(right: 40),
              padding: const EdgeInsets.all(10),
              child: Icon(Icons.navigation_outlined),
            ),
          ],
        ),
      ),
    );
  }

  Widget middleCards() {
    List<String> titles = [
      "P2P Trading",
      "BTC Exchange",
      "Coins Play",
    ];
    List<String> subtitles = [
      "Bank, Paypal, Upi",
      "Exchange Btc for inr",
      "Peer to peer",
    ];
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            ...List.generate(
              titles.length,
              (index) => singleCard(
                titles[index],
                subtitles[index],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container singleCard(String title, String subtitle) {
    return Container(
      padding: const EdgeInsets.all(20),
      height: 200,
      width: 150,
      margin: const EdgeInsets.only(right: 30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomCenter,
          colors: [
            Colors.lightBlue,
            Colors.purple,
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 20,
            ),
          ),
          SizedBox(height: 5),
          Text(
            subtitle,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 15,
            ),
          ),
          SizedBox(height: 30),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                shape: BoxShape.circle, color: Colors.grey.withOpacity(0.2)),
            child: Icon(
              Icons.navigate_next,
              size: 30,
            ),
          ),
        ],
      ),
    );
  }

  Widget tradeCharts() {
    List<double> datas = [0, 2, 1, 4, 1, 3];
    String coin = "BTC";
    String percent = "+2.54%";
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          // chartCard(coin, percent, true, datas, ),
          // chartCard("ETH", "-1.67%", false, [0, 3, 1, 4, 1, 0.8, 2]),
          // chartCard(coin, percent, true, datas),
        ],
      ),
    );
  }

  Padding chartCard(BuildContext context, String coin, String percent,
      bool hike, List<double> datas) {
    return Padding(
      padding: const EdgeInsets.only(right: 0),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(right: 30, left: 30, bottom: 10),
            width: MediaQuery.of(context).size.width * 0.7,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(coin),
                Text(
                  percent,
                  style: TextStyle(color: hike ? Colors.green : Colors.red),
                ),
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.5,
            width: MediaQuery.of(context).size.width * 0.7,
            padding: const EdgeInsets.only(right: 30, left: 30, bottom: 50),
            child: SfSparkLineChart(
              axisLineColor: Colors.purple,
              marker: SparkChartMarker(
                  shape: SparkChartMarkerShape.circle,
                  displayMode: SparkChartMarkerDisplayMode.all),
              data: datas,
            ),
          ),
        ],
      ),
    );
  }
}
