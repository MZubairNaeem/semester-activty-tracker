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
  AppBanner(1,"Your Semesters", 'assets/semester.png'),
  AppBanner(2, 'Courses', 'assets/course.png'),
  AppBanner(3, 'Attendance', 'assets/attendance.png'),
  AppBanner(4, 'Overall Report', 'assets/report.png'),

];

List<Widget> screens = [
  const Semester(),
  const Course(),
  const Attendance(),
  const Report(),
];