import 'dart:developer';

import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:coinplay/model/coin.dart';
import 'package:coinplay/service/api.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../../model/user.dart';

class SetUpPage extends StatefulWidget {
  const SetUpPage({super.key});

  @override
  State<SetUpPage> createState() => _SetUpPageState();
}

class _SetUpPageState extends State<SetUpPage> {
  bool tradingChart = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<ApiService>(context, listen: false).updateChartDisplay(false);
    _controllers[3].value = TextEditingValue(text: "Analyst");
    _controllers[4].value = TextEditingValue(text: "Short-term");
  }

  String temp = "Bitcoin";
  bool showBSheet = false;
  List<String> _labels = [
    "Username",
    "Reference Id",
    "Mobile Number",
    "Date of Birth",
    "Telegram Id",
  ];
  List<TextEditingController> _userDetailsController =
      List.generate(5, (index) => TextEditingController());
  List<TextEditingController> _controllers =
      List.generate(9, (index) => TextEditingController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Setup your dashboard"),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //dropdown 1
              Container(
                padding: EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Are you a: "),
                    SizedBox(
                      width: 50,
                    ),
                    DropdownButton<String>(
                      borderRadius: BorderRadius.circular(10),
                      value: _controllers[3].text,
                      items: [
                        DropdownMenuItem(
                          value: "Trader",
                          child: Text("Trader"),
                        ),
                        DropdownMenuItem(
                          value: "Analyst",
                          child: Text("Analyst"),
                        ),
                        DropdownMenuItem(
                          value: "Investor",
                          child: Text("Investor"),
                        ),
                      ],
                      onChanged: (val) {
                        if (val != null) {
                          setState(() {
                            _controllers[3].value = TextEditingValue(text: val);
                          });
                        }
                      },
                    ),
                  ],
                ),
              ),
              //two
              // Container(
              //   child: Row(
              //     children: [
              //       Text("Coins you are interested "),
              //       AutoCompleteTextField(
              //         itemSubmitted: (data) {},
              //         key: GlobalKey<AutoCompleteTextFieldState>(),
              //         suggestions: Provider.of<ApiService>(context).coins,
              //         itemBuilder: (context, coin) {
              //           return ListTile(
              //             title: Text(coin.name),
              //           );
              //         },
              //         itemSorter: (data, daa) {
              //           return 1;
              //         },
              //         itemFilter: (data, daa) {
              //           return true;
              //         },
              //       )
              //     ],
              //   ),
              // ),

              //dropdown 2
              Container(
                padding: EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Interested investment type: "),
                    SizedBox(
                      width: 50,
                    ),
                    DropdownButton<String>(
                      borderRadius: BorderRadius.circular(10),
                      value: _controllers[4].text,
                      items: [
                        DropdownMenuItem(
                          value: "Long-term",
                          child: Text("Long term investment"),
                        ),
                        DropdownMenuItem(
                          value: "Short-term",
                          child: Text("Short term investment"),
                        ),
                      ],
                      onChanged: (val) {
                        if (val != null) {
                          setState(() {
                            _controllers[4].value = TextEditingValue(text: val);
                          });
                        }
                      },
                    ),
                  ],
                ),
              ),
              // //trader and investor
              // Container(
              //   padding: EdgeInsets.all(20),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [
              //       Text("Trading Chart: "),
              //       SizedBox(
              //         width: 50,
              //       ),
              //       ToggleSwitch(
              //         fontSize: 16.0,
              //         initialLabelIndex: 1,
              //         activeBgColor: [Colors.green],
              //         activeFgColor: Colors.white,
              //         inactiveBgColor: Colors.grey,
              //         inactiveFgColor: Colors.grey[900],
              //         totalSwitches: 2,
              //         changeOnTap: true,
              //         labels: ["Yes", "No"],
              //         onToggle: (index) {
              //           setState(() {
              //             _controllers[5].value =
              //                 TextEditingValue(text: index.toString());
              //           });
              //           if (index == 0) {
              //             Provider.of<ApiService>(context, listen: false).user
              //               ..tradingChart = true;
              //           } else {
              //             Provider.of<ApiService>(context, listen: false).user
              //               ..tradingChart = false;
              //           }
              //         },
              //       ),
              //     ],
              //   ),
              // ),

              //dropdown 2
              // Container(
              //   padding: EdgeInsets.all(20),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [
              //       Text("Trading chart: "),
              //       SizedBox(
              //         width: 50,
              //       ),
              //       DropdownButton<bool>(
              //         borderRadius: BorderRadius.circular(10),
              //         value: tradingChart,
              //         items: [
              //           DropdownMenuItem(
              //             value: true,
              //             child: Text("Yes"),
              //           ),
              //           DropdownMenuItem(
              //             value: false,
              //             child: Text("No"),
              //           ),
              //         ],
              //         onChanged: (val) {
              //           if (val != null) {
              //             setState(() {
              //               _controllers[4].value =
              //                   TextEditingValue(text: val.toString());
              //             });
              //           }
              //         },
              //       ),
              //     ],
              //   ),
              // ),
              // Container(
              //   padding: EdgeInsets.all(20),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [
              //       Text("Coin Pairs List: "),
              //       SizedBox(
              //         width: 50,
              //       ),
              //       ToggleSwitch(
              //         fontSize: 16.0,
              //         initialLabelIndex: 1,
              //         activeBgColor: [Colors.green],
              //         activeFgColor: Colors.white,
              //         inactiveBgColor: Colors.grey,
              //         inactiveFgColor: Colors.grey[900],
              //         totalSwitches: 2,
              //         labels: ["Yes", "No"],
              //         onToggle: (index) {
              //           print('switched to: $index');
              //         },
              //       ),
              //     ],
              //   ),
              // ),

              Container(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Interested Coin"),
                    SizedBox(
                      width: 50,
                    ),
                    DropdownButton<String>(
                      borderRadius: BorderRadius.circular(10),
                      value: temp,
                      items:
                          Provider.of<ApiService>(context).coins.map((value) {
                        return DropdownMenuItem<String>(
                          value: value.name,
                          child: Text(value.name),
                        );
                      }).toList(),
                      onChanged: (val) {
                        if (val != null) {
                          setState(() {
                            _controllers[7].value = TextEditingValue(text: val);
                            temp = val;
                          });
                        }
                      },
                    ),
                  ],
                ),
              ),
              Container(
                width: 500,
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _controllers[0],
                  decoration: InputDecoration(
                      label: Text("Number of Coins you having"),
                      enabledBorder: OutlineInputBorder()),
                ),
              ),
              Container(
                width: 500,
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _controllers[1],
                  decoration: InputDecoration(
                      label: Text("How much it costs for 1 coin"),
                      enabledBorder: OutlineInputBorder()),
                ),
              ),
              // Container(
              //   width: 500,
              //   padding: const EdgeInsets.all(8.0),
              //   child: TextField(
              //     controller: _controllers[2],
              //     decoration: InputDecoration(
              //         label: Text("When you want to sell"),
              //         enabledBorder: OutlineInputBorder()),
              //   ),
              // ),

              ...List.generate(
                _labels.length,
                (index) => HorizontalField(
                  userDetailsController: _userDetailsController[index],
                  labels: _labels[index],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    onPressed: () {
                      Provider.of<ApiService>(context, listen: false)
                          .updateTdata(temp, _controllers[0].text,
                              _controllers[1].text, _controllers[2].text);
                      Provider.of<ApiService>(context, listen: false).setUser(

                          //   ApiService.setUser(
                          CoinPlayUser()
                            ..areYouA = _controllers[3].text
                            ..interestedIN = _controllers[4].text
                            ..tradingChart =
                                _controllers[5].text == "0" ? true : false
                            ..notes = _controllers[6].text == "0" ? true : false
                            ..holdingValue = double.parse(_controllers[0].text)
                            ..buyIn = double.parse(_controllers[1].text)
                            ..username = _userDetailsController[0].text
                            ..refId = _userDetailsController[1].text
                            ..mobile = _userDetailsController[2].text
                            ..dob = _userDetailsController[3].text
                            ..telegramId = _userDetailsController[4].text);

                      Navigator.pushReplacementNamed(context, '/dashboard');
                    },
                    child: Text("Submit")),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/dashboard');
                },
                child: Text("Skip"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HorizontalField extends StatelessWidget {
  final String labels;
  const HorizontalField({
    super.key,
    required TextEditingController userDetailsController,
    required this.labels,
  }) : _userDetailsController = userDetailsController;

  final TextEditingController _userDetailsController;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500,
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: _userDetailsController,
        decoration: InputDecoration(
            label: Text(labels), enabledBorder: OutlineInputBorder()),
      ),
    );
  }
}
