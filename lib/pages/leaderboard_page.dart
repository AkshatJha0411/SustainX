import 'package:flutter/material.dart';

class LeaderboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Leaderboard'),
      ),
      body: Center(
        child: Text(
          'This is the Leaderboard page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
