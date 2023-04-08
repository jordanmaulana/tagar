import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tagar/apps/home/views/add_data.dart';
import 'package:tagar/apps/main_nav/views/main_nav_view.dart';
import 'package:tagar/core/utils/colors.dart';
import 'package:tagar/routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Tagar',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: VColor.orange,
          elevation: 0.0,
          centerTitle: true,
          iconTheme: IconThemeData(
            color: VColor.white,
          ),
          titleTextStyle: TextStyle(
            fontSize: 16.0,
            color: VColor.white,
          ),
        ),
      ),
      getPages: [
        GetPage(
          name: Routes.main,
          page: () => const MainNavView(),
        ),
        GetPage(
          name: Routes.addData,
          page: () => const AddDataView(),
        ),
      ],
    );
  }
}
