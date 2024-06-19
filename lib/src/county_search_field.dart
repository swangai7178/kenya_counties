import 'package:flutter/material.dart';
import 'package:kenya_counties/kenya_counties.dart';

class CountySearchField extends StatefulWidget {
  final void Function(Map<String, dynamic> selectedCounty)? onCountySelected;

  const CountySearchField({super.key, this.onCountySelected});

  @override
  _CountySearchFieldState createState() => _CountySearchFieldState();
}

class _CountySearchFieldState extends State<CountySearchField> {
  final List<Map<String, dynamic>> _filteredCounties = counties;
  Map<String, dynamic>? _selectedCounty;

  void _showCountyPicker(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return AlertDialog(
              title: const Text('Select a County'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 8),
                  Expanded(
                    child: ListView.builder(
                      itemCount: _filteredCounties.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(_filteredCounties[index]['name']),
                          onTap: () {
                            setState(() {
                              _selectedCounty = _filteredCounties[index];
                            });
                            Navigator.of(context).pop();
                            if (widget.onCountySelected != null) {
                              widget.onCountySelected!(_selectedCounty!);
                            }
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            _showCountyPicker(context);
          },
          child: const Text('Select County'),
        ),
      ],
    );
  }
}
