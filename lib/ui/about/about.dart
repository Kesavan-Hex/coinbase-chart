import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            "About Us",
            style: TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.5,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(horizontal: 200),
            alignment: Alignment.center,
            child: Text(
              "We believe that cryptocurrency has the potential to revolutionize the financial industry, and we are committed to helping our users navigate this exciting and dynamic market. Whether you are new to cryptocurrency trading or an experienced investor, our platform is the perfect tool for achieving your investment goals. Sign up today to start exploring the world of cryptocurrency trading with confidence!",
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 40,
                wordSpacing: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
