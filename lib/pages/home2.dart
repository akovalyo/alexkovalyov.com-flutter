import 'package:flutter/material.dart';

class HomePage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 300,
          child: PopupMenuButton(
            itemBuilder: (_) => <PopupMenuEntry<String>>[
              PopupMenuItem(
                child: Text('First'),
              ),
              PopupMenuItem(
                child: Text('Second'),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 300,
          child: DropdownButton(items: [
            DropdownMenuItem(value: "1", child: Text("1")),
            DropdownMenuItem(value: "2", child: Text("2")),
          ], onChanged: (value) {}),
        ),
        SizedBox(
          height: 300,
          child: Text(
            'Hello3',
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
        SizedBox(
          height: 300,
          child: Text(
            'Hello',
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
        SizedBox(
          height: 300,
          child: Text(
            'Hello',
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
      ],
    );
  }
}
