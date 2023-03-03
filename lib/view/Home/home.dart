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

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    // final pages = List.generate(
    //   4,
    //   (index) => Container(
    //     decoration: BoxDecoration(
    //       borderRadius: BorderRadius.circular(16),
    //       color: AppColors().secondaryColor,
    //     ),
    //     margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
    //     child: Center(
    //       child: Text(
    //         "Page $index",
    //         style: TextStyle(color: AppColors().greyText),
    //       ),
    //     ),
    //   ),
    // );
    // return Scaffold(
    //   backgroundColor: AppColors().primaryColor,
    //   appBar: AppBar(
    //     title: Text(
    //       'Home',
    //       style: TextStyle(
    //           color: AppColors().lightText, fontWeight: FontWeight.bold),
    //     ),
    //     centerTitle: true,
    //     backgroundColor: AppColors().primaryColor,
    //   ),
    //   body: SingleChildScrollView(
    //     scrollDirection: Axis.horizontal,
    //     child: Center(
    //       child: Row(
    //         children: [
    //           Padding(
    //             padding: const EdgeInsets.only(right: 10.0,left: 50),
    //             child: Container(
    //               height: screenHeight * 0.50,
    //               width: screenWidth * 0.50,
    //               decoration: BoxDecoration(
    //                 color: Colors.white,
    //                 borderRadius: BorderRadius.all(
    //                   Radius.circular(15),
    //                 ),
    //               ),
    //             ),
    //           ),
    //           Padding(
    //             padding: const EdgeInsets.symmetric(horizontal: 10.0),
    //             child: Container(
    //               height: screenHeight * 0.50,
    //               width: screenWidth * 0.50,
    //               decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.all(
    //                 Radius.circular(15),
    //               ),),
    //             ),
    //           ),
    //           Padding(
    //             padding: const EdgeInsets.symmetric(horizontal: 10.0),
    //             child: Container(
    //               height: screenHeight * 0.50,
    //               width: screenWidth * 0.50,
    //               decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.all(
    //                 Radius.circular(15),
    //               ),),
    //             ),
    //           ),
    //           Padding(
    //             padding: const EdgeInsets.only(right: 50.0,left: 10),
    //             child: Container(
    //               height: screenHeight * 0.50,
    //               width: screenWidth * 0.50,
    //               decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.all(
    //                 Radius.circular(15),
    //               ),),
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text(
    //       'Home',
    //       style: TextStyle(
    //           color: AppColors().lightText, fontWeight: FontWeight.bold),
    //     ),
    //     centerTitle: true,
    //     backgroundColor: AppColors().primaryColor,
    //   ),
    //   backgroundColor: AppColors().primaryColor,
    //   body: SafeArea(
    //     child: SingleChildScrollView(
    //       child: Column(
    //         crossAxisAlignment: CrossAxisAlignment.center,
    //         children: <Widget>[
    //           SizedBox(height: screenHeight * 0.1),
    //           GestureDetector(
    //             onTap: (){
    //               Attendance();
    //             },
    //             child: SizedBox(
    //               height: screenHeight * 0.5,
    //               child: PageView.builder(
    //                 controller: controller,
    //                 itemBuilder: (_, index) {
    //                   return pages[index % pages.length];
    //                 },
    //               ),
    //             ),
    //           ),
    //           const Padding(
    //             padding: EdgeInsets.only(top: 24, bottom: 12),
    //             child: Text(
    //               'Worm',
    //               style: TextStyle(color: Colors.black54),
    //             ),
    //           ),
    //           SmoothPageIndicator(
    //             controller: controller,
    //             count: pages.length,
    //             effect: ExpandingDotsEffect(
    //               activeDotColor: AppColors().lightColor,
    //               dotHeight: 16,
    //               dotWidth: 16,
    //               //type: WormType.thin,
    //               // strokeWidth: 5,
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
    return Scaffold(
      backgroundColor: AppColors().primaryColor,
      appBar: AppBar(
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
            decoration:  BoxDecoration(color: AppColors().primaryColor),
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
                var _scale = _selectedIndex == index ? 1.0 :0.8;
                return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => screens[index]));
                    },
                    child: TweenAnimationBuilder(
                      curve: Curves.ease,
                      tween: Tween(begin: _scale,end: _scale),
                      duration: const Duration(milliseconds: 350),
                      builder: (BuildContext context, double value, Widget? child) {
                        return Transform.scale(
                          scale: value,
                          child: child,
                        );
                      },
                      child: BannerItem(
                          appBanner: banner
                      ),
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
