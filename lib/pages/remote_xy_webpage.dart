import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class WebLinkPage extends StatelessWidget {
  Future<void> _openLink() async {
    const url = 'http://127.0.0.1:5500/spotifyclone/index.html';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Check your real time consumption value'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: _openLink,
          child: Text('Click here'),
        ),
      ),
    );
  }
}
