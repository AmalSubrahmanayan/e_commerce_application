import 'package:e_commerce/constants/colors/app_colors.dart';
import 'package:e_commerce/controller/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ItemWidget extends StatelessWidget {
  const ItemWidget({
    super.key,
    required this.name,
    required this.imagePath,
    required this.offer,
    required this.ontap,
    required this.price,
  });
  final String imagePath;
  final String name;
  final String offer;
  final String price;

  final void Function() ontap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: 15,
        right: 15,
        top: 10,
      ),
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(20),
        // border: Border.all()
      ),
      child: Consumer<HomeProvider>(
        builder: (context, value, child) {
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: AppColors.greenColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      "-$offer%",
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
              InkWell(
                onTap: ontap,
                child: Container(
                  margin: const EdgeInsets.all(10),
                  child: Image(
                    image: NetworkImage(imagePath),
                    height: 130,
                    width: double.infinity,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(bottom: 8),
                alignment: Alignment.centerLeft,
                child: Text(
                  name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 18,
                    color: AppColors.buttonColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "₹$price",
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppColors.blueColor),
                    ),
                    const Icon(
                      Icons.shopping_cart_checkout_outlined,
                      color: AppColors.blueColor,
                    )
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
