import 'package:flutter/material.dart';

import 'package:date_time_picker/date_time_picker.dart';

class MyDatePicker extends StatefulWidget {
  const MyDatePicker({Key? key, required this.dateLabelText, required this.readOnly}) : super(key: key);

  final String dateLabelText;
  final bool readOnly;

  @override
  _MyDatePickerState createState() => _MyDatePickerState(dateLabelText);
}

class _MyDatePickerState extends State<MyDatePicker> {
  String _selectedDate;

  _MyDatePickerState(this._selectedDate);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 173,
      child: DateTimePicker(
        timeLabelText: widget.dateLabelText,
        readOnly: widget.readOnly,
        decoration:  InputDecoration(
          label: Text(widget.dateLabelText),
          prefixIcon: const Icon(Icons.date_range, ),
        ),
        dateMask: 'd/MM/yyyy',
        locale: const Locale("pt", "PT"),
        initialValue: '',
        type: DateTimePickerType.date,
        //dateLabelText: widget.dateLabelText,
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
        onSaved: (value) {
          if (value!.isNotEmpty) {
            _selectedDate = value;
          }
        },
      ),
    );
  }
}
