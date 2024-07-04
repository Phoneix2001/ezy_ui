import 'package:animated_custom_dropdown/custom_dropdown.dart' ;
import 'package:flutter/material.dart';

class AttributeDropdown<T> extends StatelessWidget {
  final void Function(T?)? onChanged;
  final List<T> list;
  final T? value;
  final String label;
  final String? hint;
  const AttributeDropdown({
    super.key,
    this.onChanged,
    required this.list,
    this.value, required this.label,  this.hint,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Text(label,textAlign: TextAlign.start,),
          const SizedBox(
            height: 10,
          ),
          CustomDropdown<T>(
            hintText: hint,
            items: list,
            onChanged: onChanged,
            initialItem: value,
            decoration: CustomDropdownDecoration(
                closedFillColor: Colors.deepPurple.shade100),
          ),
        ],
      ),
    );
  }
}
