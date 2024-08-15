import 'package:flutter/material.dart';
import 'package:move_to_background/move_to_background.dart';
import 'package:store_demo_app/utils/check_Internet.dart';
import 'package:store_demo_app/widgets/toast.dart';


class NoInternetScreen extends StatefulWidget {
  const NoInternetScreen({Key? key}) : super(key: key);

  @override
  State<NoInternetScreen> createState() => _NoInternetScreenState();
}

class _NoInternetScreenState extends State<NoInternetScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        ///
        /// this function is use when user try to go back from home screen
        /// this function will move the app in background
        ///
        MoveToBackground.moveTaskToBack();
        return false;
      },
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 2, 13, 77),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[
                    Color(0xffcc2b5e),
                    Color(0xff753a88),
                  ]),
            ),
          ),
          centerTitle: true,
          title: const Text("No Internet Connection"),
        ),
        body: Stack(
          alignment: Alignment.center,
          children: [
            InkWell(
              onTap: () async {
                bool isInternet = await hasNetwork();
                if (isInternet) {
                  Navigator.pop(context);
                }else{
                  showToast("No Internet Connection");
                }
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: <Color>[
                        Color(0xffcc2b5e),
                        Color(0xff753a88),
                      ]),
                  borderRadius: BorderRadius.all(Radius.circular(19)),
                ),
                child: const Text(
                  "Check Network",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
