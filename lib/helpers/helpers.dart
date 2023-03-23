import 'package:coinplay/constants.dart';
import 'package:coinplay/service/api.dart';
import 'package:coinplay/ui/dashboard/dashboard.dart';
import 'package:coinplay/ui/login/login.dart';
import 'package:coinplay/ui/setup/setupdashboard.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class Header extends ChangeNotifier {
  Widget appBar(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.2,
      padding: const EdgeInsets.only(right: 50, left: 50, top: 50, bottom: 20),
      child: Row(
        children: [
          SizedBox(
            width: 5,
          ),
          Text(
            "Crypto Analytics",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(child: Container()),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: TextButton(
              onPressed: () {
                Provider.of<ApiService>(context, listen: false).updateIndex(0);
              },
              child: Text(
                "Home",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: TextButton(
              onPressed: () {
                Provider.of<ApiService>(context, listen: false).updateIndex(1);
              },
              child: Text(
                "About",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.only(left: 20, right: 20),
          //   child: TextButton(
          //     onPressed: () {
          //       Provider.of<ApiService>(context, listen: false).updateIndex(2);
          //     },
          //     child: Text(
          //       "Services",
          //       style: TextStyle(
          //           fontSize: 20,
          //           fontWeight: FontWeight.bold,
          //           color: Colors.black),
          //     ),
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: TextButton(
              onPressed: () {
                Provider.of<ApiService>(context, listen: false).updateIndex(3);
              },
              child: Text(
                "FAQ",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: TextButton(
              onPressed: () {
                Provider.of<ApiService>(context, listen: false).updateIndex(4);
              },
              child: Text(
                "Contacts",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        Provider.of<ApiService>(context).isLogin
                            ? SetUpPage()
                            : LoginPage(),
                  ),
                );
              },
              child: Text("Login"),
            ),
          )
        ],
      ),
    );
  }

  Widget banner(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(bottom: 0),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.width > 700
            ? MediaQuery.of(context).size.height * 0.8
            : MediaQuery.of(context).size.height,
        alignment: Alignment.center,
        child: GridView.count(
          physics: NeverScrollableScrollPhysics(),
          reverse: true,
          padding: const EdgeInsets.only(top: 0, bottom: 0, right: 0, left: 0),
          shrinkWrap: true,
          crossAxisCount: MediaQuery.of(context).size.width > 1300 ? 2 : 1,
          children: [
            Container(
              padding: EdgeInsets.only(left: 80),
              // alignment: MediaQuery.of(context).size.width > 1300
              //     ? Alignment.centerLeft
              //     : Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Welcome to our Crypto Analytics Website",
                    style: GoogleFonts.raleway(
                        fontWeight: FontWeight.w700,
                        fontSize: MediaQuery.of(context).size.width > 1300
                            ? 70
                            : MediaQuery.of(context).size.width < 700
                                ? 22
                                : 30),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "We specialize in providing accurate and reliable data analysis for cryptocurrency traders and investors.",
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width > 1300
                            ? 40
                            : MediaQuery.of(context).size.width < 700
                                ? 18
                                : 22),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(bottom: 20),
              child: Lottie.network(
                "https://assets5.lottiefiles.com/packages/lf20_yc9ywdm7.json",
                height: MediaQuery.of(context).size.width < 700 ? 70 : 200,
                width: MediaQuery.of(context).size.width < 700
                    ? MediaQuery.of(context).size.width * 0.7
                    : 400,
              ),
            ),
          ],
        ));
  }

  Widget footer(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 50, bottom: 10),
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "All rights reserved © Crypto Analytics",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
