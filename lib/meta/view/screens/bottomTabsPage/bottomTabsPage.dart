import 'package:flutter/material.dart';
import 'package:machine_round/app/constants.dart';
import 'package:machine_round/core/viewModel/bottomTabsPage/bottomTabsPage_viewModel.dart';
import 'package:stacked/stacked.dart';

class BottomTabsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<BottomTabsPageViewModel>.reactive(
        builder: (context, model, child) {
          return Container(
            color: kBackgroundColor,
            child: SafeArea(
              child: Scaffold(
                extendBody: true,
                backgroundColor: kBackgroundColor,
                body: model.bottomTabPages[model.currentTab],
                bottomNavigationBar: BottomNavigationBar(
                  selectedItemColor: kPrimaryColor,
                  unselectedItemColor: kPrimaryColor,
                  selectedFontSize: 14.0,
                  unselectedFontSize: 14.0,
                  currentIndex: model.currentTab,
                  type: BottomNavigationBarType.fixed,
                  items: [
                    BottomNavigationBarItem(
                        icon: Icon(
                          Icons.home,
                          color: kPrimaryColor,
                        ),
                        label: 'Home'),
                    BottomNavigationBarItem(
                        icon: Icon(
                          Icons.chat,
                          color: kPrimaryColor,
                        ),
                        label: 'Chats'),
                    BottomNavigationBarItem(
                        icon: Icon(
                          Icons.access_time_outlined,
                          color: kPrimaryColor,
                        ),
                        label: 'Timeline'),
                    BottomNavigationBarItem(
                        icon: Icon(
                          Icons.call,
                          color: kPrimaryColor,
                        ),
                        label: 'Calls'),
                  ],
                  showSelectedLabels: true,
                  showUnselectedLabels: true,
                  onTap: (tabIndex) => model.switchTab(tabIndex),
                ),
              ),
            ),
          );
        },
        viewModelBuilder: () => BottomTabsPageViewModel());
  }
}
