import 'package:coinplay/model/user.dart';
import 'package:coinplay/service/api.dart';
import 'package:coinplay/ui/dashboard/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

bool loginYes = false;

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      title: "Crypto Analytics",
      onLogin: (data) {
        try {
          Provider.of<ApiService>(context, listen: false)
              .logIn(data.name, data.password);
          setState(() {
            loginYes = false;
          });
        } catch (e) {
          Fluttertoast.showToast(
              msg: "Wrong Password",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);
        }
      },
      // additionalSignupFields: [
      //   UserFormField(
      //       keyName: "username",
      //       displayName: "Username",
      //       icon: Icon(Icons.travel_explore),
      //       fieldValidator: (data) {}),
      //   UserFormField(
      //       keyName: "refId",
      //       displayName: "Reference ID",
      //       icon: Icon(FontAwesomeIcons.link),
      //       fieldValidator: (data) {}),
      //   UserFormField(
      //       keyName: "mobile",
      //       displayName: "Mobile Number",
      //       icon: Icon(Icons.phone),
      //       userType: LoginUserType.phone,
      //       fieldValidator: (data) {}),
      //   UserFormField(
      //       keyName: "dob",
      //       displayName: "DoB",
      //       icon: Icon(Icons.date_range),
      //       userType: LoginUserType.name,
      //       defaultValue: '30/01/2001',
      //       fieldValidator: (data) {}),
      //   UserFormField(
      //       keyName: "city",
      //       displayName: "City",
      //       icon: Icon(Icons.date_range),
      //       userType: LoginUserType.name,
      //       defaultValue: 'Erode',
      //       fieldValidator: (data) {}),
      //   UserFormField(
      //       keyName: "telegramId",
      //       displayName: "Telegram ID",
      //       icon: Icon(FontAwesomeIcons.telegram),
      //       defaultValue: '@CryptoAnalytics',
      //       fieldValidator: (data) {}),
      // ],
      onSignup: (data) {
        //Provider.of<ApiService>(context, listen: false)
        ApiService.signUp(data.name ?? "", data.password ?? "");
      },
      onSubmitAnimationCompleted: () {
        loginYes
            ? Navigator.pushReplacementNamed(context, '/setup')
            : Navigator.pushReplacementNamed(context, '/');
      },
      hideForgotPasswordButton: true,
      loginAfterSignUp: true,
      initialAuthMode: AuthMode.signup,
      // onSwitchToAdditionalFields: (data) {
      //   // Provider.of<ApiService>(context, listen: true)
      //   ApiService.setUser(
      //     CoinPlayUser()
      //       ..username = data.additionalSignupData!['username'] ?? ""
      //       ..refId = data.additionalSignupData!['refId'] ?? ""
      //       ..mobile = data.additionalSignupData!['mobile'] ?? ""
      //       ..dob = data.additionalSignupData!['dob'] ?? ""
      //       ..telegramId = data.additionalSignupData!['telegramId'] ?? "",
      //   );
      // },
      onRecoverPassword: (data) {},
    );
  }
}
