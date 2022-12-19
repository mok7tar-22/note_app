import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../controllers/date_base_cubit.dart';
import '../../../models/note.dart';
import '../task_item.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DateBaseCubit, DateBaseState>(
      builder: (context, state) {
        List<Note> notes=DateBaseCubit.instance.notes;
       if(state is AppGetDatabaseLoadingState){
         return const Center(child: CircularProgressIndicator.adaptive());
       }
        return Expanded(
          child: ListView.builder(
            itemCount: notes.length,
            itemBuilder: (context, index) {
            return TaskItem(note:notes[index],);
          },),
        );
      },
    );
  }
}


// import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
// //
//
// class NotesListView extends StatelessWidget {
//   bool isLoading=false;
//   NotesListView({
//     Key? key,
//   }) : super(key: key);
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: BlocConsumer<DateBaseCubit, DateBaseState>(
//   listener: (context, state) {
//      if(state is AppGetDatabaseLoadingState){
//        isLoading=true;
//      }else{
//        isLoading=false;
//      }
//   },
//   builder: (context, state) {
//     List<Note> note=DateBaseCubit.get(context).notes;
//     print(note.length);
//     return  ModalProgressHUD(
//       inAsyncCall: isLoading,
//       progressIndicator: const Center(child: CircularProgressIndicator.adaptive()),
//       child: ListView.builder(
//           itemCount: DateBaseCubit.get(context).notes.length,
//           itemBuilder: (context, index) {
//             return TaskItem(note: note[index],);
//           },
//         ),
//     );
//   },
// ),
//     );
//   }
// }
