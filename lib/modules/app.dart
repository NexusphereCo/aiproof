import 'package:aiproof/business_logic/appbar/appbar_bloc.dart';
import 'package:aiproof/business_logic/document_view/document_view_bloc.dart';
import 'package:aiproof/business_logic/document/document_bloc.dart';
import 'package:aiproof/constants/theme.dart';
import 'package:aiproof/data/database/database_service.dart';
import 'package:aiproof/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) => MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => DocumentBloc(DatabaseServices.instance)),
          BlocProvider(create: (_) => DocViewBloc()),
          BlocProvider(create: (_) => AppBarBloc()),
        ],
        child: MaterialApp(
          title: 'aiproof',
          theme: APTheme.data(),
          routes: Routes.routes,
          initialRoute: Routes.home,
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}
