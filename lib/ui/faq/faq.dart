import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

List<String> questions = [
  "What is Cryptoanalytics?",
  "What types of cryptocurrencies does Cryptoanalytics cover?",
  "Is Cryptoanalytics free to use?",
  "Is my personal information secure on Cryptoanalytics?",
  "Do you offer customer support?",
];

List<String> ans = [
  "Cryptoanalytics is a platform for cryptocurrency data analysis and trading indications. We provide real-time market data, technical analysis, and customizable charts and graphs to help traders and investors make informed decisions about their investments.",
  "We cover a wide range of cryptocurrencies, including Bitcoin, Ethereum, Litecoin, Ripple, and many more. Our platform is designed to provide comprehensive data analysis for all major cryptocurrencies",
  "We offer a free trial for new users, but after that, we offer paid subscription plans that provide access to additional features and data analysis tools",
  "Yes, we take the security of our users' personal information very seriously. We use advanced security measures to protect your data and ensure that it is not accessed by unauthorized parties.",
  "Yes, we offer 24/7 customer support to help you with any questions or issues you may be experiencing. You can contact us by email or phone, and our support team will be happy to assist you.",
];

class FAQ extends StatelessWidget {
  const FAQ({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Text(
            "FAQ",
            style:
                GoogleFonts.poppins(fontSize: 50, fontWeight: FontWeight.bold),
          ),
          ...List.generate(
            ans.length,
            (index) => FaqTile(
              question: questions[index],
              ans: ans[index],
            ),
          ),
        ],
      ),
    );
  }
}

class FaqTile extends StatelessWidget {
  const FaqTile({
    super.key,
    required this.question,
    required this.ans,
  });

  final String question;
  final String ans;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        //boxShadow: [BoxShadow(color: Colors.purple.shade200, spreadRadius: 5)],
        gradient: LinearGradient(colors: [Colors.blue, Colors.purple]),
        borderRadius: BorderRadius.circular(20),
      ),
      height: 400,
      width: MediaQuery.of(context).size.width * 0.6,
      padding: const EdgeInsets.all(30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            question,
            style: GoogleFonts.poppins(
                fontSize: 35, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            ans,
            textAlign: TextAlign.start,
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 20,
              wordSpacing: 15,
            ),
          ),
        ],
      ),
    );
  }
}
