import 'package:flutter/material.dart';

import '../../controllers/date_base_cubit.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(

      onChanged: (value) {
        DateBaseCubit.get(context).search(value);
      },
      style: const TextStyle(color: Colors.black),
      decoration: InputDecoration(

        fillColor: Colors.white,
        prefixIcon: const Icon(
          Icons.search,
          color: Colors.grey,
        ),
        //controller.searchTextController.text.isNotEmpty
        suffixIcon: const Icon(Icons.search)
        ,
        hintText: "Search Note",
        hintStyle: const TextStyle(
          color: Colors.black45,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(10),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}