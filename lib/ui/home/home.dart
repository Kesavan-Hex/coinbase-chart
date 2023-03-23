import 'dart:async';
import 'dart:developer';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:coinplay/constants.dart';
import 'package:coinplay/helpers/coinlist.dart';
import 'package:coinplay/helpers/helpers.dart';
import 'package:coinplay/helpers/middle.dart';
import 'package:coinplay/service/api.dart';
import 'package:coinplay/ui/about/about.dart';
import 'package:coinplay/ui/contact/contact.dart';
import 'package:coinplay/ui/faq/faq.dart';
import 'package:coinplay/ui/services/services.dart';
//import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool loading = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    log(" Home page before calling works");
    Provider.of<ApiService>(context, listen: false).getCoinsData();
    log(" Home page before calling works");
    Timer(Duration(seconds: 2), () {
      setState(() {
        loading = false;
      });
    });
    Provider.of<ApiService>(context, listen: false).checkLogin();
  }

  int index = 1;
  @override
  Widget build(BuildContext context) {
    List<List<Widget>> wlist = [
      [
        Provider.of<Header>(context).banner(context),
        Provider.of<Coins>(context).allCoins(context),
        BodyContent1(),
        BodyContent2(),
      ],
      [
        About(),
      ],
      [
        Services(),
      ],
      [
        FAQ(),
      ],
      [
        Contact(),
      ],
    ];

    return SafeArea(
      child: Scaffold(
        // bottomNavigationBar: ConvexAppBar(
        //   onTap: (ind) {
        //     setState(() {
        //       index = ind;
        //     });
        //   },
        //   height: 50,
        //   curve: Curves.easeInCubic,
        //   gradient: LinearGradient(
        //       begin: Alignment.topCenter,
        //       end: Alignment.bottomCenter,
        //       colors: [Colors.blue, Consts.primary]),
        //   items: [
        //     TabItem(icon: Icons.home),
        //     TabItem(icon: Icons.currency_bitcoin),
        //     TabItem(icon: Icons.wallet),
        //     TabItem(icon: Icons.bar_chart),
        //     TabItem(icon: Icons.person_2),
        //   ],
        // ),
        backgroundColor: Colors.white,
        body: loading
            ? Center(
                child: CircularProgressIndicator(
                  color: Colors.orange,
                ),
              )
            : SingleChildScrollView(
                child: Column(
                  children: [
                    Provider.of<Header>(context, listen: false).appBar(context),
                    ...wlist[
                        Provider.of<ApiService>(context, listen: true).index],
                    Provider.of<Header>(context).footer(context),
                  ],
                ),
              ),
      ),
    );
  }
}

class BodyContent2 extends StatelessWidget {
  const BodyContent2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 200),
      alignment: Alignment.center,
      child: Text(
        "Whether you are new to cryptocurrency trading or an experienced investor, our platform is designed to help you succeed. Our user-friendly interface makes it easy to access the information you need, and our customizable charts and graphs allow you to visualize market trends and identify potential opportunities.",
        textAlign: TextAlign.center,
        style: GoogleFonts.poppins(
          fontSize: 40,
          wordSpacing: 20,
        ),
      ),
    );
  }
}

class BodyContent1 extends StatelessWidget {
  const BodyContent1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: 300,
            width: 300,
            padding: const EdgeInsets.only(bottom: 20),
            child: Lottie.network(
              "https://assets5.lottiefiles.com/packages/lf20_O1b0iWuPju.json",
              height: 300,
              width: 300,
              fit: BoxFit.cover,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Why choose us",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: MediaQuery.of(context).size.width > 1300
                        ? 70
                        : MediaQuery.of(context).size.width < 700
                            ? 22
                            : 30),
              ),
              SizedBox(height: 25),
              Container(
                padding: const EdgeInsets.only(right: 40),
                width: MediaQuery.of(context).size.width * 0.5,
                child: Text(
                  "Our platform is designed to provide you with the tools you need to make informed decisions about your investments. We offer a range of features, including real-time market data, technical analysis, and trading indicators. Our team of experienced analysts is constantly monitoring the latest trends and developments in the cryptocurrency market to ensure that our data is up-to-date and accurate.",
                  maxLines: 10,
                  style: GoogleFonts.poppins(wordSpacing: 10, fontSize: 28),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
