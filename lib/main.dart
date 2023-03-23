import 'package:coinplay/constants.dart';
import 'package:coinplay/helpers/coinlist.dart';
import 'package:coinplay/helpers/helpers.dart';
import 'package:coinplay/helpers/middle.dart';
import 'package:coinplay/service/api.dart';
import 'package:coinplay/ui/dashboard/dashboard.dart';
import 'package:coinplay/ui/dashboard/widgets/chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'ui/home/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(CoinPlayApp());
}

class CoinPlayApp extends StatelessWidget {
  const CoinPlayApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ListenableProvider(create: (context) => ApiService()),
          ChangeNotifierProvider.value(value: Header()),
          ChangeNotifierProvider.value(value: Middle()),
          ChangeNotifierProvider.value(value: Coins()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            textTheme: Typography.blackMountainView,
            iconTheme: IconThemeData(
              color: Colors.grey.shade300,
              size: 30,
            ),
          ),
          initialRoute: '/',
          routes: Consts.routeS,
        ));
  }
}
