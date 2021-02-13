import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sbornik_pervokursnika/domain/modle/Teg.dart';
import 'package:sbornik_pervokursnika/domain/state/lenta/lenta_bloc.dart';
import 'package:sbornik_pervokursnika/presentation/WaitingWiget.dart';

import '../../data/repository/postrepo.dart';
import '../postswidget.dart';

import 'package:flutter/material.dart';

class LentaPage extends StatelessWidget {
// <<<<<<< HEAD
//   final containers = posts.map((post) => PostWidget(post)).toList();

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Container(
//         child: ListView(
//           children: [
//             Column(
//               children: containers,
//               mainAxisSize: MainAxisSize.min,
//             ),
//           ],
// =======
  @override
  Widget build(BuildContext context) {
    return Center(
        child: BlocProvider(
      create: (context) => LentaBloc(),
      child: LentaWraper(),
    ));
  }
}

class LentaWraper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    LentaBloc block = BlocProvider.of(context);
    return LentaWidget(block);
  }
}

class LentaWidget extends StatefulWidget {
  final block;

  LentaWidget(this.block);
  @override
  _LentaWidgetState createState() => _LentaWidgetState(block);
}

class _LentaWidgetState extends State<LentaWidget> {
  final _scrollController = ScrollController();
  final block;
  final _scrollThreshold = 100.0;

  _LentaWidgetState(this.block) {
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LentaBloc, LentaState>(builder: (context, state) {
      if (state is LentaUninitialized) {
        block.add(AddPosts());
        return WaitingWidget();
      }
      if (state is PostError) {
        //написать Виджет
        return Center(
          child: Text('failed to fetch posts'),
        );
      }
      if (state is LentaPostLoaded) {
        print("LentaPostLoaded");
        print(state.postStore.length);
        return Column(children: [
          //Дропдаун с тэгами
          MyDropDownList(block, state.allTegs),
          (state.postStore.length == 0)
              ?
              //написать Виджет
              Center(
                  child: Text('no posts'),
                )
              : Expanded(
                  child: new ListView.builder(
                  itemBuilder: (context, index) {
                    return (index >= state.postStore.length)
                        ? BottomLoader()
                        : PostWidget(state.postStore[index]);
                  },
                  itemCount: state.hasReachedMax
                      ? state.postStore.length
                      : state.postStore.length + 1,
                  controller: _scrollController,
                )),
        ]);
      }
    });
  }

  @override
  void dispose() {
    block.dispose();
    super.dispose();
  }

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    //print(maxScroll - currentScroll);
    if (maxScroll - currentScroll < 1.0) {
      print("Download");
      block.add(AddPosts());
    }
  }
}

class MyDropDownList extends StatefulWidget {
  final block;
  final List<Teg> items;
  MyDropDownList(this.block, this.items) {}

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState(block, items);
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<MyDropDownList> {
  final block;
  final List<Teg> items;
  String dropdownValue;

  _MyStatefulWidgetState(this.block, this.items) {
    this.dropdownValue = items[0].name;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: Icon(Icons.arrow_downward),
      iconSize: 24,
      style: TextStyle(color: Colors.deepPurple),
      onChanged: (String newValue) {
        items.firstWhere((e) => e.name == newValue).selected
            ? block.add(RemoveTeg(newValue))
            : block.add(AddTeg(newValue));
        setState(() {
          dropdownValue = newValue;
        });
      },
      items: this.items.map<DropdownMenuItem<String>>((Teg value) {
        return DropdownMenuItem<String>(
            value: value.name,
            child: Row(children: [
              Text(value.name),
              value.selected ? Icon(Icons.check) : Icon(Icons.cancel)
            ]));
      }).toList(),
    );
  }
}

class BottomLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Center(
        child: SizedBox(
          width: 33,
          height: 33,
          child: CircularProgressIndicator(
            strokeWidth: 1.5,
          ),
        ),
      ),
    );
  }
}
