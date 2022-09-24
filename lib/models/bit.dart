import 'dart:io';

import 'package:flutter/material.dart';

// class CurrencyConvert {
//   final double INR;
//   final double Rate;
//
//   CurrencyConvert({
//     required this.INR,
//     required this.Rate,
//   });
//
//   factory CurrencyConvert.fromJSON({required Map<String, dynamic> json}) {
//     return CurrencyConvert(
//       INR: json["result"],
//       Rate: json["info"]["rate"],
//     );
//   }
// }

// class Global {
//   static var appColor = const Color(0xff233F81);
//
//   static bool isAndroid = Platform.isAndroid ? false : true;
//
//   static List<String> currency = [
//     "AED",
//     "AFN",
//     "ALL",
//     "AMD",
//     "ANG",
//     "AOA",
//     "ARS",
//     "AUD",
//     "AWG",
//     "AZN",
//     "BAM",
//     "BBD",
//     "BDT",
//     "BGN",
//     "BHD",
//     "BIF",
//     "BMD",
//     "BND",
//     "BOB",
//     "BRL",
//     "BSD",
//     "BTC",
//     "BTN",
//     "BWP",
//     "BYN",
//     "BZD",
//     "CAD",
//     "CDF",
//     "CHF",
//     "CLF",
//     "CLP",
//     "CNH",
//     "CNY",
//     "COP",
//     "CRC",
//     "CUC",
//     "CUP",
//     "CVE",
//     "CZK",
//     "DJF",
//     "DKK",
//     "DOP",
//     "DZD",
//     "EGP",
//     "ERN",
//     "ETB",
//     "EUR",
//     "FJD",
//     "FKP",
//     "GBP",
//     "GEL",
//     "GGP",
//     "GHS",
//     "GIP",
//     "GMD",
//     "GNF",
//     "GTQ",
//     "GYD",
//     "HKD",
//     "HNL",
//     "HRK",
//     "HTG",
//     "HUF",
//     "IDR",
//     "ILS",
//     "IMP",
//     "INR",
//     "IQD",
//     "IRR",
//     "ISK",
//     "JEP",
//     "JMD",
//     "JOD",
//     "JPY",
//     "KES",
//     "KGS",
//     "KHR",
//     "KMF",
//     "KPW",
//     "KRW",
//     "KWD",
//     "KYD",
//     "KZT",
//     "LAK",
//     "LBP",
//     "LKR",
//     "LRD",
//     "LSL",
//     "LYD",
//     "MAD",
//     "MDL",
//     "MGA",
//     "MKD",
//     "MMK",
//     "MNT",
//     "MOP",
//     "MRU",
//     "MUR",
//     "MVR",
//     "MWK",
//     "MXN",
//     "MYR",
//     "MZN",
//     "NAD",
//     "NGN",
//     "NIO",
//     "NOK",
//     "NPR",
//     "NZD",
//     "OMR",
//     "PAB",
//     "PEN",
//     "PGK",
//     "PHP",
//     "PKR",
//     "PLN",
//     "PYG",
//     "QAR",
//     "RON",
//     "RSD",
//     "RUB",
//     "RWF",
//     "SAR",
//     "SBD",
//     "SCR",
//     "SDG",
//     "SEK",
//     "SGD",
//     "SHP",
//     "SLL",
//     "SOS",
//     "SRD",
//     "SSP",
//     "STD",
//     "STN",
//     "SVC",
//     "SYP",
//     "SZL",
//     "THB",
//     "TJS",
//     "TMT",
//     "TND",
//     "TOP",
//     "TRY",
//     "TTD",
//     "TWD",
//     "TZS",
//     "UAH",
//     "UGX",
//     "USD",
//     "UYU",
//     "UZS",
//     "VES",
//     "VND",
//     "VUV",
//     "WST",
//     "XAF",
//     "XAG",
//     "XAU",
//     "XCD",
//     "XDR",
//     "XOF",
//     "XPD",
//     "XPF",
//     "XPT",
//     "YER",
//     "ZAR",
//     "ZMW",
//     "ZWL",
//   ];
// }
class BTCConvertor {
  final double INR;

  BTCConvertor({
    required this.INR,
  });

  factory BTCConvertor.fromJson(Map<String, dynamic> json) {
    return BTCConvertor(INR: json["BTC_$currency"]);
  }
}

String currency = "INR";

bool isIOS = false;

late Future<BTCConvertor?> fetchBTCConvertor;

int index = 0;
