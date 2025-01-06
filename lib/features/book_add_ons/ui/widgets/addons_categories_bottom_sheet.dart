import 'package:flutter/material.dart';

import '../../../../app/models/select_option.dart';
import '../../../../app/widgets/icon_handler.dart';

class AddonCategoriesBottomSheet extends StatelessWidget {
  const AddonCategoriesBottomSheet({
    required this.options,
    required this.onSelect,
    this.selectedOption,
  });

  final List<SelectOption> options;
  final SelectOption? selectedOption;
  final Function(SelectOption)onSelect;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(width: 48),
                Spacer(),
                Container(
                  height: 3,
                  width: 56,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                Spacer(),
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: drawSvgIcon("circled_close"),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              "Select Section",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemCount: options.length,
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              separatorBuilder: (context, index) => Divider(color: Colors.grey[300]),
              itemBuilder: (context, index) =>
                  ListTile(
                    title: Text(options[index].label),
                    onTap: () {
                      onSelect(options[index]);
                      Navigator.pop(context);
                    },
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
