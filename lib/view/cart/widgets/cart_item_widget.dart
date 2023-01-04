import 'package:e_commerce/constants/colors/app_colors.dart';
import 'package:e_commerce/constants/colors/app_sizedboxes.dart';
import 'package:e_commerce/controller/cart/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartItemWidget extends StatelessWidget {
  const CartItemWidget({
    Key? key,
    required this.image,
    required this.itemName,
    required this.price,
    required this.size,
    required this.itemprice,
    required this.itemCount,
    required this.index,
  }) : super(key: key);
  final String image;
  final String price;
  final String itemName;
  final String size;
  final String itemprice;
  final String itemCount;
  final int index;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CartProvider>(context, listen: false);
    return Row(
      children: [
        Container(
          height: 80,
          width: 70,
          color: Colors.red,
          margin: const EdgeInsets.only(right: 15),
          child: Image(
            fit: BoxFit.fill,
            image: NetworkImage('http://172.16.10.112:5006/products/$image'),
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                itemName,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.blueColor,
                ),
              ),
              AppSizedBoxes.sizedboxH5,
              Text(
                "₹$price",
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.greenColor,
                ),
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      provider.incrementOrDecrementQuantity(
                          -1,
                          provider.cartList!.products[index].product.id,
                          provider.cartList!.products[index].size,
                          provider.cartList!.products[index].qty);
                    },
                    icon: const Icon(
                      Icons.remove,
                      size: 16,
                    ),
                  ),
                  Text(
                    provider.cartList!.products[index].qty.toString(),
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColors.blueColor),
                  ),
                  IconButton(
                    onPressed: () {
                      provider.incrementOrDecrementQuantity(
                          1,
                          provider.cartList!.products[index].product.id,
                          provider.cartList!.products[index].size,
                          provider.cartList!.products[index].qty);
                    },
                    icon: const Icon(
                      Icons.add,
                      size: 16,
                    ),
                  )
                ],
              )
            ],
          ),
        ),

        // const Spacer(),
        // Padding(
        //   padding: const EdgeInsets.symmetric(vertical: 37, horizontal: 5),
        //   child: Column(
        //     crossAxisAlignment: CrossAxisAlignment.end,
        //     mainAxisAlignment: MainAxisAlignment.end,
        //     children: const [
        //       // AppSizedBoxes.sizedboxH5,

        //     ],
        //   ),
        // )
      ],
    );
  }
}
