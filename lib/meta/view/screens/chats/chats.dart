import 'package:flutter/material.dart';
import 'package:machine_round/app/constants.dart';

class ChatsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: kBackgroundColor,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: kBackgroundColor,
          body: Center(
            child: Container(
              child: Text(
                'Chats',
                style: kDefaultTextStyle.copyWith(fontSize: 28),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
