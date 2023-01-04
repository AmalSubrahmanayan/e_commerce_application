import 'package:e_commerce/constants/colors/app_colors.dart';
import 'package:e_commerce/constants/colors/app_sizedboxes.dart';
import 'package:e_commerce/controller/cart/cart_controller.dart';
import 'package:e_commerce/controller/home/home_controller.dart';
import 'package:e_commerce/controller/wishlist/wishlist_controller.dart';
import 'package:e_commerce/utils/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wishlist extends StatelessWidget {
  const Wishlist({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(
            left: 15,
            right: 15,
            top: 10,
          ),
          // // margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
          // decoration: BoxDecoration(
          //     color: Colors.grey[200],
          //     borderRadius: BorderRadius.circular(20),
          //     border: Border.all()),
          child: Consumer3<WishListProvider, HomeProvider, CartProvider>(
            builder: (context, value1, value2, value3, child) {
              return value1.loading == true
                  ? SizedBox(
                      height: MediaQuery.of(context).size.height / 1.3,
                      width: double.infinity,
                      child: const Center(
                        child: LoadingWidget(),
                      ),
                    )
                  : value1.wishList == null || value1.wishList!.products.isEmpty
                      ? SizedBox(
                          height: MediaQuery.of(context).size.height / 1.3,
                          width: double.infinity,
                          child: const Center(
                            child: Text("Wishlist is empty"),
                          ),
                        )
                      : GridView.builder(
                          itemCount: value1.wishList!.products.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 20,
                            childAspectRatio: 1.5 / 2.5,
                          ),
                          itemBuilder: (context, index) {
                            return Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.grey[200],
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                            color: AppColors.greenColor,
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          child: Text(
                                            "-${value1.wishList!.products[index].product.offer}%",
                                            style: const TextStyle(
                                              fontSize: 14,
                                              color: AppColors.whiteColor,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        const Icon(
                                          Icons.favorite_border,
                                          color: AppColors.blueColor,
                                        ),
                                      ],
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {},
                                    child: Container(
                                      margin: const EdgeInsets.all(10),
                                      child: Image(
                                        image: NetworkImage(
                                            "http://172.16.10.112:5006/products/${value1.wishList!.products[index].product.image[index]}"),
                                        height: 120,
                                        width: 100,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        value1.wishList!.products[index].product
                                            .name,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          fontSize: 18,
                                          color: AppColors.buttonColor,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  AppSizedBoxes.sizedboxH10,
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "₹${value1.wishList!.products[index].product.price}",
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: AppColors.blueColor),
                                        ),
                                        // const Icon(
                                        //   Icons.shopping_cart_checkout_outlined,
                                        //   color: AppColors.blueColor,
                                        // )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            );
                          });
            },
          ),
        ),
      ),
    );
  }
}
