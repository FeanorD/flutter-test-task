import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:random_background_app/providers/color_gen_options_provider.dart';
import 'package:random_background_app/widgets/custom_color_range_picker.dart';

class SettingsScreen extends StatefulWidget {
  static const routeName = '/settings';

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  RangeValues _customColorRange;
  List<Color> _colors;
  ColorRangeType _selectedRangeType;

  @override
  void didChangeDependencies() {
    _selectedRangeType = Provider.of<ColorGenerationOptions>(context).rangeType;
    super.didChangeDependencies();
  }

  void _changeCustomColorRange(RangeValues values) {
    _customColorRange = values;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              var options = Provider.of<ColorGenerationOptions>(context, listen: false);
              options.setRangeType(_selectedRangeType);
              if (_selectedRangeType == ColorRangeType.custom) {
                options.setRange(_customColorRange);
              } else {
                options.setColorsList(_colors);
              }
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Color range',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            RadioListTile(
              title: Text('Only primary colors'),
              value: ColorRangeType.primary,
              groupValue: _selectedRangeType,
              onChanged: (ColorRangeType type) {
                setState(() {
                  _selectedRangeType = type;
                  _colors = Colors.primaries;
                });
              },
              controlAffinity: ListTileControlAffinity.trailing,
              subtitle: Row(
                children: List.generate(Colors.primaries.length, (index) => Container(
                  width: 7,
                  height: 8,
                  decoration: BoxDecoration(
                    color: Colors.primaries[index],
                  ),
                )),
              ),
            ),
            RadioListTile(
              title: Text('Only accent colors'),
              value: ColorRangeType.accents,
              groupValue: _selectedRangeType,
              onChanged: (ColorRangeType type) {
                setState(() {
                  _selectedRangeType = type;
                  _colors = Colors.accents;
                });
              },
              controlAffinity: ListTileControlAffinity.trailing,
              subtitle: Row(
                children: List.generate(Colors.accents.length, (index) => Container(
                  width: 7,
                  height: 8,
                  decoration: BoxDecoration(
                    color: Colors.accents[index],
                  ),
                )),
              ),
            ),
            RadioListTile(
              title: Text('Custom color range'),
              value: ColorRangeType.custom,
              groupValue: _selectedRangeType,
              onChanged: (ColorRangeType type) {
                setState(() {
                  _selectedRangeType = type;
                });
              },
              controlAffinity: ListTileControlAffinity.trailing,
              subtitle: Text('Select a range from all possible RGB colors'),
            ),
            if (_selectedRangeType == ColorRangeType.custom)
              CustomColorRangePicker(_changeCustomColorRange),
          ],
        ),
      ),
    );
  }
}
