import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final int maxLines;
  final String label;
  final ValueChanged<String> onChanged;
  final TextInputType textInputType;
  final TextEditingController controller;

  const TextFieldWidget(
      {Key? key,
      this.maxLines = 1,
      required this.label,
      required this.onChanged,
      required this.controller,
      this.textInputType = TextInputType.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: controller,
            keyboardType: textInputType,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            maxLines: maxLines,
          ),
        ],
      );
}
