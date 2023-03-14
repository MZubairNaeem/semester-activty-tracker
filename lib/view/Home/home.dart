import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../resource/colors.dart';
import '../../widget/appBanner.dart';
import '../../widget/bannerItem.dart';
import '../../widget/indicator.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final controller = PageController(viewportFraction: 0.8, keepPage: true);
  var _selectedIndex = 0;

  signOut(){
    FirebaseAuth.instance.signOut();
  }
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors().primaryColor,
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: GestureDetector(
              onTap: (){
                signOut();
              },
              child: Icon(
                Icons.logout_outlined,
              ),
            ),
          ),
        ],
        backgroundColor: AppColors().secondaryColor,
        title: const Text('Semester Activity Tracker'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10.0),
            height: screenHeight * 0.5,
            decoration: BoxDecoration(color: AppColors().primaryColor),
            child: PageView.builder(
              controller: controller,
              onPageChanged: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              itemCount: appBannerList.length,
              itemBuilder: (context, index) {
                var banner = appBannerList[index];
                var _scale = _selectedIndex == index ? 1.0 : 0.8;
                return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => screens[index]));
                    },
                    child: TweenAnimationBuilder(
                      curve: Curves.ease,
                      tween: Tween(begin: _scale, end: _scale),
                      duration: const Duration(milliseconds: 350),
                      builder:
                          (BuildContext context, double value, Widget? child) {
                        return Transform.scale(
                          scale: value,
                          child: child,
                        );
                      },
                      child: BannerItem(appBanner: banner),
                    ));
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ...List.generate(
                  appBannerList.length,
                  (index) => Indicator(
                      isActive: _selectedIndex == index ? true : false))
            ],
          )
        ],
      ),
    );
  }
}
