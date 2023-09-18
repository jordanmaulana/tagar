import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:tagar/apps/home/views/add_data.dart';
import 'package:tagar/apps/main_nav/views/main_nav_view.dart';
import 'package:tagar/core/utils/colors.dart';
import 'package:tagar/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarBrightness: Brightness.dark,
    statusBarColor: VColor.orange,
  ));
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarBrightness: Brightness.dark,
    statusBarColor: VColor.orange,
  ));

  await SentryFlutter.init(
    (options) {
      options.dsn =
          'https://c9f4194a61bc4d419dcb12c17079e288@o1350944.ingest.sentry.io/4505422512128000';
      // Set tracesSampleRate to 1.0 to capture 100% of transactions for performance monitoring.
      // We recommend adjusting this value in production.
      options.tracesSampleRate = 1.0;
    },
    appRunner: () => runApp(const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Tagar',
      debugShowCheckedModeBanner: false,
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
