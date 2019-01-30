import 'package:flutter/material.dart';
import '../organisms/editor_bar.dart';
import '../organisms/settings_drawer.dart';
import '../organisms/template_thumb_gallery.dart';
import '../atoms/bloc_provider.dart';
import '../molecules/option_primary_color_bloc.dart';
import '../molecules/option_primary_color.dart';

class Editor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      bloc: PrimaryColorOptionBloc([
        Theme.of(context).primaryColor, 
        Theme.of(context).accentColor, 
        Theme.of(context).primaryColorLight, 
      ]),
      child: Scaffold(
        appBar: editorBar(),
        body: ListView(
          children: <Widget>[
            TemplateThumbGallery(),
            PrimaryColorOption(),
            Divider(),
            ListTile(title: Text('List or Grid'),),
            Divider(),
            ListTile(title: Text('Size of Grid / List'),),
            Divider(),
            ListTile(title: Text('Thumbnails shape'),),
            Divider(),
            ListTile(title: Text('Search Bar bool'),),
            Divider(),
          ],
        ),
        drawer: SettingsDrawer(),
      ),
    );
  }
}