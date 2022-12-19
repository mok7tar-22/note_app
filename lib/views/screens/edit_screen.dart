import 'package:flutter/material.dart';
import '../../controllers/date_base_cubit.dart';
import '../../models/note.dart';
import '../widget/custom_text_field.dart';

class EditScreen extends StatefulWidget {
  Note note;

  EditScreen({required this.note,Key? key}) : super(key: key);

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  final GlobalKey<FormState> form = GlobalKey<FormState>();

  TextEditingController titleController = TextEditingController();
  bool isImportant = false;
  TextEditingController descriptionController = TextEditingController();

  @override
  @override
  Widget build(BuildContext context) {
    titleController.text = widget.note.title;
    descriptionController.text = widget.note.description;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Edit Screen",
            style: Theme.of(context).textTheme.headline5,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Form(
            key: form,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,

              children: [
                CustomTextField(controller: titleController, hint: "tittle"),
                const SizedBox(height: 24,),
                CustomTextField(
                  controller: descriptionController,
                  hint: "Description",
                  maxLines: 6,
                ),
                const SizedBox(height: 24,),
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
                ElevatedButton(
                    onPressed: () {
                      if(form.currentState!.validate()){
                        widget.note = Note(
                          title: titleController.text,
                          createdTime: widget.note.createdTime,
                          description: descriptionController.text,
                          isImportant: isImportant,
                          id: widget.note.id,
                        );
                        DateBaseCubit.get(context).update(widget.note);
                        Navigator.pop(context);
                      }

                    },
                    child: const Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Text(
                        "Save",
                        style: TextStyle(fontSize: 20),
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
