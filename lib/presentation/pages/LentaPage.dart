import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sbornik_pervokursnika/domain/modle/Teg.dart';
import 'package:sbornik_pervokursnika/domain/state/lenta/lenta_bloc.dart';
import 'package:sbornik_pervokursnika/presentation/WaitingWiget.dart';

import '../../data/repository/postrepo.dart';
import '../postswidget.dart';

import 'package:flutter/material.dart';

class LentaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocProvider(
          create: (context) => LentaBloc(),
          child: LoginBloc(),
      )
    );
  }
}


class LoginBloc extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    LentaBloc block = BlocProvider.of(context);
    return BlocConsumer<LentaBloc, LentaInitial>(
      listener: (context, state) {

    },
    builder: (context, state){
      if (state.waitingresponce)
      {
        return WaitingWidget();
      }
      if (state.allTegs.length == 0)
      {
        block.add(DownloadInitialData());
        return WaitingWidget();
      }
      else
      {
        return Column(
          children: [
            MyDropDownList(state.allTegs),
            Expanded(child:new ListView.builder(
            //itemCount: state.postStore.length + 1,
            itemBuilder: (context, index) {
              print(index);
              if (index + 1 == state.postStore.length)
              {
                block.add(AddPosts());
                return Container(child:Text('Ждите'),
                );
              }
              return PostWidget(state.postStore[index]);
            },
          )),]
        );
      }
    });
  }
}

class MyDropDownList extends StatefulWidget {
  final List<Teg> items;
  MyDropDownList(this.items){}

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState(items);
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<MyDropDownList> {
  final List<Teg> items;
  String dropdownValue;

  _MyStatefulWidgetState(this.items){this.dropdownValue = items[0].name;}

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: Icon(Icons.arrow_downward),
      iconSize: 24,
      style: TextStyle(color: Colors.deepPurple),
      onChanged: (String newValue) {
        setState(() {
          dropdownValue = newValue;
        });
      },
      items: this.items
          .map<DropdownMenuItem<String>>((Teg value) {
        return DropdownMenuItem<String>(
          value: value.name,
          child: Row(
            children: [Text(value.name), value.selected? Icon(Icons.check):Icon(Icons.cancel)]
        ));
      }).toList(),
    );
  }
}
