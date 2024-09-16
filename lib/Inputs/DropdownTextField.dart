import 'package:tf_custom_widgets/utils/WidgetUtils.dart';
import 'package:flutter/material.dart';
import 'package:tf_custom_widgets/widgets/MyText.dart';
import 'custom_dropDown/CustomDropDown.dart';

class DropdownTextField<T> extends StatelessWidget {
  final dynamic data;
  final GlobalKey? dropKey;
  final String title;
  final String? label;
  final String? hint;
  final String? searchHint;
  final T? selectedItem;
  final Widget? prefixIcon;
  final bool showSelectedItem;
  final EdgeInsets? margin;
  final double? fontSize;
  final double? labelSize;
  final double? textSize;
  final String Function(T item) itemAsString;
  final String? Function(dynamic) validate;
  final ValueChanged<T?>? onChange;
  final Future<List<T>> Function(String text)? onFind;
  final EdgeInsets? arrowBtnPadding;
  final EdgeInsets? clearBtnPadding;
  final EdgeInsets? contentPadding;
  final bool useName;
  final bool showClearButton;
  final Color? enableColor;
  final Color? fillColor;
  final Color? hintColor;
  final Color? buttonsColor;
  final BorderRadius? radius;
  final DropdownSearchPopupItemBuilder<T>? itemBuilder;

  const DropdownTextField(
      {Key? key,
      this.label,
      this.hint,
      this.margin,
      required this.validate,
      required this.title,
      this.contentPadding,
      this.prefixIcon,
      this.clearBtnPadding,
      this.arrowBtnPadding,
      this.useName = true,
      this.showClearButton = true,
      this.searchHint,
      required this.itemAsString,
      this.onChange,
      this.fontSize,
      this.textSize,
      this.labelSize,
      this.hintColor,
      this.fillColor,
      this.buttonsColor,
      this.itemBuilder,
      this.onFind,
      this.dropKey,
      this.data,
      this.enableColor,
      this.selectedItem,
      this.radius,
      this.showSelectedItem = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownSearch<T>(
      key: dropKey,
      mode: Mode.BOTTOM_SHEET,
      isFilteredOnline: false,
      maxHeight: 350,
      label: label,
      items: data ?? [],
      onFind: onFind,
      validator: validate,
      onChanged: onChange,
      showSearchBox: true,
      showClearButton: showClearButton,
      popupItemBuilder: itemBuilder,
      clearButton: Padding(
        padding: clearBtnPadding ?? const EdgeInsets.symmetric(horizontal: 5),
        child: Icon(Icons.clear, size: 20, color: buttonsColor ?? Colors.black),
      ),
      dropDownButton: Padding(
        padding: arrowBtnPadding ?? const EdgeInsets.symmetric(horizontal: 5),
        child: Icon(Icons.arrow_drop_down,
            size: 24, color: buttonsColor ?? Colors.black),
      ),
      selectedItem: selectedItem,
      itemAsString: itemAsString,
      showSelectedItem: showSelectedItem,
      style: WidgetUtils.textStyle
          .copyWith(fontSize: textSize ?? WidgetUtils.textStyle.fontSize),
      itemStyle: WidgetUtils.textStyle
          .copyWith(fontSize: textSize ?? WidgetUtils.textStyle.fontSize),
      searchBoxStyle: WidgetUtils.textStyle,
      searchBoxDecoration: WidgetUtils.setInputDecoration(
          hint: searchHint ?? "بحث",
          enableColor: Colors.black,
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10)),
      popupTitle: Container(
        height: 50,
        decoration: BoxDecoration(
          color: WidgetUtils.primaryColor,
        ),
        child: Center(
          child: MyText(
            title: label != null ? label! : hint ?? "",
            size: 16,
            color: Colors.white,
          ),
        ),
      ),
      dropdownSearchDecoration: WidgetUtils.setInputDecoration(
        hintColor: hintColor,
        label: label,
        hint: hint,
        fillColor: fillColor,
        enableColor: enableColor,
        radius: radius,
        hintSize: labelSize,
        prefixIcon: prefixIcon,
        padding: contentPadding ??
            EdgeInsets.symmetric(horizontal: 10, vertical: 12),
      ),
    );
  }
}
