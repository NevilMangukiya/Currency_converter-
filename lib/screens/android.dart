import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/bit.dart';

class CurrenciesConversion extends StatefulWidget {
  const CurrenciesConversion({Key? key}) : super(key: key);

  @override
  State<CurrenciesConversion> createState() => _CurrenciesConversionState();
}

class _CurrenciesConversionState extends State<CurrenciesConversion> {
  TextStyle subStyle = const TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );

  List<DropdownMenuItem<String>> get CurrencyDropdownItems {
    List<DropdownMenuItem<String>> CurrencyMenuItems = [
      CurrencyItems("AUD"),
      CurrencyItems("USD"),
      CurrencyItems("CAD"),
      CurrencyItems("EUR"),
      CurrencyItems("GBP"),
      CurrencyItems("HKD"),
      CurrencyItems("INR"),
      CurrencyItems("JPY"),
      CurrencyItems("NOK"),
      CurrencyItems("NZD"),
    ];
    return CurrencyMenuItems;
  }

  DropdownMenuItem<String> CurrencyItems(String items) {
    return DropdownMenuItem(value: items, child: Text(items, style: subStyle));
  }

  String BASE_URL = "https://free.currconv.com/api/v7/convert?";
  String ENDPOINT1 = "q=BTC_";
  String ENDPOINT2 = currency;
  String ENDPOINT3 = "&compact=ultra&apiKey=";
  String API_KEY = "a82b02e316fe3c0b9374";

  Future<BTCConvertor?> fetchbtcConvertor() async {
    Uri API = Uri.parse(BASE_URL + ENDPOINT1 + currency + ENDPOINT3 + API_KEY);

    http.Response response = await http.get(API);

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);

      BTCConvertor btc = BTCConvertor.fromJson(data);

      return btc;
    } else {
      return null;
    }
  }

  @override
  initState() {
    super.initState();
    Timer.periodic(const Duration(milliseconds: 100), (timer) {
      setState(() {});
    });
    fetchBTCConvertor = fetchbtcConvertor();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Crypto Converter"),
        centerTitle: true,
        actions: [
          Switch(
            value: isIOS,
            onChanged: (val) {
              setState(() {
                isIOS = val;
              });
            },
          ),
        ],
      ),
      body: FutureBuilder(
        future: fetchBTCConvertor,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('Error : ${snapshot.error}'),
            );
          } else if (snapshot.hasData) {
            BTCConvertor data = snapshot.data as BTCConvertor;

            return Center(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: MediaQuery.of(context).size.height * 0.07,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.black,
                          ),
                          child: Text(
                            "1 BTC = ${data.INR} $currency",
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Container(
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: MediaQuery.of(context).size.height * 0.07,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.black,
                          ),
                          child: Text(
                            "1 ETH = ${data.INR} $currency",
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        // const SizedBox(height: 20),
                        // Container(
                        //   alignment: Alignment.center,
                        //   width: MediaQuery.of(context).size.width * 0.9,
                        //   height: MediaQuery.of(context).size.height * 0.07,
                        //   decoration: BoxDecoration(
                        //     borderRadius: BorderRadius.circular(20),
                        //     color: Colors.black,
                        //   ),
                        //   child: Text(
                        //     "1 XRP = ${data.INR} $currency",
                        //     style: const TextStyle(
                        //       color: Colors.white,
                        //       fontWeight: FontWeight.w500,
                        //       fontSize: 20,
                        //     ),
                        //   ),
                        // ),
                        // const SizedBox(height: 20),
                        // Container(
                        //   alignment: Alignment.center,
                        //   width: MediaQuery.of(context).size.width * 0.9,
                        //   height: MediaQuery.of(context).size.height * 0.07,
                        //   decoration: BoxDecoration(
                        //     borderRadius: BorderRadius.circular(20),
                        //     color: Colors.black,
                        //   ),
                        //   child: Text(
                        //     "1 USDT = ${data.INR} $currency",
                        //     style: const TextStyle(
                        //       color: Colors.white,
                        //       fontWeight: FontWeight.w500,
                        //       fontSize: 20,
                        //     ),
                        //   ),
                        // ),
                        // const SizedBox(height: 20),
                        // Container(
                        //   alignment: Alignment.center,
                        //   width: MediaQuery.of(context).size.width * 0.9,
                        //   height: MediaQuery.of(context).size.height * 0.07,
                        //   decoration: BoxDecoration(
                        //     borderRadius: BorderRadius.circular(20),
                        //     color: Colors.black,
                        //   ),
                        //   child: Text(
                        //     "1 BCH = ${data.INR} $currency",
                        //     style: const TextStyle(
                        //       color: Colors.white,
                        //       fontWeight: FontWeight.w500,
                        //       fontSize: 20,
                        //     ),
                        //   ),
                        // ),
                        // const SizedBox(height: 20),
                      ],
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.07,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.black,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(right: 15, left: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Current Currency",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                              ),
                            ),
                            DropdownButton(
                              value: currency,
                              items: CurrencyDropdownItems,
                              onChanged: (String? newValue) {
                                currency = newValue!;
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            super.widget));
                                setState(() {});
                              },
                              dropdownColor: Colors.black,
                              underline: Container(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return Center(
                child: Stack(
              alignment: Alignment.center,
              children: const [
                SizedBox(
                  height: double.infinity,
                  width: double.infinity,
                ),
                CircularProgressIndicator(
                  color: Colors.black,
                ),
              ],
            ));
          }
        },
      ),
    );
  }
}

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// import '../helperss/converter_api.dart';
// import '../main.dart';
// import '../models/bit.dart';
//
// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);
//
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   late Future<CurrencyConvert?> future;
//   TextEditingController amtController = TextEditingController();
//
//   TextStyle fromToStyle = TextStyle(
//     color: Colors.black45,
//     fontSize: 20,
//     fontWeight: FontWeight.bold,
//   );
//
//   @override
//   void initState() {
//     super.initState();
//     future = CurrencyConvertAPI.weatherAPI
//         .currencyConvertorAPI(from: "USD", to: "INR", amt: 1);
//
//     amtController.text = "1";
//   }
//
//   String fromCurrency = "USD";
//   String toCurrency = "INR";
//
//   @override
//   Widget build(BuildContext context) {
//     return (isIOS == false)
//         ? Scaffold(
//             backgroundColor: Colors.white,
//             appBar: AppBar(
//               centerTitle: true,
//               title: const Text("Currency Convertor"),
//               actions: [
//                 Switch(
//                     onChanged: (val) {
//                       isIOS = val;
//                       Navigator.of(context).pushAndRemoveUntil(
//                           MaterialPageRoute(
//                             builder: (context) => const MyApp(),
//                           ),
//                           (route) => false);
//                     },
//                     value: isIOS),
//               ],
//             ),
//             body: FutureBuilder(
//               future: future,
//               builder: (context, AsyncSnapshot snapShot) {
//                 if (snapShot.hasError) {
//                   return Center(
//                     child: Text("${snapShot.error}"),
//                   );
//                 } else if (snapShot.hasData) {
//                   CurrencyConvert? data = snapShot.data;
//
//                   return Container(
//                     padding: const EdgeInsets.symmetric(horizontal: 20),
//                     child: ListView(
//                       physics: const BouncingScrollPhysics(),
//                       children: [
//                         SizedBox(
//                           height: 240,
//                           child: Image.asset(
//                             "assets/images/currency_convert_img.jpg",
//                           ),
//                         ),
//                         Row(
//                           children: [
//                             Text("Amount  :", style: fromToStyle),
//                             Expanded(
//                               child: Container(
//                                 padding:
//                                     const EdgeInsets.symmetric(horizontal: 10),
//                                 child: TextField(
//                                   keyboardType: TextInputType.number,
//                                   decoration: InputDecoration(
//                                     contentPadding:
//                                         const EdgeInsets.only(left: 20),
//                                     border: OutlineInputBorder(
//                                       borderRadius: BorderRadius.circular(50),
//                                     ),
//                                   ),
//                                   controller: amtController,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                         const SizedBox(height: 20),
//                         Divider(color: Colors.white),
//                         Row(
//                           children: [
//                             Expanded(
//                               child: Padding(
//                                 padding: const EdgeInsets.all(10),
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Text("From", style: fromToStyle),
//                                     DropdownButtonFormField(
//                                       value: fromCurrency,
//                                       onChanged: (val) {
//                                         setState(() {
//                                           // fromCurrency = val!;
//                                         });
//                                       },
//                                       items: Global.currency.map((e) {
//                                         return DropdownMenuItem(
//                                           value: e,
//                                           child: Text(e),
//                                         );
//                                       }).toList(),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                             Expanded(
//                               child: Padding(
//                                 padding: const EdgeInsets.all(10),
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Text("To", style: fromToStyle),
//                                     DropdownButtonFormField(
//                                       value: toCurrency,
//                                       onChanged: (val) {
//                                         setState(() {
//                                           // toCurrency = val!;
//                                         });
//                                       },
//                                       items: Global.currency.map((e) {
//                                         return DropdownMenuItem(
//                                           value: e,
//                                           child: Text(e),
//                                         );
//                                       }).toList(),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                         const SizedBox(height: 20),
//                         Container(
//                           height: 50,
//                           alignment: Alignment.center,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(100),
//                             color: Global.appColor.withOpacity(0.2),
//                           ),
//                           child: Text(
//                             "Result  :  ${data!.INR}",
//                             style: TextStyle(
//                               color: Global.appColor,
//                               fontSize: 22,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ),
//                         const SizedBox(height: 20),
//                         SizedBox(
//                           height: 50,
//                           child: ElevatedButton(
//                             style: ElevatedButton.styleFrom(
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(100),
//                               ),
//                             ),
//                             onPressed: () {
//                               if (amtController.text.isEmpty) {
//                                 ScaffoldMessenger.of(context).showSnackBar(
//                                   SnackBar(
//                                     backgroundColor: Global.appColor,
//                                     behavior: SnackBarBehavior.floating,
//                                     content: const Text("Please Enter Amount"),
//                                   ),
//                                 );
//                               } else {
//                                 int amt = int.parse(amtController.text);
//                                 setState(() {
//                                   future = CurrencyConvertAPI.weatherAPI
//                                       .currencyConvertorAPI(
//                                     from: fromCurrency,
//                                     to: toCurrency,
//                                     amt: amt,
//                                   );
//                                 });
//                               }
//                             },
//                             child: const Text(
//                               "CONVERT",
//                               style: TextStyle(fontSize: 18),
//                             ),
//                           ),
//                         ),
//                         const SizedBox(height: 20),
//                       ],
//                     ),
//                   );
//                 }
//                 return const Center(
//                   child: CircularProgressIndicator(),
//                 );
//               },
//             ),
//           )
//         : CupertinoPageScaffold(
//             navigationBar: CupertinoNavigationBar(
//               trailing: CupertinoSwitch(
//                   activeColor: CupertinoColors.activeBlue.withOpacity(0.5),
//                   onChanged: (val) {
//                     Global.isAndroid = val;
//                     Navigator.of(context).pushAndRemoveUntil(
//                         MaterialPageRoute(
//                           builder: (context) => const MyApp(),
//                         ),
//                         (route) => false);
//                   },
//                   value: Global.isAndroid),
//               backgroundColor: Global.appColor,
//               middle: const Text(
//                 "Currency Convertor",
//                 style: TextStyle(color: CupertinoColors.white),
//               ),
//             ),
//             backgroundColor: CupertinoColors.white,
//             child: FutureBuilder(
//               future: future,
//               builder: (context, AsyncSnapshot snapShot) {
//                 if (snapShot.hasError) {
//                   return Center(
//                     child: Text("${snapShot.error}"),
//                   );
//                 } else if (snapShot.hasData) {
//                   CurrencyConvert? data = snapShot.data;
//
//                   return Container(
//                     padding: const EdgeInsets.all(20),
//                     child: SingleChildScrollView(
//                       physics: const BouncingScrollPhysics(),
//                       child: Column(
//                         children: [
//                           SizedBox(
//                             height: 240,
//                             child: Image.asset(
//                               "assets/images/currency_convert_img.jpg",
//                             ),
//                           ),
//                           Row(
//                             children: [
//                               Text("Amount  :", style: fromToStyle),
//                               Expanded(
//                                 child: Container(
//                                   padding: const EdgeInsets.symmetric(
//                                       horizontal: 10),
//                                   child: CupertinoTextField(
//                                     keyboardType: TextInputType.number,
//                                     decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(50),
//                                       border:
//                                           Border.all(color: Global.appColor),
//                                     ),
//                                     controller: amtController,
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                           const SizedBox(height: 20),
//                           Divider(
//                             color: Global.appColor,
//                           ),
//                           Row(
//                             children: [
//                               Expanded(
//                                 child: Padding(
//                                   padding: const EdgeInsets.all(10),
//                                   child: Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       Text("From", style: fromToStyle),
//                                       GestureDetector(
//                                         onTap: () {
//                                           showCupertinoModalPopup(
//                                               context: context,
//                                               builder: (_) => SizedBox(
//                                                     width:
//                                                         MediaQuery.of(context)
//                                                                 .size
//                                                                 .width *
//                                                             0.60,
//                                                     height: 250,
//                                                     child: CupertinoPicker(
//                                                       backgroundColor:
//                                                           Colors.white,
//                                                       itemExtent: 30,
//                                                       children: Global.currency
//                                                           .map((e) {
//                                                         return Text(e);
//                                                       }).toList(),
//                                                       onSelectedItemChanged:
//                                                           (value) {
//                                                         setState(() {
//                                                           fromCurrency = Global
//                                                               .currency[value];
//                                                         });
//                                                       },
//                                                     ),
//                                                   ));
//                                         },
//                                         child: Container(
//                                           color:
//                                               Global.appColor.withOpacity(0.1),
//                                           height: 45,
//                                           child: Row(
//                                             children: [
//                                               const SizedBox(width: 10),
//                                               Text(
//                                                 fromCurrency,
//                                               ),
//                                               const Spacer(),
//                                               const Icon(CupertinoIcons
//                                                   .arrow_2_squarepath),
//                                               const SizedBox(width: 10),
//                                             ],
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                               Expanded(
//                                 child: Padding(
//                                   padding: const EdgeInsets.all(10),
//                                   child: Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       Text("To", style: fromToStyle),
//                                       GestureDetector(
//                                         onTap: () {
//                                           showCupertinoModalPopup(
//                                             context: context,
//                                             builder: (_) => SizedBox(
//                                               width: MediaQuery.of(context)
//                                                       .size
//                                                       .width *
//                                                   0.60,
//                                               height: 250,
//                                               child: CupertinoPicker(
//                                                 backgroundColor: Colors.white,
//                                                 itemExtent: 30,
//                                                 children:
//                                                     Global.currency.map((e) {
//                                                   return Text(e);
//                                                 }).toList(),
//                                                 onSelectedItemChanged: (value) {
//                                                   setState(() {
//                                                     toCurrency =
//                                                         Global.currency[value];
//                                                   });
//                                                 },
//                                               ),
//                                             ),
//                                           );
//                                         },
//                                         child: Container(
//                                           color:
//                                               Global.appColor.withOpacity(0.1),
//                                           height: 45,
//                                           child: Row(
//                                             children: [
//                                               const SizedBox(width: 10),
//                                               Text(
//                                                 toCurrency,
//                                               ),
//                                               const Spacer(),
//                                               const Icon(CupertinoIcons
//                                                   .arrow_2_squarepath),
//                                               const SizedBox(width: 10),
//                                             ],
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                           const SizedBox(height: 20),
//                           Container(
//                             height: 50,
//                             alignment: Alignment.center,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(100),
//                               color: Global.appColor.withOpacity(0.2),
//                             ),
//                             child: Text(
//                               "Result  :  ${data!.INR}",
//                               style: TextStyle(
//                                 color: Global.appColor,
//                                 fontSize: 22,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ),
//                           const SizedBox(height: 20),
//                           SizedBox(
//                             height: 50,
//                             width: double.infinity,
//                             child: CupertinoButton.filled(
//                               borderRadius: BorderRadius.circular(50),
//                               onPressed: () {
//                                 if (amtController.text.isEmpty) {
//                                 } else {
//                                   int amt = int.parse(amtController.text);
//                                   setState(() {
//                                     future = CurrencyConvertAPI.weatherAPI
//                                         .currencyConvertorAPI(
//                                       from: fromCurrency,
//                                       to: toCurrency,
//                                       amt: amt,
//                                     );
//                                   });
//                                 }
//                               },
//                               child: const Text(
//                                 "CONVERT",
//                                 style: TextStyle(fontSize: 18),
//                               ),
//                             ),
//                           ),
//                           const SizedBox(height: 20),
//                         ],
//                       ),
//                     ),
//                   );
//                 }
//                 return const Center(
//                   child: CircularProgressIndicator(),
//                 );
//               },
//             ),
//           );
//   }
// }
