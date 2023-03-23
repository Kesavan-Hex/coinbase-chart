import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coinplay/helpers/helpers.dart';
import 'package:coinplay/helpers/middle.dart';
import 'package:coinplay/service/api.dart';
import 'package:coinplay/ui/dashboard/widgets/chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:universal_html/html.dart' as html;
import 'widgets/customdrawer.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

String temp = "Bitcoin";
bool showBSheet = false;

List<Color> indicatorColors = [
  Colors.orange,
  Colors.green,
  Colors.blue,
];

List<String> indicators = [
  "Hold Now",
  "Sell Now",
  "Buy Now",
];
Color indicatorColor = indicatorColors[1];
String indicator = indicators[1];

class _DashboardPageState extends State<DashboardPage> {
  @override
  void initState() {
    super.initState();
    // temp =
    //     Provider.of<ApiService>(context, listen: false).user.coinsYouInvested;
    Provider.of<ApiService>(context, listen: false).getCoinsData();
    Provider.of<ApiService>(context, listen: false).checkLogin();
  }

  List<TextEditingController> _controllers =
      List.generate(3, (index) => TextEditingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        foregroundColor: Colors.black,
        title: Text("Crypto Analytics Dashboard"),
        backgroundColor: Colors.white,
      ),
      drawer: CustomDrawer(),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            //above chart
            aboveChartWidget(context),
            //chart
            GestureDetector(
              onTap: () => setState(() {}),
              child: Provider.of<ApiService>(context, listen: true)
                      .user
                      .tradingChart
                  ? ChartPage(
                      title: "",
                      // index: Provider.of<ApiService>(context, listen: true)
                      //     .coins
                      //     .indexOf(Provider.of<ApiService>(context, listen: true)
                      //         .coins
                      //         .where((element) => element.name == temp)),
                    )
                  : SizedBox(),
            ),
            Provider.of<ApiService>(context).user.coinPairsList
                ? CoinDetailsWidget(controllers: _controllers)
                : SizedBox(),
          ],
        ),
      ),
      // bottomSheet:
      //     showBSheet ? bottomDataInputWidget(context) : Text("CoinPlay"),
      // floatingActionButton: FloatingActionButton(
      //     onPressed: () {
      //       setState(() {
      //         showBSheet = !showBSheet;
      //       });
      //     },
      //     child: Icon(Icons.settings)),
    );
  }

  Container aboveChartWidget(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          DropdownButton<String>(
            borderRadius: BorderRadius.circular(10),
            value: temp,
            items: Provider.of<ApiService>(context).coins.map((value) {
              return DropdownMenuItem<String>(
                value: value.name,
                child: Text(value.name),
              );
            }).toList(),
            onChanged: (val) {
              html.window.location.reload();
              if (val != null) {
                setState(() {
                  temp = val;
                  Provider.of<ApiService>(context).user.coinsYouInvested = val;
                });
              }
            },
          ),
          Container(
            padding: const EdgeInsets.only(left: 10, right: 10),
            height: 40,
            width: 120,
            decoration: BoxDecoration(
                color: indicatorColor.withOpacity(0.3),
                borderRadius: BorderRadius.circular(12)),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(
                    FontAwesomeIcons.circleDot,
                    color: indicatorColor,
                    size: 20,
                  ),
                  Text(
                    indicator,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: indicatorColor,
                    ),
                  )
                ]),
          ),
        ],
      ),
    );
  }
}

class CoinDetailsWidget extends StatelessWidget {
  const CoinDetailsWidget({
    super.key,
    required List<TextEditingController> controllers,
  }) : _controllers = controllers;

  final List<TextEditingController> _controllers;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: MediaQuery.of(context).size.width / 0.4,
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: DataTable(
        columns: [
          DataColumn(label: Text("Coin")),
          DataColumn(label: Text("Holding")),
          // DataColumn(label: Text("Bought for")),
          // DataColumn(
          //   label: Text("Sell at"),
          // )
        ],
        rows: [
          DataRow(
            cells: [
              DataCell(StreamBuilder(
                stream: ApiService.getDashBoardDetails(),
                initialData: "Coin Comming",
                builder: (context, AsyncSnapshot snap) {
                  if (snap != null) {
                    return Text(snap.data['interestedIN'].toString());
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                },
              )),
              DataCell(StreamBuilder(
                stream: ApiService.getDashBoardDetails(),
                initialData: "Coin Comming",
                builder: (context, AsyncSnapshot snap) {
                  if (snap != null) {
                    return Text(snap.data['holdingValue'].toString());
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                },
              )),
              // DataCell(StreamBuilder(
              //   stream: ApiService.getDashBoardDetails(),
              //   initialData: "Coin Comming",
              //   builder: (context, AsyncSnapshot snap) {
              //     if (snap != null) {
              //       return Text(snap.data['buyIn'].toString());
              //     } else {
              //       return Center(child: CircularProgressIndicator());
              //     }
              //   },
              // )),
              // DataCell(StreamBuilder(
              //   stream: ApiService.getDashBoardDetails(),
              //   initialData: "Coin Comming",
              //   builder: (context, AsyncSnapshot snap) {
              //     if (snap != null) {
              //       return Text(snap.data['sellIn'].toString());
              //     } else {
              //       return Center(child: CircularProgressIndicator());
              //     }
              //   },
              // )),
            ],
          ),
        ],
      ),
    );
  }
}
