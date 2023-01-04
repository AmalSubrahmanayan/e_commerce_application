import 'package:e_commerce/constants/colors/app_colors.dart';
import 'package:e_commerce/controller/cart/cart_controller.dart';
import 'package:e_commerce/utils/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

import 'widgets/cart_item_widget.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    final cartScreenProvider =
        Provider.of<CartProvider>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      cartScreenProvider.getCartItems();
    });
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(100, 70),
        child: AppBar(
          elevation: 0,
          backgroundColor: AppColors.whiteColor,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back),
          ),
          title: const Text(
            "Cart",
            style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
                color: AppColors.blueColor),
          ),
          actions: [
            PopupMenuButton(
              onSelected: (value) {
                // cartScreenProvider
                //   .removeFromCart(cartScreenProvider.cartItemsId[index])
              },
              itemBuilder: (context) => [
                const PopupMenuItem(
                  child: Text(
                    "delete all cart",
                    textAlign: TextAlign.center,
                    selectionColor: AppColors.blueColor,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      body: SafeArea(
        child: Consumer<CartProvider>(
          builder: (context, value, _) {
            return value.loading == true
                ? SizedBox(
                    height: MediaQuery.of(context).size.height / 1.3,
                    width: double.infinity,
                    child: const Center(
                      child: LoadingWidget(),
                    ),
                  )
                : value.cartList == null || value.cartList!.products.isEmpty
                    ? SizedBox(
                        height: MediaQuery.of(context).size.height / 1.3,
                        width: double.infinity,
                        child: const Center(
                          child: Text('Cart is empty'),
                        ),
                      )
                    : ListView.separated(
                        itemCount: value.cartList!.products.length,
                        itemBuilder: (context, index) => Stack(
                          children: [
                            SingleChildScrollView(
                              child: Column(
                                children: [
                                  Slidable(
                                    endActionPane: ActionPane(
                                        motion: const BehindMotion(),
                                        extentRatio: 0.25,
                                        children: [
                                          SlidableAction(
                                            padding: EdgeInsets.zero,
                                            label: "Delete",
                                            icon: Icons.delete,
                                            backgroundColor:
                                                AppColors.greyColor,
                                            foregroundColor:
                                                AppColors.redColor[400],
                                            spacing: 4,
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            onPressed: (context) => {
                                              value.removeFromCart(value
                                                  .cartList!
                                                  .products[index]
                                                  .product
                                                  .id)
                                            },
                                          ),
                                        ]),
                                    child: Container(
                                      height: 130,
                                      margin: const EdgeInsets.symmetric(
                                        horizontal: 10,
                                      ),
                                      padding: const EdgeInsets.all(9),
                                      decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: CartItemWidget(
                                        index: index,
                                        image: value.cartList!.products[index]
                                            .product.image[0],
                                        itemName: value.cartList!
                                            .products[index].product.name,
                                        size: value
                                            .cartList!.products[index].size,
                                        itemprice: value
                                            .cartList!.products[index].price
                                            .toString(),
                                        price: value
                                            .cartList!.products[index].price
                                            .toString(),
                                        itemCount: value
                                            .cartList!.products.length
                                            .toString(),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        separatorBuilder: (BuildContext context, int index) {
                          return const Divider(
                            thickness: 3,
                          );
                        },
                      );
          },
        ),
      ),
    );
  }
}
