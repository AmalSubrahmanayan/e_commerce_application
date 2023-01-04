import 'package:e_commerce/constants/colors/app_colors.dart';
import 'package:e_commerce/constants/colors/app_sizedboxes.dart';
import 'package:e_commerce/controller/home/home_controller.dart';
import 'package:e_commerce/utils/loading_widget.dart';
import 'package:e_commerce/view/home/widgets/categories_widget.dart';
import 'package:e_commerce/view/home/widgets/itemwidget.dart';
import 'package:e_commerce/view/home/widgets/slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'widgets/home_app_bar.dart';

class Home extends StatelessWidget {
  const Home({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 1, 6, 45),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const HomeAppBar(),
              Container(
                decoration: const BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35),
                    topRight: Radius.circular(35),
                  ),
                ),
                child: Consumer<HomeProvider>(
                  builder: (context, values, _) {
                    return values.loading == true
                        ? const Center(
                            child: LoadingWidget(),
                          )
                        : Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CarouselSliderWidget(
                                  carousal: values.carousalList,
                                ),
                                AppSizedBoxes.sizedboxH10,
                                const Text(
                                  "Categories",
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.buttonColor,
                                  ),
                                ),
                                AppSizedBoxes.sizedboxH10,
                                SizedBox(
                                  height: 60,
                                  child: ListView.separated(
                                    separatorBuilder: (context, index) =>
                                        const SizedBox(
                                            // width: 10,
                                            ),
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: values.categoryList.length,
                                    itemBuilder: (context, index) =>
                                        CategoriesWidget(
                                      imagepath:
                                          ("http://172.16.10.112:5006/category/${values.categoryList[index].image}"),
                                      text: values.categoryList[index].name,
                                      ontap: () {},
                                    ),
                                  ),
                                ),
                                const Text(
                                  "Best Selling",
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.buttonColor,
                                  ),
                                ),
                                values.loading
                                    ? const Center(
                                        child: CircularProgressIndicator(),
                                      )
                                    : values.productList.isEmpty
                                        ? const SizedBox()
                                        : GridView.builder(
                                            scrollDirection: Axis.vertical,
                                            shrinkWrap: true,
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            itemCount:
                                                values.productList.length,
                                            gridDelegate:
                                                const SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 2,
                                              crossAxisSpacing: 12,
                                              childAspectRatio: 1 / 1.7,
                                            ),
                                            itemBuilder: (context, index) {
                                              return ItemWidget(
                                                price: values
                                                    .productList[index].price
                                                    .toString(),
                                                offer: values
                                                    .productList[index].offer
                                                    .toString(),
                                                name: values
                                                    .productList[index].name
                                                    .toString(),
                                                imagePath:
                                                    ("http://172.16.10.112:5006/products/${values.productList[index].image![0]}"),
                                                ontap: () {
                                                  values.toProductScreen(
                                                      context,
                                                      values.productList[index]
                                                          .id);
                                                },
                                              );
                                            },
                                          )
                              ],
                            ),
                          );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
