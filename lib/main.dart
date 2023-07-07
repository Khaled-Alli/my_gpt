import '/presentation/app_layout/screens/splash.dart';
import '/utiles/app_router.dart';
import '/utiles/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'appCubit/appCubit.dart';
import 'data/web_services/app_web_service.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(
      providers: [
        BlocProvider<AppCubit>(create:(context)=> AppCubit(AppWebServices()),),
      ],
      child: Sizer(
          builder: (context, orientation, deviceType) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: Constants.appName,
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              home:
              const SplashScreen(),
              routes: AppRouter.routs,
            );
          }
      ),
    );


  }
}
