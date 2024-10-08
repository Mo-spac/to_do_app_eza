import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app_ageeza/app/app.dart';
import 'package:to_do_app_ageeza/core/database/cache_helper.dart';
import 'package:to_do_app_ageeza/core/service_locator/service_locator.dart';
import 'package:to_do_app_ageeza/featured/task/presentation/cubit/task_cubit/task_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setup();
  await sL<CacheHelper>().init();
  // SharedPreferences pref1 = await SharedPreferences.getInstance();
  // SharedPreferences pref2 = await SharedPreferences.getInstance();
  // print(pref1 == pref2);
  // var a = A(1);
  // var b = A(1);
  // print(a.hashCode);
  // print(b.hashCode);
  // print(a == b);

  runApp(BlocProvider(
    create: (context) => TaskCubit(),
    child: const MyApp(),
  ));
}

// class A {
//   final int pref;

//   A(this.pref);
// }
