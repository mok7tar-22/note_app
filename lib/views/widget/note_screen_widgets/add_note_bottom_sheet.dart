import 'package:flutter/material.dart';

import '../../../controllers/date_base_cubit.dart';
import '../../../models/note.dart';
import '../custom_text_field.dart';

class AddNoteBottomSheet extends StatefulWidget {
  const AddNoteBottomSheet({Key? key}) : super(key: key);

  @override
  State<AddNoteBottomSheet> createState() => _AddNoteBottomSheetState();
}

class _AddNoteBottomSheetState extends State<AddNoteBottomSheet> {
  late TextEditingController titleController;

  late TextEditingController descriptionController;
  bool isImportant = false;
  final GlobalKey<FormState> form = GlobalKey<FormState>();

  void initState() {
    // TODO: implement initState
    super.initState();
    titleController = TextEditingController();
    descriptionController = TextEditingController();
  }

  @override
  void dispose() {
    titleController = TextEditingController();
    descriptionController = TextEditingController();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30).add(
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom)),
      child: Form(
        key: form,
        child: Column(children: [
          CustomTextField(controller: titleController, hint: "tittle"),
          const SizedBox(
            height: 24,
          ),
          CustomTextField(
              controller: descriptionController,
              hint: "Description",
              maxLines: 6),
          const SizedBox(
            height: 24,
          ),
          Row(
            children: [
              const Text("Is Important "),
              Checkbox(
                checkColor: Colors.black54,
                value: isImportant,
                onChanged: (bool? value) {
                  isImportant=value!;
                  setState(() {
                  });
                },
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                  onPressed: () async {
                    if (form.currentState!.validate()) {
                      Note note = Note(
                        title: titleController.text,
                        createdTime: DateTime.now(),
                        description: descriptionController.text,
                        isImportant: isImportant,
                      );
                      await DateBaseCubit.get(context)
                          .insert(note)
                          .then((value) {
                        Navigator.pop(context);
                      });
                    }
                  },
                  child: Text("Save")),
              const SizedBox(
                width: 12,
              ),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "Cancel",
                    style: TextStyle(color: Colors.red),
                  ))
            ],
          )
        ]),
      ),
    ));
  }
}


