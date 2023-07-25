import 'package:fitbit/src/core/utils/app_colors.dart';
import 'package:fitbit/src/core/utils/app_font.dart';
import 'package:fitbit/src/core/utils/app_values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class CustomTextField extends StatefulWidget {
  final TextEditingController textEditingController;
  final String textSection;
  final void Function()? onTapTextField;
  final void Function(String)? onChangedTextField;
  bool _showChoices = false;
  final List<dynamic> choices;
  List<String?> selections;
  final void Function()? onTapGestureDetector;
  String? newItem = '';

  CustomTextField({
    super.key,
    required this.textEditingController,
    required this.textSection,
    this.onTapTextField,
    this.onChangedTextField,
    this.onTapGestureDetector,
    required this.choices,
    this.newItem,
    this.selections = const [],
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.textSection,
          style: TextStyle(fontSize: AppFontSize.s14),
        ),
        const Divider(
          thickness: 0,
          color: AppColors.transparent,
        ),
        TextField(
          controller: widget.textEditingController,
          keyboardType: TextInputType.text,
          decoration: const InputDecoration(),
          onTap: () => setState(() {
            widget._showChoices = !widget._showChoices;
          }),
          onChanged: widget.onChangedTextField,
        ),
        if (widget._showChoices)
          SizedBox(
            height: AppSize.s60.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.choices.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: widget.onTapGestureDetector ??
                      () => setState(() {
                            widget.textEditingController.text =
                                widget.choices[index].title;
                            widget._showChoices = false;
                            widget.selections.add(widget.choices[index].title);
                          }),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: AppPadding.p5.w,
                        vertical: AppPadding.p10.h),
                    child: Container(
                      padding: EdgeInsets.all(AppSize.s10.r),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColors.lightPrimary,
                          style: BorderStyle.solid,
                        ),
                        //gradient: AppLinearGradientColors.mainColorButton,
                        borderRadius:
                             BorderRadius.all(Radius.circular(AppSize.s16.r)),
                      ),
                      child: Text(
                        widget.choices[index].title,
                        style: const TextStyle(
                            color: AppColors.black,
                            fontWeight: AppFontWeight.medium),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
      ],
    );
  }
}
