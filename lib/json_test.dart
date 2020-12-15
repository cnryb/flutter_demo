import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class JsonTestWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _JsonTestState();
  }
}

class Person {
  String name;
  int age;

  Person({this.name, this.age});

  factory Person.fromJson(dynamic obj) {
    return Person(name: obj["name"], age: obj["age"]);
  }

  dynamic toJson() {
    return {
      'name': name,
      'age': age,
    };
  }
}

class _JsonTestState extends State<JsonTestWidget> {
  String str = "";

  @override
  void initState() {
    Person t = Person(age: 1, name: "n");
    // str = json.encode(t.toJson());
    str = jsonEncode(t);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("json 测试"),
      ),
      body: Column(
        children: [
          Text(str),
          TextField(
            controller:
                TextEditingController.fromValue(TextEditingValue(text: str)),
            onChanged: (value) {
              setState(() {
                dynamic obj = jsonDecode(value);
                var p = Person.fromJson(obj);
                str = jsonEncode(p);
              });
            },
          )
        ],
      ),
    );
  }
}
