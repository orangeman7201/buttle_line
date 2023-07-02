import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CopyableText extends Text {
  const CopyableText(
    String data, {
    Key? key,
    TextStyle? style,
  }) : super(data, key: key, style: style);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Clipboard.setData(ClipboardData(text: data)),
      child: super.build(context),
    );
  }
}
