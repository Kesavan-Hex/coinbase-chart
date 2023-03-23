import 'package:coinplay/service/api.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class Coins extends ChangeNotifier {
  Widget allCoins(BuildContext context) {
    List<IconData> lables = [
      Icons.currency_bitcoin,
      FontAwesomeIcons.ethereum,
      FontAwesomeIcons.dollarSign,
      FontAwesomeIcons.commentDollar,
      Icons.currency_exchange,
      FontAwesomeIcons.xmark,
      Icons.currency_exchange,
      Icons.currency_exchange,
      Icons.currency_exchange,
      FontAwesomeIcons.dog
    ];
    List<Color> colors = [
      Colors.orange,
      Colors.grey,
      Colors.green,
      Colors.purple.shade100,
      Colors.blue.shade300,
      Colors.yellow,
      Colors.teal,
      Colors.indigo.shade100,
      Colors.brown.shade200,
      Colors.lime,
    ];
    List<String> urls = [
      "https://bitcoin.org/",
      "https://ethereum.org/",
      "https://tether.to/",
      "https://en.wikipedia.org/wiki/USD_Coin",
      "https://www.binance.com/en/bnb",
      "https://ripple.com/xrp/",
      "https://hex.com/",
      "https://www.okx.com/en-in/okb",
      "https://cardano.org/",
      "https://dogecoin.com/",
    ];
    return Provider.of<ApiService>(context, listen: true).coins.length == 0
        ? Center(child: CircularProgressIndicator(color: Colors.orange))
        : SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.only(left: 150, right: 150),
              child: DataTable(
                dataRowHeight: 100,
                columns: [
                  DataColumn(
                      label: Text(
                    "#",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  )),
                  DataColumn(
                      label: Text(
                    "Coin",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  )),
                  DataColumn(
                      label: Text(
                    "Price",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  )),
                  DataColumn(
                      label: Text(
                    "1h",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  )),
                  DataColumn(
                      label: Text(
                    "12h",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  )),
                  DataColumn(
                      label: Text(
                    "24h",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  )),
                  DataColumn(
                      label: Text(
                    "1y",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  )),
                  DataColumn(
                      label: Text(
                    "7d",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  )),
                  DataColumn(
                      label: Text(
                    "Market Cap",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  )),
                ],
                rows: [
                  ...List.generate(
                    10,
                    (index) => DataRow(
                      cells: [
                        DataCell(
                          Text(Provider.of<ApiService>(context, listen: true)
                              .coins[index]
                              .rank
                              .toString()),
                        ),
                        DataCell(InkWell(
                          onTap: () {
                            launchUrl(Uri.parse(urls[index]));
                          },
                          child: Row(
                            children: [
                              Icon(
                                lables[index],
                                color: colors[index],
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                Provider.of<ApiService>(context, listen: true)
                                    .coins[index]
                                    .name,
                                style: TextStyle(
                                    fontSize: 16, color: Colors.black),
                              ),
                            ],
                          ),
                        )),
                        DataCell(
                          Text(
                            "\$ ${Provider.of<ApiService>(context, listen: true).coins[index].quotes.usd.price.toStringAsFixed(3)}",
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                        ),
                        DataCell(
                          Text(
                            "${Provider.of<ApiService>(context, listen: true).coins[index].quotes.usd.percentChange1H.toString()} %",
                            style: TextStyle(
                              fontSize: 16,
                              color:
                                  Provider.of<ApiService>(context, listen: true)
                                          .coins[index]
                                          .quotes
                                          .usd
                                          .percentChange1H
                                          .toString()
                                          .contains("-")
                                      ? Colors.red
                                      : Colors.green,
                            ),
                          ),
                        ),
                        DataCell(
                          Text(
                            "${Provider.of<ApiService>(context, listen: true).coins[index].quotes.usd.percentChange12H.toString()} %",
                            style: TextStyle(
                              fontSize: 16,
                              color:
                                  Provider.of<ApiService>(context, listen: true)
                                          .coins[index]
                                          .quotes
                                          .usd
                                          .percentChange12H
                                          .toString()
                                          .contains("-")
                                      ? Colors.red
                                      : Colors.green,
                            ),
                          ),
                        ),
                        DataCell(
                          Text(
                            "${Provider.of<ApiService>(context, listen: true).coins[index].quotes.usd.percentChange24H.toString()} %",
                            style: TextStyle(
                              fontSize: 16,
                              color:
                                  Provider.of<ApiService>(context, listen: true)
                                          .coins[index]
                                          .quotes
                                          .usd
                                          .percentChange24H
                                          .toString()
                                          .contains("-")
                                      ? Colors.red
                                      : Colors.green,
                            ),
                          ),
                        ),
                        DataCell(
                          Text(
                            "${Provider.of<ApiService>(context, listen: true).coins[index].quotes.usd.percentChange1Y.toString()} %",
                            style: TextStyle(
                              fontSize: 16,
                              color:
                                  Provider.of<ApiService>(context, listen: true)
                                          .coins[index]
                                          .quotes
                                          .usd
                                          .percentChange1Y
                                          .toString()
                                          .contains("-")
                                      ? Colors.red
                                      : Colors.green,
                            ),
                          ),
                        ),
                        DataCell(
                          Text(
                            "${Provider.of<ApiService>(context, listen: true).coins[index].quotes.usd.percentChange7D.toString()} %",
                            style: TextStyle(
                              fontSize: 16,
                              color:
                                  Provider.of<ApiService>(context, listen: true)
                                          .coins[index]
                                          .quotes
                                          .usd
                                          .percentChange7D
                                          .toString()
                                          .contains("-")
                                      ? Colors.red
                                      : Colors.green,
                            ),
                          ),
                        ),
                        DataCell(
                          Text(
                            Provider.of<ApiService>(context, listen: true)
                                .coins[index]
                                .quotes
                                .usd
                                .marketCap
                                .toString(),
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
