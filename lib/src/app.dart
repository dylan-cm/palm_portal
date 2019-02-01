import 'package:flutter/material.dart';
import 'screens/editor.dart';
import 'screens/brand_identity.dart';
import 'theme.dart';
import 'atoms/bloc_provider.dart';

class App extends StatelessWidget {
  final themeBloc = ThemeBloc();

  @override
  Widget build(BuildContext context) {
    // themeBloc.setTheme(ThemeModel(
    //   //FOR TESTING ONLY
    //   primaryColor: int.parse(Colors.red[500].toString().substring(6,16)),
    //   primaryBright: int.parse(Colors.yellow[500].toString().substring(6,16)),
    //   ));
    return BlocProvider<ThemeBloc>(
      bloc: themeBloc,
      child: StreamBuilder(
        stream: themeBloc.themeStream,
        initialData: ThemeModel(),
        builder: (context, AsyncSnapshot<ThemeModel>snapshot) {
          return MaterialApp(
            theme: snapshot.hasData ? ThemeData(
              primaryColor: Color(snapshot.data.primaryColor),//Color(snapshot.data.primaryColor),
              accentColor: Color(snapshot.data.secondaryColor),
              primaryColorLight: Color(snapshot.data.primaryBright),
              fontFamily: snapshot.data.fontFamily,
              brightness: snapshot.data.lightTheme ? Brightness.light : Brightness.dark,
            ) : ThemeData(),
            home: BrandId(),//Editor(), //BUILDING BRAND ID SCREEN
          );
        }
      ),
    );
  }
}