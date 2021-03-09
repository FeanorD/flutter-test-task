import 'package:flutter/material.dart';

class CustomColorRangePicker extends StatefulWidget {
  CustomColorRangePicker(this.onRangeChange);

  final Function onRangeChange;

  @override
  _CustomColorRangePickerState createState() => _CustomColorRangePickerState();
}

class _CustomColorRangePickerState extends State<CustomColorRangePicker> {
  RangeValues _currentColorsRange = RangeValues(0xFF000000, 0xFFFFFFFF);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RangeSlider(
          values: _currentColorsRange,
          min: 0xFF000000,
          max: 0xFFFFFFFF,
          onChanged: (RangeValues values) {
            print(values);
            setState(() {
              _currentColorsRange = values;
            });
            widget.onRangeChange(_currentColorsRange);
          },
        ),
        SizedBox(height: 10,),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
            border: Border.all(),
          ),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  height: 150,
                  decoration: BoxDecoration(
                    color: Color(_currentColorsRange.start.round()),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 150,
                  decoration: BoxDecoration(
                    color: Color(_currentColorsRange.end.round()),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
