import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/cupertino.dart';
import 'package:sizer/sizer.dart';
import 'myOutfit.dart';
import 'otherOutfit.dart';
import 'randomOutfit.dart';
import 'weatherOutfit.dart';

class Home extends StatelessWidget {
  Home({super.key});

  var clothesDetail;
  // getClothes() async {
  //   http.Response response =
  //       await http.get(Uri.parse('http://127.0.0.1:8000/api/outfits/1'));
  //   clothesDetail = jsonDecode(response.body);
  //   print(clothesDetail);
  // }

  @override
  Widget build(BuildContext context) {
    //getClothes();
    return Sizer(
      builder: (context, orientation, deviceType) {
        return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              width: 100.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 100,
                  ),
                  //WeatherOutfit(),
                  MyOutfit(),
                  OtherOutfit(),
                  RandomOutfit(),
                  // Container(
                  //   child: Image.memory(
                  //       base64Decode(clothesDetail['image_memory'])),
                  // ),
                  Container(
                    height: 100,
                  ),
                ],
              ),
            ));
      },
    );
  }
}
