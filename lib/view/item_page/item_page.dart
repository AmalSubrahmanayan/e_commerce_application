import 'package:e_commerce/constants/colors/app_colors.dart';
import 'package:e_commerce/constants/colors/app_sizedboxes.dart';
import 'package:e_commerce/controller/cart/cart_controller.dart';
import 'package:e_commerce/controller/item_page/item_page_controller.dart';
import 'package:e_commerce/controller/wishlist/wishlist_controller.dart';
import 'package:e_commerce/utils/loading_widget.dart';
import 'package:e_commerce/view/item_page/widgets/item_app_bar.dart';
import 'package:e_commerce/view/item_page/widgets/itembottom_nav_bar.dart';
import 'package:e_commerce/view/item_page/widgets/carousel_slider_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

class ItemPage extends StatelessWidget {
  ItemPage({
    super.key,
    required this.productId,
  });

  final List<Color> clrs = [
    Colors.red,
    Colors.green,
    Colors.black,
    Colors.blue,
    Colors.purple,
  ];

  final controller = PageController();
  final String productId;

  @override
  Widget build(BuildContext context) {
    final itemprovider = Provider.of<ItemProvider>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      itemprovider.getAProduct(productId);
      itemprovider.productSize = null;
    });
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.whiteColor,
        body: Consumer3<ItemProvider, WishListProvider, CartProvider>(
          builder: (context, values, values2, values3, _) {
            final product = values.product;
            return values.loading == true
                ? const SizedBox(
                    height: 200,
                    width: double.infinity,
                    child: Center(
                      child: LoadingWidget(),
                    ),
                  )
                : values.product == null
                    ? const SizedBox()
                    : SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const ItemAppBar(),
                            SizedBox(
                              height: 300,
                              width: double.infinity,
                              child: PageView(
                                controller: controller,
                                children: [
                                  CarouselSliderItem(product: product!.image!)
                                ],
                              ),
                            ),
                            //  {SmoothPageIndicator}
                            Container(
                              height: 550,
                              width: double.infinity,
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          values.product!.name!,
                                          overflow: TextOverflow.visible,
                                          style: const TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold,
                                            color: AppColors.blueColor,
                                            overflow: TextOverflow.fade,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: IconButton(
                                          onPressed: () =>
                                              values2.addOrRemoveFromWishList(
                                                  values.product!.id
                                                      .toString()),
                                          icon: Icon(
                                            values2.favouriteProducts.contains(
                                                    values.product!.id)
                                                ? Icons.favorite
                                                : Icons.favorite_border,
                                            color: values2.favouriteProducts
                                                    .contains(
                                                        values.product!.id)
                                                ? AppColors.redColor
                                                : AppColors.blueColor,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const Text(
                                        "₹ ",
                                        style: TextStyle(
                                          fontSize: 25,
                                          color: Colors.blueGrey,
                                        ),
                                      ),
                                      Text(
                                        '${product.price}',
                                        style: const TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.blueColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                  AppSizedBoxes.sizedboxH10,
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      RatingBar.builder(
                                        itemBuilder: (context, _) => Icon(
                                          Icons.star,
                                          color: Colors.yellow[800],
                                        ),
                                        onRatingUpdate: (index) {},
                                        initialRating: double.parse(
                                            values.product!.rating!),
                                        minRating: 1,
                                        direction: Axis.horizontal,
                                        itemCount: 6,
                                        itemSize: 25,
                                        itemPadding: const EdgeInsets.symmetric(
                                            horizontal: 4),
                                      ),
                                    ],
                                  ),
                                  AppSizedBoxes.sizedboxH20,
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: const [
                                          Text(
                                            "Size: ",
                                            style: TextStyle(
                                              fontSize: 25,
                                              color: AppColors.blueColor,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            "US ",
                                            style: TextStyle(
                                              fontSize: 21,
                                              color: AppColors.greyColor,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          )
                                        ],
                                      ),
                                      AppSizedBoxes.sizedboxH10,
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      SizedBox(
                                        height: 50,
                                        child: ListView.separated(
                                          separatorBuilder: (context, index) =>
                                              const SizedBox(),
                                          shrinkWrap: true,
                                          scrollDirection: Axis.horizontal,
                                          itemCount:
                                              values.product!.size!.length,
                                          itemBuilder: (context, index) =>
                                              Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: GestureDetector(
                                              onTap: () {
                                                values.sizeSelected(index);
                                              },
                                              child: Container(
                                                height: 30,
                                                width: 30,
                                                alignment: Alignment.center,
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 10),
                                                decoration: BoxDecoration(
                                                    color: Colors.grey,
                                                    borderRadius: BorderRadius
                                                        .circular(10),
                                                    border:
                                                        values.sizeChartIndex ==
                                                                index
                                                            ? Border.all(
                                                                color: AppColors
                                                                    .blueColor,
                                                                width: 2.5)
                                                            : null,
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Colors.white60
                                                            .withOpacity(0.5),
                                                        spreadRadius: 2,
                                                        blurRadius: 5,
                                                      ),
                                                    ]),
                                                child: Text(
                                                  values.product!.size![index],
                                                  style: const TextStyle(
                                                    color: AppColors.whiteColor,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      AppSizedBoxes.sizedboxH10,
                                      const Text(
                                        "Color: ",
                                        style: TextStyle(
                                          fontSize: 25,
                                          color: AppColors.blueColor,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      AppSizedBoxes.sizedboxH10,
                                      Row(
                                        children: [
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Row(
                                            children: [
                                              for (int i = 0; i < 5; i++)
                                                Container(
                                                  height: 30,
                                                  width: 30,
                                                  alignment: Alignment.center,
                                                  margin: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 10),
                                                  decoration: BoxDecoration(
                                                      color: clrs[i],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: Colors.grey
                                                              .withOpacity(0.5),
                                                          spreadRadius: 2,
                                                          blurRadius: 8,
                                                        ),
                                                      ]),
                                                )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  AppSizedBoxes.sizedboxH20,
                                  const Text(
                                    "Our design consulting experts can help create a modern office which inspires your people. We don't just create office buildings, we can create the future of work for you. Eco friendly Office space. New Office Space Looks. Smart Office Designs. Best Workplace Designs.",
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                  AppSizedBoxes.sizedboxH20,
                                ],
                              ),
                            )
                          ],
                        ),
                      );
          },
        ),
        bottomNavigationBar: const ItemBottomNavBar(),
      ),
    );
  }
}
