import 'dart:developer';
import 'dart:io';

///
/// Check connection manually
/// function throws exception when there are no connection
///

Future<bool> hasNetwork() async {
  try {
    final result = await InternetAddress.lookup('example.com');
    return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
  } on SocketException catch (_) {
    log("");
    return false;
  }
}

// Future<bool> checkInternet() async {
//   try {
//     final result = await InternetAddress.lookup('example.com');
//     if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
//       log('connected');
//       return true;
//     }
//   } on SocketException catch (_) {
//     log('not connected');
//     return false;
//   }
//   return false;
//
//   // var connectivityResult = await (Connectivity().checkConnectivity());
//   // if (connectivityResult == ConnectivityResult.mobile) {
//   //   return true;
//   // } else if (connectivityResult == ConnectivityResult.wifi) {
//   //   return true;
//   // } else {
//   //   throw "No Connection.";
//   // }
// }
