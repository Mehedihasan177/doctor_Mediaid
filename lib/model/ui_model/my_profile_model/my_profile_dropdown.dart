import 'package:flutter/material.dart';

class NewObject {
  final String title;

  NewObject(this.title);
}

   final List<NewObject> myProfileDropdown = <NewObject>[
    NewObject('12:00'),
    NewObject('20:00'),
  ];


class NewObject1 {
  final String title1;

  NewObject1(this.title1);
}

final List<NewObject1> myProfileDropdown1 = <NewObject1>[
  NewObject1('20:00'),
  NewObject1('10:00'),
];






class CheckBoxAny {
  String title;
  bool value;

  CheckBoxAny({
    required this.title,
    this.value = false,
  });
}
