import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:u_learning/pages/home/bloc/home_page_blocs.dart';
import 'package:u_learning/pages/home/bloc/home_page_events.dart';
import 'package:u_learning/pages/home/bloc/home_page_state.dart';

import '../../../common/values/colors.dart';

AppBar buildAppBar() {
  return AppBar(
    title: Container(
      margin: EdgeInsets.only(left: 7.w, right: 7.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 15.w,
            height: 12.h,
            child: Image.asset("assets/icons/menu.png"),
          ),
          GestureDetector(
            child: Container(
              width: 40.w,
              height: 40.h,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/icons/person.png"))),
            ),
          )
        ],
      ),
    ),
  );
}

Widget homePageText(String text,
    {Color color = AppColors.primaryText, int top = 20}) {
  return Container(
    margin: EdgeInsets.only(top: top.h),
    child: Text(
      text,
      style: TextStyle(
          color: AppColors.primaryText,
          fontSize: 24.sp,
          fontWeight: FontWeight.bold),
    ),
  );
}

Widget searchView() {
  return Row(
    children: [
      Container(
        width: 280.h,
        height: 40.h,
        decoration: BoxDecoration(
            color: AppColors.primaryBackground,
            borderRadius: BorderRadius.circular(15.h),
            border: Border.all(color: AppColors.primaryFourthElementText)),
        child: Row(children: [
          Container(
            width: 16.w,
            height: 16.w,
            margin: EdgeInsets.only(left: 17.w),
            child: Image.asset('assets/icons/search.png'),
          ),
          SizedBox(
            width: 40.w,
            height: 40.h,
            child: TextField(
                keyboardType: TextInputType.multiline,
                decoration: const InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(5, 5, 0, 5),
                    hintText: "search your course",
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent)),
                    disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent)),
                    hintStyle: TextStyle(
                      color: AppColors.primarySecondaryElementText,
                    )),
                style: TextStyle(
                  color: AppColors.primaryText,
                  fontFamily: "Avenir",
                  fontWeight: FontWeight.normal,
                  fontSize: 12.sp,
                ),
                autocorrect: false,
                obscureText: false),
          ),
        ]),
      ),
      GestureDetector(
        child: Container(
          width: 40.w,
          height: 40.h,
          decoration: BoxDecoration(
            color: AppColors.primaryElement,
            borderRadius: BorderRadius.all(Radius.circular(13.w)),
            border: Border.all(color: AppColors.primaryElement),
          ),
          child: Image.asset("assets/icons/options.png"),
        ),
      )
    ],
  );
}

Widget sliderView(BuildContext context, HomePageState state) {
  return Column(
    children: [
      Container(
        margin: EdgeInsets.only(top: 20.h),
        width: 325.w,
        height: 160.h,
        child: PageView(
            onPageChanged: (value) {
              print(value);
              context.read<HomePageBlocs>().add(HomePageDots(index: value));
            },
            children: [
              _slidersContainer(),
              _slidersContainer(path: "assets/icons/Image_1.png"),
              _slidersContainer(path: "assets/icons/Image_2.png"),
            ]),
      ),
      Container(
        child: DotsIndicator(
          dotsCount: 3,
          position: state.index,
          decorator: DotsDecorator(
              color: AppColors.primaryThirdElementText,
              activeColor: AppColors.primaryElement,
              size: const Size.square(5.0),
              activeSize: const Size(17.0, 5.0),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0))),
        ),
      )
    ],
  );
}

Widget _slidersContainer({String path = "assets/icons/art.png"}) {
  return Container(
    width: 325.w,
    height: 160.h,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20.h)),
        image: DecorationImage(fit: BoxFit.fill, image: AssetImage(path))),
  );
}

//menu view for showing items
Widget menuView() {
  return Column(
    children: [
      Container(
        width: 325.w,
        margin: EdgeInsets.only(top: 15.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            _reusableText("Choose your course"),
            GestureDetector(
              child: _reusableText("see all",
                  color: AppColors.primaryThirdElementText, fontSize: 10),
            ),
          ],
        ),
      ),
      Container(
        margin: EdgeInsets.only(top: 20.w),
        child: Row(children: [
          _reusableMenuText("All"),
          _reusableMenuText("Popular",
              textColor: AppColors.primaryThirdElementText,
              backgroundColor: Colors.white),
          _reusableMenuText("Newest",
              textColor: AppColors.primaryThirdElementText,
              backgroundColor: Colors.white),
        ]),
      )
    ],
  );
}

Widget _reusableText(String text,
    {Color color = AppColors.primaryText,
    int fontSize = 16,
    FontWeight fontWeight = FontWeight.bold}) {
  return Container(
    child: Text(
      text,
      style: TextStyle(
          color: color, fontWeight: fontWeight, fontSize: fontSize.sp),
    ),
  );
}

//for the menu buttons, reusable text

Widget _reusableMenuText(String menuText,
    {Color textColor = AppColors.primaryElementText,
    Color backgroundColor = AppColors.primaryElement}) {
  return Container(
    margin: EdgeInsets.only(right: 20.w),
    decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(7.w),
        border: Border.all(color: backgroundColor)),
    padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 5.h, bottom: 5.h),
    child: _reusableText(menuText,
        color: textColor, fontWeight: FontWeight.normal, fontSize: 11),
  );
}

Widget courseGrid() {
  return Container(
    padding: EdgeInsets.all(12.w),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15.w),
      image: const DecorationImage(
          fit: BoxFit.fill, image: AssetImage("assets/icons/Image_1.png")),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Best course for IT and Engineering',
          maxLines: 1,
          overflow: TextOverflow.fade,
          textAlign: TextAlign.left,
          softWrap: false,
          style: TextStyle(
              color: AppColors.primaryElementText,
              fontWeight: FontWeight.bold,
              fontSize: 11.sp),
        ),
        SizedBox(height: 5.h),
        Text(
          'Flutter Best course',
          maxLines: 1,
          overflow: TextOverflow.fade,
          textAlign: TextAlign.left,
          softWrap: false,
          style: TextStyle(
              color: AppColors.primaryFourthElementText,
              fontWeight: FontWeight.normal,
              fontSize: 8.sp),
        ),
      ],
    ),
  );
}
