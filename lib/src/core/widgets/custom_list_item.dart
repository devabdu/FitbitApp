import 'package:fitbit/src/core/utils/resources/app_colors.dart';
import 'package:fitbit/src/core/utils/resources/app_icons.dart';
import 'package:fitbit/src/core/utils/resources/app_values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ListItemWidget extends StatefulWidget {
  final String itemData;
  final Widget showDropDownAndDeleteIcons;
  final Widget showDataOfExercie;
  final bool isDropdownVisible;

  const ListItemWidget(this.itemData,
      {super.key,
      required this.showDataOfExercie,
      required this.showDropDownAndDeleteIcons,
      this.isDropdownVisible = false});

  @override
  State<ListItemWidget> createState() => _ListItemWidgetState();
}

class _ListItemWidgetState extends State<ListItemWidget> {
  bool isPressedAdd = false;

  void toggleAdd() {
    setState(() {
      isPressedAdd = !isPressedAdd;
    });
  }

  final List<int> sets = [1, 2, 3];
  final List<int> reps = [12, 10, 8];
  final List<double> weights = [15, 17.5, 20];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(
            widget.itemData,
            style: const TextStyle(color: AppColors.black),
          ),
          trailing: SizedBox(
            width: AppSize.s150.w,
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(AppIcons.add),
                  onPressed: toggleAdd,
                ),
                if (isPressedAdd) widget.showDropDownAndDeleteIcons,
              ],
            ),
          ),
        ),
        if (widget.isDropdownVisible) widget.showDataOfExercie,
      ],
    );
  }
}
