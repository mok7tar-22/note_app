import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../controllers/date_base_cubit.dart';
import '../../models/note.dart';
import '../widget/search_text_field.dart';
import '../widget/task_item.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Search Screen",
            style: Theme.of(context).textTheme.headline5,
          ),
        ),
        body: BlocBuilder<DateBaseCubit, DateBaseState>(
          builder: (context, state) {
            List<Note> note = DateBaseCubit.get(context).searchNotes;
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const SearchTextField(),
                  Expanded(
                      child: ListView.builder(
                        itemCount: DateBaseCubit.get(context).searchNotes.length,
                        itemBuilder: (context, index) {
                          return note.length > 0
                              ? TaskItem(note: note[index])
                              : Container();
                        },
                      ))
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}


