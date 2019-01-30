import 'package:flutter/material.dart';
import '../atoms/square_button.dart';
import 'option_primary_color_bloc.dart';
import '../atoms/bloc_provider.dart';

class PrimaryColorOption extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<PrimaryColorOptionBloc>(context);

    return BlocProvider(
      bloc: bloc,
      child: ListTile(
        leading: Text(
          'Primary Color:',
          style: TextStyle(fontSize: 16),
        ),
        contentPadding: EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 0.0),
        trailing: StreamBuilder(
          stream: bloc.colorList,
          initialData: bloc.colorList.value,
          builder: (context, AsyncSnapshot<List<SquareButton>>snapshot){
            return Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: snapshot.data
            );
          },
        )
      )
    );
  }
}