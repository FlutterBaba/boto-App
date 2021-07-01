import 'package:flutter/material.dart';

class TypeField extends StatefulWidget {
  final String labelText;
  final String hintText;
  final List<String> list;

  TypeField(
      {required this.labelText, required this.hintText, required this.list});

  @override
  _TypeFieldState createState() => _TypeFieldState();
}

class _TypeFieldState extends State<TypeField> {
  var currentSelectedValue;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12),
      child: FormField<String>(
        builder: (FormFieldState<String> state) {
          return InputDecorator(
            decoration: InputDecoration(
              labelText: widget.labelText,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                hint: Text(widget.hintText),
                value: currentSelectedValue,
                isDense: true,
                onChanged: (newValue) {
                  setState(() {
                    currentSelectedValue = newValue;
                  });
                  print(currentSelectedValue);
                },
                items: widget.list.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
          );
        },
      ),
    );
  }
}
