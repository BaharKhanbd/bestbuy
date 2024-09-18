import 'package:bestbuy/controller/app_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    print("Home Rebuilding");

    final List<String> imagePaths = [
      'assets/images/1.jpg',
      'assets/images/2.jpg',
      'assets/images/3.jpg',
      'assets/images/4.jpg',
      'assets/images/5.jpg',
    ];

    final List<Widget> imageSliders = imagePaths
        .map((item) => Center(
              child: Image.asset(
                item,
                fit: BoxFit.cover,
                width: 1000,
              ),
            ))
        .toList();

    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 40.h),
          Text(
            "Bestbuy",
            style: TextStyle(
              fontSize: 22.sp,
              color: Colors.green.shade700,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 12.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(30.r)),
              ),
              height: 40.h,
              child: TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Padding(
                    padding: EdgeInsets.only(right: 12.w),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.green.shade700,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.r),
                          bottomLeft: Radius.circular(30.r),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.w),
                        child: Icon(Icons.search,
                            size: 18.sp, color: Colors.white),
                      ),
                    ),
                  ),
                  hintText: 'Search In...',
                  hintStyle: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.black.withOpacity(0.5),
                  ),
                  contentPadding: EdgeInsets.only(left: 14.w),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(30.r),
                  ),
                  filled: true,
                  fillColor: Colors.green.withOpacity(0.2),
                  isDense: true,
                ),
              ),
            ),
          ),
          SizedBox(height: 20.h),
          CarouselSlider(
            items: imageSliders,
            options: CarouselOptions(
              autoPlay: true,
              enlargeCenterPage: true,
              aspectRatio: 2.0,
              onPageChanged: (index, reason) {
                Provider.of<AppProvider>(context, listen: false)
                    .setCarouselIndex(index);
              },
            ),
          ),
          Consumer<AppProvider>(
            builder: (context, provider, _) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: imageSliders.map((url) {
                  int index = imageSliders.indexOf(url);
                  return Container(
                    width: 8,
                    height: 8,
                    margin: EdgeInsets.symmetric(
                      vertical: 10.h,
                      horizontal: 3.w,
                    ),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: provider.carouselIndex == index
                          ? const Color.fromRGBO(0, 0, 0, 0.9)
                          : const Color.fromRGBO(0, 0, 0, 0.4),
                    ),
                  );
                }).toList(),
              );
            },
          ),
          SizedBox(
            height: 10.h,
          ),
          Text("data"),
        ],
      ),
    );
  }
}
