import 'package:flutter/material.dart';
import 'package:stock_app/core/constants/app_icons.dart';
import 'package:stock_app/core/constants/palletes.dart';
import 'package:stock_app/core/constants/styles.dart';

class CustomTextFieldWidget extends StatefulWidget {
  final bool isLoading;
  final VoidCallback onTap;
  final TextEditingController textEditingController;

  const CustomTextFieldWidget({
    super.key,
    required this.textEditingController,
    required this.isLoading,
    required this.onTap,
  });

  @override
  State<CustomTextFieldWidget> createState() => _CustomTextFieldWidgetState();
}

class _CustomTextFieldWidgetState extends State<CustomTextFieldWidget> {
  bool isTextFieldEmpty = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.dark
            ? Palletes.blackColor
            : Palletes.whiteColor,
        boxShadow: [
          BoxShadow(
            color: Palletes.greyColor.withOpacity(0.2),
            spreadRadius: 3,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
              ),
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  maxHeight: 200.0,
                ),
                child: TextField(
                  onChanged: (text) {
                    if (text.isEmpty) {
                      setState(() {
                        isTextFieldEmpty = true;
                      });
                    } else {
                      setState(() {
                        isTextFieldEmpty = false;
                      });
                    }
                  },
                  maxLines: null,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintStyle: Styles.lightStyle,
                    hintText: "Enter a question related to stocks...",
                  ),
                  cursorColor: Palletes.secondaryColor,
                  style: Styles.regulerStyle,
                  controller: widget.textEditingController,
                ),
              ),
            ),
          ),
          (widget.isLoading)
              ? const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator()),
                )
              : Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: GestureDetector(
                    onTap: () {
                      if (widget.textEditingController.value.text.isNotEmpty) {
                        widget.onTap.call();
                      }
                      setState(() {
                        isTextFieldEmpty = true;
                      });
                      widget.textEditingController.clear();
                      FocusScope.of(context).unfocus();
                    },
                    child: AppIcons.shareIcon,
                  ),
                ),
        ],
      ),
    );
  }
}
