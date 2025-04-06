import 'package:flutter/material.dart';
import 'package:kenya_counties/kenya_counties.dart';

/// A widget that provides a searchable dropdown for selecting a county in Kenya.
///
/// Displays a text field that allows users to type and filter from a list of Kenyan counties.
/// The selected county is returned via a callback.
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
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              title: const Text(
                'Select a County',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              content: SizedBox(
                height: 400,
                child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Search County',
                        prefixIcon: const Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {
                          _filteredCounties.clear();
                          _filteredCounties.addAll(
                            counties.where((county) => county['name']
                                .toLowerCase()
                                .contains(value.toLowerCase())),
                          );
                        });
                      },
                    ),
                    const SizedBox(height: 16),
                    Expanded(
                      child: ListView.builder(
                        itemCount: _filteredCounties.length,
                        itemBuilder: (context, index) {
                          return Card(
                            margin: const EdgeInsets.symmetric(vertical: 4),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: ListTile(
                              title: Text(
                                _filteredCounties[index]['name'],
                                style: const TextStyle(fontSize: 16),
                              ),
                              onTap: () {
                                setState(() {
                                  _selectedCounty = _filteredCounties[index];
                                });
                                Navigator.of(context).pop();
                                if (widget.onCountySelected != null) {
                                  widget.onCountySelected!(_selectedCounty!);
                                }
                              },
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
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
