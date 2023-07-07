import 'dart:async';


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:sizer/sizer.dart';
import '../../../utiles/app_router.dart';
import '../../../utiles/constants.dart';
import '../../widgets/no_internet.dart';
import '../../widgets/primary_text.dart';
import '../appLayout.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin{
  late Animation<double> animation;
  late AnimationController controller;
  late var initScreen;
  @override
   initState()  {
      initScreen= const AppLayout();
//     BlocProvider.of<AppCubit>(context).getPopularProducts();
               if(Dimensions.statusBarH==0)
                 Dimensions.statusBarH=MediaQuery.of(context).padding.top;

     controller=AnimationController(vsync: this,duration: const Duration(seconds: 2))..forward();
     animation=CurvedAnimation(parent: controller, curve: Curves.linear);
     Timer(const Duration(seconds: 3),()=>AppRouter.goTo(context, OfflineBuilder(
       connectivityBuilder: (
           BuildContext context,
           ConnectivityResult connectivity,
           Widget child,
           ) {
         final bool connected = connectivity != ConnectivityResult.none;
         if (connected) {
           return initScreen;
         } else {
           return const NoInternetScreen();
         }
       },
       child: Center(child: PrimaryText(text: "Please check internet connection ",),),
     )),);



    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ScaleTransition(
        scale: animation,
        child: Center(
          child: Image.asset(Constants.splashImage,width: 70.w,height: 60.h,),
        ),
      ),
    );
  }
}
