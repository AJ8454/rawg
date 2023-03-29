import 'package:rawg/src/core/responsive/app_responsive.dart';
import 'package:flutter/material.dart';

class CustomDropDownWidget extends StatefulWidget {
  final List? dropMenuList;
  final String? labelText;
  final Function? selectedReturnValue;
  final String? hintText;

  const CustomDropDownWidget({
    Key? key,
    required this.dropMenuList,
    required this.labelText,
    this.hintText = "",
    required this.selectedReturnValue,
  }) : super(key: key);

  @override
  State<CustomDropDownWidget> createState() => _DropDownWidgetState();
}

class _DropDownWidgetState extends State<CustomDropDownWidget> {
  List? notify;

  String? selectedMenuItem;

  @override
  void initState() {
    notify = widget.dropMenuList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InputDecorator(
      decoration: InputDecoration(
        labelText: widget.labelText,
        labelStyle: AppResponsive.responsiveTextStyle(context),
        hintStyle: AppResponsive.responsiveTextStyle(context),
        border: OutlineInputBorder(
          borderSide:
              BorderSide(width: 1, color: Theme.of(context).primaryColor),
          borderRadius: BorderRadius.circular(AppResponsive.kBorderRadius),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppResponsive.kBorderRadius),
          borderSide: const BorderSide(width: 1, color: Colors.grey),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppResponsive.kBorderRadius),
          borderSide:
              BorderSide(width: 1, color: Theme.of(context).primaryColor),
        ),
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 18),
      ),
      child: DropdownButtonHideUnderline(
        child: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: Theme.of(context).scaffoldBackgroundColor,
          ),
          child: DropdownButton(
            iconSize: 25,
            icon: const Icon(
              Icons.keyboard_arrow_down_outlined,
            ),
            iconEnabledColor: Theme.of(context).primaryColor,
            iconDisabledColor: Theme.of(context).primaryColor,
            isExpanded: true,
            style: AppResponsive.responsiveTextStyle(context),
            hint: Text(
              widget.hintText!,
              style: AppResponsive.responsiveTextStyle(context),
            ),
            items: notify!.map((item) {
              return DropdownMenuItem(
                value: item,
                child: Text(item),
              );
            }).toList(),
            onChanged: (newValue) {
              setState(() => selectedMenuItem = newValue.toString());
              widget.selectedReturnValue!(selectedMenuItem);
            },
            value: selectedMenuItem,
          ),
        ),
      ),
    );
  }
}
