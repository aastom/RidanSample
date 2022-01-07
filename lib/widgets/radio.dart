import 'package:flutter/material.dart';

class RadioWidget extends StatefulWidget {
  const RadioWidget({Key? key}) : super(key: key);

  @override
  _RadioWidgetState createState() => _RadioWidgetState();
}

class _RadioWidgetState extends State<RadioWidget> {
  int? _value = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: radioColourMethod(),
    );
  }

  Row radioColourMethod() {
    return Row(
      children: [
        Radio(
          toggleable: true,
          // title: const Text('Lafayette'),
          activeColor: Colors.white,
          value: 1,
          groupValue: _value,
          onChanged: (value) {
            setState(() {
              _value = value as int?;
            });
          },
        ),
        Radio(
          // title: const Text('Lafayette'),
          activeColor: Colors.grey[600],
          value: 2,
          groupValue: _value,
          onChanged: (value) {
            setState(() {
              _value = value as int?;
            });
          },
        ),
        Radio(
          // title: const Text('Lafayette'),
          activeColor: Colors.black,
          value: 3,
          groupValue: _value,
          onChanged: (value) {
            setState(() {
              _value = value as int?;
            });
          },
        ),
        Radio(
          // title: const Text('Lafayette'),
          activeColor: Colors.blue,
          value: 4,
          groupValue: _value,
          onChanged: (value) {
            setState(() {
              _value = value as int?;
            });
          },
        ),
      ],
    );
  }
}
