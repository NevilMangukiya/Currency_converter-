import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'screens/android.dart';
import 'screens/cupertino.dart';
import 'models/bit.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  initState() {
    super.initState();

    Timer.periodic(const Duration(milliseconds: 100), (timer) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return (isIOS == true)
        ? const CupertinoApp(
            debugShowCheckedModeBanner: false,
            home: CupertinoBTCScreen(),
            theme: CupertinoThemeData(
              brightness: Brightness.light,
            ),
          )
        : MaterialApp(
            debugShowCheckedModeBanner: false,
            routes: {
              '/': (context) => const CurrenciesConversion(),
            },
          );
  }
}

// import 'package:adv_crypto_currenct/screens/android.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// import 'models/bit.dart';
//
// void main() {
//   runApp(
//     const MyApp(),
//   );
// }
//
// class MyApp extends StatefulWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   State<MyApp> createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//     return (Global.isAndroid == false)
//         ? MaterialApp(
//             debugShowCheckedModeBanner: false,
//             // theme: ThemeData(
//             //   primarySwatch: buildMaterialColor(Global.appColor),
//             // ),
//             home: const HomePage(),
//           )
//         : CupertinoApp(
//             // theme: CupertinoThemeData(
//             //   primaryColor: buildMaterialColor(Global.appColor),
//             // ),
//             debugShowCheckedModeBanner: false,
//             home: const HomePage(),
//           );
//   }
// }
