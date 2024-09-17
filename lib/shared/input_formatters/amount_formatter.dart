import 'dart:io';
import 'dart:math';

import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class AmountFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.isEmpty) return newValue;
    return newValue.copyWith(
        text: newValue.text.formattedNumber,
        selection: TextSelection.collapsed(
            offset: min(newValue.text.length, newValue.selection.end)));
  }
}

extension FormatNumber on String {
  String get formattedNumber {
    //  NumberFormat("#,##0.00", Platform.localeName);
    final number = num.tryParse(this);
    if (number == null) {
      return '';
    }
    double str = (number * 100).truncateToDouble() / 100;
    if (str.isNaN) {
      str = 0;
    }

    return NumberFormat.currency(locale: Platform.localeName).format(str);
  }
}
