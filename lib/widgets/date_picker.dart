import 'package:flutter/material.dart';

import 'package:date_time_picker/date_time_picker.dart';

class MyDatePicker extends StatefulWidget {
  const MyDatePicker({Key? key, required this.dateLabelText}) : super(key: key);

  final String dateLabelText;

  @override
  _MyDatePickerState createState() => _MyDatePickerState(dateLabelText);
}

class _MyDatePickerState extends State<MyDatePicker> {
  String _selectedDate;

  _MyDatePickerState(this._selectedDate);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        width: 170,
        child: DateTimePicker(
           dateMask: 'd/MM/yyyy',
           //icon: Icon(Icons.date_range),
           locale: const Locale("pt", "PT"),
           initialValue: '',
           type: DateTimePickerType.date,
           dateLabelText: widget.dateLabelText,
           firstDate: DateTime(1900),
           lastDate: DateTime.now().add(const Duration(days: 365)),
           validator: (value) {
             return null;
           },
           onChanged: (value) {
             if (value.isNotEmpty) {
               setState(() {
                 _selectedDate = value;
               });
             }
           },
           // We can also use onSaved
           onSaved: (value) {
             if (value!.isNotEmpty) {
               _selectedDate = value!;
             }
           },
         ),
      ),
    );
  }
}
