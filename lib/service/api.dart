import 'dart:collection';
import 'dart:convert';
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coinplay/model/user.dart';
import 'package:firebase_auth_web/firebase_auth_web.dart';
import 'package:coinplay/model/coin.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

FirebaseAuthWeb _auth = FirebaseAuthWeb.instance;

//collection references
FirebaseFirestore _app = FirebaseFirestore.instance;
CollectionReference _userRef = _app.collection("user");

class ApiService extends ChangeNotifier {
  List<String> _tdatas = List.generate(4, (index) => "");
  UnmodifiableListView<String> get tdatas => UnmodifiableListView(_tdatas);

  bool _isLogin = false;
  bool get isLogin => _isLogin;

  CoinPlayUser _user = CoinPlayUser()
    ..username = "Ranjith"
    ..email = "ranjith@cryptoanalytics.ra"
    ..areYouA = "trader"
    ..coinPairsList = true
    ..notes = true
    ..tradingChart = true;
  CoinPlayUser get user => _user;

  int _index = 0;
  int get index => _index;

  List<CoinModel> _coins = [];
  List<double> _rates = [];

  UnmodifiableListView<double> get rates => UnmodifiableListView(_rates);
  UnmodifiableListView<CoinModel> get coins => UnmodifiableListView(_coins);

  void getCoinsData() async {
    var value =
        await http.get(Uri.parse("https://api.coinpaprika.com/v1/tickers"));

    List<dynamic> jsdata = json.decode(value.body);
    //CoinModel.fromMap(jsdata);
    CoinModel data = CoinModel.fromMap(jsdata[0]);

    _coins = List.generate(10, (index) => CoinModel.fromMap(jsdata[index]));

    notifyListeners();
  }

  void updateIndex(int ivalue) {
    _index = ivalue;
    notifyListeners();
  }

  void logIn(String email, String password) async {
    await _auth.signInWithEmailAndPassword(email, password);

    if (_auth.currentUser != null) {
      SharedPreferences _pref = await SharedPreferences.getInstance();

      _pref.setString("uid", _auth.currentUser!.uid);
      await _userRef.doc(_auth.currentUser!.uid).get().then(
            (value) => _user = CoinPlayUser()
              ..username = value['username']
              ..email = value['email']
              ..uid = value['uid']
              ..refId = value['refId']
              ..mobile = value['mobile']
              ..dob = value['dob']
              ..telegramId = value['telegramId']
              ..areYouA = value['areyouA']
              ..coinsYouInvested = value['coinsYouInvestedIn']
              ..interestedIN = value['interestedIn']
              // ..sellIn = value['sellIn']
              ..buyIn = double.parse(value['buyIn'])
              ..holdingValue = double.parse(value['holdingValue']),
          );
      log(_user.username + "user's name");
    } else {}
    log(_user.username + "user's name");
    notifyListeners();
  }

  static signUp(String email, String password) async {
    await _auth.createUserWithEmailAndPassword(email, password);
  }

  void checkLogin() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();

    String buffer = _pref.getString("uid") ?? "no";
    if (buffer != "no") {
      _isLogin = true;
      await _userRef.doc(_auth.currentUser!.uid).get().then(
            (value) => _user = CoinPlayUser()
              ..username = value['username']
              ..email = value['email']
              ..uid = value['uid']
              ..refId = value['refId']
              ..mobile = value['mobile']
              ..dob = value['dob']
              ..telegramId = value['telegramId']
              ..areYouA = value['areyouA'].toString()
              ..coinsYouInvested = value['coinsYouInvestedIn'].toString()
              ..interestedIN = value['interestedIn'].toString()
              // ..sellIn = value['sellIn']
              ..buyIn = double.parse(value['buyIn'])
              ..holdingValue = double.parse(value['holdingValue']),
          );
      log(_user.username + "user's name");
    } else {
      _isLogin = false;
    }
    try {
      await _userRef.doc(_auth.currentUser!.uid).get().then(
            (value) => _user = CoinPlayUser()
              ..username = value['username']
              ..email = value['email']
              ..uid = value['uid']
              ..refId = value['refId']
              ..mobile = value['mobile']
              ..dob = value['dob']
              ..telegramId = value['telegramId']
              ..areYouA = value['areyouA']
              ..coinsYouInvested = value['coinsYouInvestedIn']
              ..interestedIN = value['interestedIn']
              // ..sellIn = value['sellIn']
              ..buyIn = double.parse(value['buyIn'])
              ..holdingValue = double.parse(value['holdingValue']),
          );
    } catch (e) {
      log(e.toString());
    }
    log(_user.username + "user's name");
    notifyListeners();
  }

  void updateChartDisplay(bool data) {
    _user.tradingChart = data;
    notifyListeners();
  }

  void updateCoinPairsList(bool data) {
    _user.coinPairsList = data;
    notifyListeners();
  }

  void updateNotes(bool data) {
    _user.notes = data;
    notifyListeners();
  }

  void setUser(CoinPlayUser tempUser) async {
    log(_auth.currentUser != null ? _auth.currentUser!.uid : "User not found");
    Map<String, dynamic> data = {
      "areYouA": tempUser.areYouA,
      "interestedIN": tempUser.interestedIN,
      "tradingChart": tempUser.tradingChart,
      // "notes": tempUser.notes,
      "holdingValue": tempUser.holdingValue,
      "buyIn": tempUser.buyIn,
      // "sellIn": tempUser.sellIn,
      "username": tempUser.username,
      "uid": _auth.currentUser!.uid,
      "refId": tempUser.refId,
      "mobile": tempUser.mobile,
      "dob": tempUser.dob,
      "telegramId": tempUser.telegramId,
      // "areYouA": tempUser.areYouA,
      // "coinsYouInvested": tempUser.coinsYouInvested,
      // "interestedIn": tempUser.interestedIN,
    };
    _user = tempUser;
    await _userRef.doc(_auth.currentUser!.uid).set(data);
    notifyListeners();
  }

  void updateTdata(String t1, String t2, String t3, String t4) {
    _tdatas = [t1, t2, t3, t4];
    notifyListeners();
  }

  static Stream getDashBoardDetails() {
    return _userRef.doc(_auth.currentUser!.uid).snapshots();
  }
}
