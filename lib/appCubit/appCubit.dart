import 'dart:async';
import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/app_model.dart';
import '../../data/web_services/app_web_service.dart';
import 'appState.dart';

class AppCubit extends Cubit<AppState>
{
  AppCubit(this.appWebServices):super(InitialState());

  final AppWebServices appWebServices ;

  Future<AppModel> getPopularProducts()async{
    final popularProducts= await appWebServices.getPopularProducts();
    return AppModel.fromJson(popularProducts);
  }


}