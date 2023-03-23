class CoinPlayUser {
  //personal data
  String username = "";
  String email = "";
  String uid = "";
  String refId = "";
  String mobile = "";
  String country = "";
  String state = "";
  String dob = "";
  String telegramId = "";

  //financial data
  String areYouA = ""; //Trader or Analyst or Investor
  String coinsYouInvested = "";
  String interestedIN = ""; // Longterm or short term investing

  //only for trader and analyst
  bool tradingChart = false;
  bool coinPairsList = false;
  bool notes = false;

  //coin details
  double holdingValue = 0.0;
  double sellIn = 0.0;
  double buyIn = 0.0;
}
