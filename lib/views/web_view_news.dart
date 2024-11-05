import 'dart:async';
import 'package:campus_carbon/controllers/news_controller.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewNews extends StatefulWidget {
  final String newsUrl;
  const WebViewNews({super.key, required this.newsUrl});

  @override
  State<WebViewNews> createState() => _WebViewNewsState();
}

class _WebViewNewsState extends State<WebViewNews> {
  NewsController newsController = NewsController();

  final Completer<WebViewController> controller =
      Completer<WebViewController>();
  bool _isLoading = true;

  @override
  void didChangeDependencies() {
    // Move any initialization that requires `context` here
    super.didChangeDependencies();
    // This ensures we don’t set `_isLoading` after `build()` starts
    setState(() {
      _isLoading = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Stack(
        children: [
          WebView(
            initialUrl: widget.newsUrl,
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController webViewController) {
              // Avoid calling setState in this callback
              controller.complete(webViewController);
            },
            onPageStarted: (String url) {
              setState(() {
                _isLoading = true;
              });
            },
            onPageFinished: (String url) {
              setState(() {
                _isLoading = false;
              });
            },
          ),
          if (_isLoading)
            Center(
              child: Lottie.asset(
                'lib/assets/greyloading.json',
                width: 200,
                height: 200,
              ),
            ),
        ],
      ),
    );
  }
}
