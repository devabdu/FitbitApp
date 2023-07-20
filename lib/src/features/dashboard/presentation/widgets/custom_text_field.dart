import 'package:fitbit/src/core/utils/app_colors.dart';
import 'package:fitbit/src/core/utils/app_font.dart';
import 'package:flutter/material.dart';

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
          style: const TextStyle(fontSize: 14),
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
            height: 60,
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
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColors.lightPrimary,
                          style: BorderStyle.solid,
                        ),
                        //gradient: AppLinearGradientColors.mainColorButton,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(16)),
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
