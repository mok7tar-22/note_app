import 'package:flutter/material.dart';

import '../../screens/search_screen.dart';


class MyAppBar extends StatelessWidget {
  const MyAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Notes App",style: Theme.of(context).textTheme.headline5,),
        Container(
          decoration: BoxDecoration(
              color: Colors.black45,
              borderRadius:BorderRadius.circular(16)
          ),
          child: IconButton(
            icon: const Icon(Icons.search,color: Colors.white,size: 30,),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>const SearchScreen()));// const SearchScreen()));
            },
          ),
        )
      ],
    );
  }
}