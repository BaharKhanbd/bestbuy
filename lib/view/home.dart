import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';
import 'package:bestbuy/controller/app_provider.dart';
import 'package:bestbuy/controller/product_category_controller.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    // Fetch data when widget is initialized
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final categoryProvider =
          Provider.of<ProductCategoryController>(context, listen: false);
      categoryProvider.getPostApi();
    });
  }

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
      body: SingleChildScrollView(
        child: Column(
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
            Consumer<AppProvider>(builder: (context, provider, _) {
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
            }),
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.only(left: 12.w),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Categories",
                    style:
                        TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
                  )),
            ),
            SizedBox(height: 14.h),
            Padding(
              padding: EdgeInsets.only(left: 12.w),
              child: Consumer<ProductCategoryController>(
                builder: (context, categoryProvider, child) {
                  if (categoryProvider.isLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  return SizedBox(
                    height: 90.h, // Ensure height constraint
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: categoryProvider.categoryList.length,
                      itemBuilder: (context, index) {
                        var category = categoryProvider.categoryList[index];

                        return GestureDetector(
                          onTap: () {},
                          child: SizedBox(
                            width: 180.w,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: 60.w,
                                  height: 60.h,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        color: Colors.grey, width: 1),
                                  ),
                                  child: category.image != null
                                      ? ClipOval(
                                          child: Image.network(
                                            category.image!,
                                            fit: BoxFit.cover,
                                            errorBuilder:
                                                (context, error, stackTrace) {
                                              return Icon(
                                                Icons.error,
                                                size: 30.r,
                                              );
                                            },
                                            loadingBuilder: (context, child,
                                                loadingProgress) {
                                              if (loadingProgress == null) {
                                                return child;
                                              }
                                              return const CircularProgressIndicator(); // Show loading indicator
                                            },
                                          ),
                                        )
                                      : Icon(Icons.image_not_supported,
                                          size: 30.r),
                                ),
                                SizedBox(width: 4.w),
                                Flexible(
                                  child: Container(
                                    padding: EdgeInsets.all(8.w),
                                    child: Text(
                                      category.name!,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 12.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 12.w, right: 12.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Best Selling",
                    style: TextStyle(fontSize: 14.sp),
                  ),
                  Text(
                    "See all",
                    style: TextStyle(fontSize: 14.sp),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 400.h,
            ),
          ],
        ),
      ),
    );
  }
}
