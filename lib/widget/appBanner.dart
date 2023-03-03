import 'package:flutter/material.dart';
import 'package:semester_tracker/view/Home/home_screen_nav/attendance.dart';
import 'package:semester_tracker/view/Home/home_screen_nav/course.dart';
import 'package:semester_tracker/view/Home/home_screen_nav/report.dart';
import 'package:semester_tracker/view/Home/home_screen_nav/semester.dart';

class AppBanner{
  final int id;
  final String title;
  final String thumbNailUrl;

  AppBanner(this.id, this.title, this.thumbNailUrl);
}

//sample data
List<AppBanner> appBannerList =[
  AppBanner(1, 'Title', 'https://picsum.photos/seed/picsum/200/300'),
  AppBanner(2, 'Title', 'https://picsum.photos/seed/picsum/200/300'),
  AppBanner(3, 'Title', 'https://picsum.photos/seed/picsum/200/300'),
  AppBanner(4, 'Title', 'https://picsum.photos/seed/picsum/200/300'),

];

List<Widget> screens = [
  const Semester(),
  const Attendance(),
  const Course(),
  const Report(),
];