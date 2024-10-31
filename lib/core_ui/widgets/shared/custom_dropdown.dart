import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';


class CustomDropdown extends StatefulWidget {
  const CustomDropdown({super.key});

  @override
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  String? selectedValue;
  final List<String> items = ['Opción 1', 'Opción 2', 'Opción 3', 'Opción 4'];

  @override
  Widget build(BuildContext context) {
    return DropdownButton2<String>(
      isExpanded: true,
      hint: Text(
        'Selecciona una opción',
        style: TextStyle(
          fontSize: 14,
          color: Theme.of(context).hintColor,
        ),
      ),
      items: items
          .map((item) => DropdownMenuItem<String>(
                value: item,
                child: Text(
                  item,
                  style:const TextStyle(
                    fontSize: 14,
                  ),
                ),
              ))
          .toList(),
      value: selectedValue,
      onChanged: (value) {
        setState(() {
          selectedValue = value as String;
        });
      },
  
    );
  }
}