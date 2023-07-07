import '/presentation/widgets/primary_text.dart';
import 'package:flutter/material.dart';

import '../../utiles/constants.dart';
class NoInternetScreen extends StatelessWidget {
  const NoInternetScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               SizedBox(
                height: Dimensions.p20,
              ),
              PrimaryText(
                text: 'Can\'t connect .. check internet',
              ),
              Image.asset(Constants.noInternet),
            ],
          ),
        ),
      ),
    );
  }
}
