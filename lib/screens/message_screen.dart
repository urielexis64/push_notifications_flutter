import 'package:flutter/material.dart';

class MessageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final message = ModalRoute.of(context)?.settings.arguments ?? 'No data';

    return Scaffold(
      appBar: AppBar(
        title: Text('Message'),
      ),
      body: Center(
        child: Text('$message'),
      ),
    );
  }
}
