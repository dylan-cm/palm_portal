import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'dart:io';
import 'atoms/bloc_provider.dart';

class ThemeBloc extends BlocBase{
  final _themeSubject = BehaviorSubject<ThemeModel>();

  Database db;

  //Constructor
  ThemeBloc(){
    _init();
  }

  //Getters
  ValueObservable<ThemeModel> get themeStream => _themeSubject.stream;

  ThemeModel get theme => themeStream.value;

  //Setters
  Function(ThemeModel) get setTheme => (newTheme) {
    _themeSubject.sink.add(newTheme);
    //_saveTheme(newTheme);
  };

  //Database methods
  //Initialize db
  void _init() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, "theme0.db");
    db = await openDatabase(
      path,
      version: 1,
      onCreate: (Database newDb, int version) {
        newDb.execute("""
          CREATE TABLE Theme
            (
              id INTEGER PRIMARY KEY,
              headerFont TEXT,
              bodyFont TEXT,
              primaryColor INTEGER,
              primaryBright INTEGER,
              primaryDark INTEGER,
              secondaryColor INTEGER,
              lightTheme INTEGER,
            )
        """);
      },
    );

    setTheme(
      ThemeModel(
        fontFamily : "Roboto",
        secondaryFont : "Roboto",
        primaryColor : int.parse(ThemeData.light().primaryColor.toString().substring(35,45)),
        primaryBright : int.parse(ThemeData.light().primaryColorLight.toString().substring(6,16)),
        primaryDark : int.parse(ThemeData.light().primaryColorDark.toString().substring(6,16)),
        secondaryColor : int.parse(ThemeData.light().accentColor.toString().substring(6,16)),
        lightTheme : true,
      )
    );
  }

  //Update the database with theme
  Future<int> _saveTheme(ThemeModel theme){
    return db.update(
      "Theme", 
      theme.toMap(),
      );
  }

  //Dispose of stream
  void dispose() { 
    _themeSubject.close();
  }
}

class ThemeModel{
  final String fontFamily;
  final String secondaryFont;
  final int primaryColor;
  final int primaryBright;
  final int primaryDark;
  final int secondaryColor;
  final bool lightTheme;

  ThemeModel({
    this.fontFamily : "Roboto",
    this.secondaryFont : "Roboto",
    this.primaryColor :  4280391411,
    this.primaryBright :  4290502395,
    this.primaryDark :  4279858898,
    this.secondaryColor :  4280391411,
    this.lightTheme : true,
  });

  ThemeModel.fromDb(Map<String, dynamic> parsedJson)
    : fontFamily = parsedJson['fontFamily'],
      secondaryFont = parsedJson['secondaryFont'],
      primaryColor = parsedJson['primaryColor'],
      primaryBright = parsedJson['primaryBright'],
      primaryDark = parsedJson['primaryDark'],
      secondaryColor = parsedJson['secondaryColor'],
      lightTheme = parsedJson['lightTheme'] == 1;

  Map<String, dynamic> toMap(){
    return <String, dynamic>{
      "id" : 0,
      "fontFamily" : fontFamily,
      "secondaryFont" : secondaryFont,
      "primaryColor" : primaryColor,
      "primaryBright" : primaryBright,
      "primaryDark" : primaryDark,
      "secondaryColor" : secondaryColor,
      "lightTheme" : lightTheme ? 1 : 0,
    };
  }
}