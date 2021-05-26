import 'package:flutter/cupertino.dart';
import 'package:machine_round/meta/view/screens/calls/calls.dart';
import 'package:machine_round/meta/view/screens/chats/chats.dart';
import 'package:machine_round/meta/view/screens/home/homePage.dart';
import 'package:machine_round/meta/view/screens/timeline/timeline.dart';
import 'package:stacked/stacked.dart';

class BottomTabsPageViewModel extends BaseViewModel {
  int _currentTab = 0;
  get currentTab => _currentTab;

  switchTab(tabIndex) {
    _currentTab = tabIndex;
    notifyListeners();
  }

  List<Widget> bottomTabPages = [
    HomePage(),
    ChatsPage(),
    TimelinePage(),
    CallsPage()
  ];
}
