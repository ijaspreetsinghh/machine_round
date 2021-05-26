import 'package:flutter/material.dart';
import 'package:machine_round/app/constants.dart';

class TimelinePage extends StatelessWidget {
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
                'Timeline',
                style: kDefaultTextStyle.copyWith(fontSize: 28),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
