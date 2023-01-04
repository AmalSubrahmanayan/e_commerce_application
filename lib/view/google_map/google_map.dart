// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';

// class GoodleMap extends StatelessWidget {
//   const GoodleMap({
//     super.key,
//   });



//   @override
//   Widget build(BuildContext context) {
//     late String lat;
//     late String long;

//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: const [
//             Text(
//               "Current Location of the User",
//               textAlign: TextAlign.center,
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 getCurrentLocation().then((value) {
//                   lat = '${value.latitide}';
//                   long = '${value.longitude}';
                  
//                 });
//               },
//               child: Text("Current Location"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
  
//   Future<Object> getCurrentLocation() async{
//     bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
//     if(!serviceEnabled){
//       return Future.error('Location service are disabled');
//     }
//     LocationPermission permission = await Geolocator.checkPermission();
//     if(permission == LocationPermission.denied){
//       permission = await Geolocator.requestPermission();
//       if(permission == LocationPermission.denied){
//         return Future.error('Location permition are denied');
//       }
//     }
//     if(permission == LocationPermission.deniedForever){
//       return Future.error('Location Permission are permanently denied, We cannot request');
//     }
//     return await Geolocator.getCurrentPosition();
//   }
// }
