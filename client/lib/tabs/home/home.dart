import 'package:flutter/cupertino.dart';
import 'package:sizer/sizer.dart';
import 'myOutfit.dart';
import 'otherOutfit.dart';
import 'randomOutfit.dart';
import 'weatherOutfit.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
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
              WeatherOutfit(),
              MyOutfit(),
              OtherOutfit(),
              RandomOutfit(),
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
