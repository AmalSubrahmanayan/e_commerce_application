import 'package:flutter/material.dart';

class ItemAppBar extends StatelessWidget {
  const ItemAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(15),
        child: Row(
          children: [
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back,
                size: 30,
                color: Colors.black,
              ),
            ),
          //   const Padding(
          //     padding: EdgeInsets.only(left: 20),
          //     child: Text(
          //       "Product",
          //       style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
          //     ),
          //   ),
          ],
        ),
      ),
    );
  }
}
