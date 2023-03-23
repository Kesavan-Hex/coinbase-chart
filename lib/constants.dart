import 'dart:js';

import 'package:coinplay/ui/contact/contact.dart';
import 'package:coinplay/ui/dashboard/dashboard.dart';
import 'package:coinplay/ui/faq/faq.dart';
import 'package:coinplay/ui/home/home.dart';
import 'package:coinplay/ui/login/login.dart';
import 'package:coinplay/ui/setup/setupdashboard.dart';
import 'package:flutter/material.dart';

import 'ui/dashboard/account/account.dart';

class Consts {
  static Color primary = Colors.indigo.shade600;

  static Map<String, Widget Function(BuildContext)> routeS = {
    '/': (context) => HomePage(),
    '/login': (context) => LoginPage(),
    '/setup': (context) => SetUpPage(),
    '/dashboard': (context) => DashboardPage(),
    '/account': (context) => Account(),
    '/faq': (context) => FAQ(),
    '/contact': (context) => Contact(),
  };
}
