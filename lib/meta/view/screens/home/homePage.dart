import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:machine_round/app/constants.dart';
import 'package:machine_round/core/viewModel/homepage/homePage_viewModel.dart';
import 'package:stacked/stacked.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomePageViewModel>.reactive(
        builder: (context, model, child) {
          return Container(
            color: kBackgroundColor,
            child: SafeArea(
              child: Scaffold(
                  backgroundColor: kBackgroundColor,
                  extendBody: true,
                  body: ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    padding: EdgeInsets.symmetric(
                        horizontal: kHPadding, vertical: kVPadding),
                    physics: BouncingScrollPhysics(),
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 25,
                            backgroundColor: Color(0xffD9D9D9),
                            child: Icon(
                              Icons.person,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            width: kHPadding / 2,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Suresh Kumar',
                                  style: kDefaultTextStyle.copyWith(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 20),
                                ),
                                SizedBox(
                                  height: kVPadding / 2,
                                ),
                                Container(
                                  child: Text('Keep'),
                                  padding: EdgeInsets.all(2),
                                  decoration: BoxDecoration(
                                      color: kBackgroundColor,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey,
                                          offset: Offset(2, 2),
                                        )
                                      ]),
                                )
                              ],
                            ),
                          ),
                          Icon(
                            Icons.person_add_alt_1_outlined,
                          ),
                          SizedBox(
                            width: kHPadding / 2,
                          ),
                          Icon(
                            Icons.settings_rounded,
                          )
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                            vertical: kVPadding * 2, horizontal: kHPadding),
                        child: TextFormField(
                            decoration: InputDecoration(
                          filled: true,
                          contentPadding: EdgeInsets.zero,
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.grey,
                          ),
                          hintText: 'Search',
                          hintStyle: kDefaultTextStyle.copyWith(
                              fontWeight: FontWeight.w400),
                          suffixIcon: Icon(
                            Icons.qr_code_sharp,
                            color: kPrimaryColor,
                          ),
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none),
                        )),
                      ),
                      ExpansionPanelList(
                        elevation: 0,
                        dividerColor: Colors.transparent,
                        expandedHeaderPadding: EdgeInsets.zero,
                        animationDuration: Duration(milliseconds: 500),
                        expansionCallback: (int index, bool isExpanded) {
                          model.expansionExpandingDecider();
                        },
                        children: [
                          ExpansionPanel(
                            headerBuilder:
                                (BuildContext context, bool isExpanded) {
                              return ListTile(
                                leading: Icon(Icons.group),
                                title: Text(
                                  'Group',
                                  style: kDefaultTextStyle.copyWith(
                                      fontWeight: FontWeight.w500),
                                ),
                              );
                            },
                            body: Text('Group'),
                            isExpanded: model.expansionExpanded,
                          ),
                          ExpansionPanel(
                            headerBuilder:
                                (BuildContext context, bool isExpanded) {
                              return ListTile(
                                leading: Icon(Icons.person),
                                title: Text(
                                  'Friend',
                                  style: kDefaultTextStyle.copyWith(
                                      fontWeight: FontWeight.w500),
                                ),
                              );
                            },
                            body: Text('Friends'),
                            isExpanded: model.expansionExpanded,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: kVPadding * 2,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Service',
                            style: kDefaultTextStyle.copyWith(
                                fontWeight: FontWeight.w500, fontSize: 18),
                          ),
                          Text(
                            'See all',
                            style: kDefaultTextStyle.copyWith(
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                      SizedBox(
                        height: kVPadding,
                      ),
                      GridView.count(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        // Create a grid with 2 columns. If you change the scrollDirection to
                        // horizontal, this produces 2 rows.
                        crossAxisCount: 4,
                        // Generate 100 widgets that display their index in the List.
                        children: List.generate(services.length, (index) {
                          return ServiceBuilder(
                            icon: services[index].icon,
                            title: services[index].title,
                          );
                        }),
                      ),
                      SizedBox(
                        height: kVPadding * 2,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Recommended stickers for you',
                            style: kDefaultTextStyle.copyWith(
                                fontWeight: FontWeight.w500, fontSize: 18),
                          ),
                          Text(
                            'See all',
                            style: kDefaultTextStyle.copyWith(
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                      SizedBox(
                        height: kVPadding,
                      ),
                      GridView.count(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        // Create a grid with 2 columns. If you change the scrollDirection to
                        // horizontal, this produces 2 rows.
                        crossAxisCount: 3,
                        // Generate 100 widgets t hat display their index in the List.
                        children: List.generate(stickers.length, (index) {
                          return StickersBuilder(
                            title: stickers[index].title,
                            image: stickers[index].image,
                          );
                        }),
                      ),
                    ],
                  )),
            ),
          );
        },
        viewModelBuilder: () => HomePageViewModel());
  }
}

class ServiceBuilder extends StatelessWidget {
  ServiceBuilder({Key? key, this.title, this.icon}) : super(key: key);
  final IconData? icon;
  final String? title;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: kHPadding / 2, vertical: kVPadding / 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(icon!),
          SizedBox(
            height: kVPadding,
          ),
          Text(
            title!,
            textAlign: TextAlign.center,
            style: kDefaultTextStyle.copyWith(
                fontWeight: FontWeight.w400, fontSize: 14),
          )
        ],
      ),
    );
  }
}

List<ServiceBuilder> services = [
  ServiceBuilder(
    title: 'Stickers',
    icon: Icons.emoji_emotions,
  ),
  ServiceBuilder(
    title: 'Person',
    icon: Icons.person,
  ),
  ServiceBuilder(
    title: 'Official Accounts',
    icon: Icons.star,
  ),
  ServiceBuilder(
    title: 'Points',
    icon: Icons.point_of_sale,
  ),
  ServiceBuilder(
    title: 'Live Game',
    icon: Icons.live_tv_outlined,
  ),
  ServiceBuilder(
    title: 'Live game',
    icon: Icons.games_outlined,
  ),
  ServiceBuilder(
    title: 'YouCam',
    icon: Icons.camera,
  ),
  ServiceBuilder(
    title: 'Add',
    icon: Icons.add,
  )
];

class StickersBuilder extends StatelessWidget {
  const StickersBuilder({this.title, this.image});
  final String? image;
  final String? title;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: kHPadding / 2, vertical: kVPadding / 2),
      child: Column(
        children: [
          Image(
            image: AssetImage(image!),
            height: 50,
            fit: BoxFit.fitHeight,
          ),
          SizedBox(
            height: kVPadding,
          ),
          Text(
            title!,
            textAlign: TextAlign.center,
            style: kDefaultTextStyle.copyWith(fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}

List<StickersBuilder> stickers = [
  StickersBuilder(title: 'Mickey Friends', image: 'assets/images/mickey.png'),
  StickersBuilder(title: 'Angry Sticker', image: 'assets/images/angry.png'),
  StickersBuilder(
    title: 'Responsive Sticker',
    image: 'assets/images/responsive.png',
  )
];
