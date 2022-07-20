import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewURL extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return WebViewURlState();
  }
}

class WebViewURlState extends State<WebViewURL> {
  late bool isLoaded;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isLoaded = false;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: const Text("Webview with URL"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Stack(
        children: <Widget>[
          WebView(
            initialUrl:
                'https://stackoverflow.com/questions/45940861/android-8-cleartext-http-traffic-not-permitted',
            onPageFinished: (value) {
              setState(() {
                isLoaded = true;
              });
            },
          ),
          (isLoaded)
              ? Container()
              : const Center(
                  child: CircularProgressIndicator(),
                )
        ],
      ),
    );
  }
}
