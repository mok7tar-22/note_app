import 'package:flutter/material.dart';
import '../widget/note_screen_widgets/add_note_bottom_sheet.dart';
import '../widget/note_screen_widgets/my_app_bar.dart';
import '../widget/note_screen_widgets/notes_list_view.dart';

class NoteScreen extends StatelessWidget {
  const NoteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              isDismissible: false,
              enableDrag: false,
              context: context,
              builder: (context) {
                return const AddNoteBottomSheet();
              },
            );
          },
          child: const Icon(
            Icons.add,
            size: 30,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: const [
              MyAppBar(),
              NotesListView(),
            ],
          ),
        ),
      ),
    );
  }
}
