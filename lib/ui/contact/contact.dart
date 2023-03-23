import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';

List<String> emails = [
  "ranjitfloran@gmail.com",
  "riya.km912@gmail.com",
  "nishanthini532002@gmail.com",
];

class Contact extends StatelessWidget {
  const Contact({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            "Contact Us",
            style: TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.bold,
            ),
          ),
          // Lottie.network(
          //   "https://assets4.lottiefiles.com/packages/lf20_cc5xesdf.json",
          //   height: 600,
          //   width: 600,
          // ),
          Container(
            height: MediaQuery.of(context).size.height * 0.4,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(horizontal: 200),
            alignment: Alignment.center,
            child: Text(
              "If you have any questions, comments, or feedback, we would love to hear from you! Please feel free to contact us using the information below",
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 30,
                wordSpacing: 15,
              ),
            ),
          ),
          ...List.generate(emails.length,
              (index) => ContactTile(email: emails[index], url: "")),
          SizedBox(height: 100),
          Container(
            height: MediaQuery.of(context).size.height * 0.7,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(horizontal: 200),
            alignment: Alignment.center,
            child: Text(
              "Our support team is available 24/7 to answer your questions and provide assistance with any issues you may be experiencing. We are committed to providing excellent customer service and ensuring that our users have the best possible experience on our platform.\nThank you for choosing Cryptoanalytics!",
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 30,
                wordSpacing: 15,
              ),
            ),
          ),
          SizedBox(height: 60),
          TextButton(
            onPressed: () {
              launchUrl(Uri.parse("https://wa.me/+919080921905"));
            },
            child: Text(
              "+91 9080921905",
              style: GoogleFonts.poppins(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  color: Colors.blue),
            ),
          ),
        ],
      ),
    );
  }
}

class ContactTile extends StatelessWidget {
  final String email;
  final String url;
  const ContactTile({
    super.key,
    required this.email,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      alignment: Alignment.center,
      child: Text(
        email,
        style: GoogleFonts.pacifico(
            fontSize: 30, fontWeight: FontWeight.w300, color: Colors.red),
      ),
    );
  }
}
