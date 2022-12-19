import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../controllers/date_base_cubit.dart';
import '../../models/note.dart';
import '../screens/edit_screen.dart';
import 'alert_dialog.dart';

class TaskItem extends StatelessWidget {
  final Note note;

  const TaskItem({required this.note,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.only(top: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: note.isImportant?const Color(0xffFFCC80):Colors.green,
      ),
      child: Column(
        children: [
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  EditScreen(note: this.note,),),
              );
            },

            title: Text(
              note.title,
              style: Theme.of(context)
                  .textTheme
                  .headline5!
                  .copyWith(color: Colors.black),
            ),
            subtitle:  Padding(
              padding: const EdgeInsets.only(top: 8),
              child:Text(
                note.description,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.black38,
                ),
              ),
            ),
            trailing: IconButton(
              icon: const Icon(
                Icons.delete,
                color: Colors.black,
                size: 30,
              ),
              onPressed: () {
          showMyDialog(context, (){
             DateBaseCubit.get(context).delete(note.id!).then((value) {
               Navigator.pop(context);
             });

          });


              },
            ),
          ),
          Align(
              alignment: Alignment.bottomRight,
           // //  DateFormat.yMMMd().format(note.createdTime),
              child: Text(
    DateFormat.yMMMd().format(note.createdTime),
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.black38,
                ),
              ))
        ],
      ),
    );
  }

}
