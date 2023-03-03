import 'package:flutter/material.dart';
import 'package:semester_tracker/resource/colors.dart';
import 'appBanner.dart';

class BannerItem extends StatelessWidget {
  final AppBanner appBanner;
  const BannerItem({
    super.key, required this.appBanner,
  });

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        // image: DecorationImage(
        //     image: AssetImage(appBanner.thumbNailUrl),
        //     fit: BoxFit.cover),
      ),
      child: DefaultTextStyle(
          style:
          const TextStyle(color: Colors.white, fontSize: 20.0),
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: const Color.fromRGBO(0, 0, 0, 0.3),
                    borderRadius: BorderRadius.circular(20.0)),
              ),
              Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      child: Image.asset(appBanner.thumbNailUrl,fit:BoxFit.cover,),
                    ),
                    SizedBox(
                      width: 200
                      ,
                      child: Text(
                        appBanner.title,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 32,fontWeight: FontWeight.bold,color: AppColors().lightColor),
                      ),
                    ),

                  ],
                ),
              )
            ],
          )),
    );
  }
}