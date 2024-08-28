import 'package:intl/intl.dart';

class CurrencyFormatter {
  static String convertToIdr(dynamic number, int decimalDigit,
      {bool? withoutSymbol, bool useDotAfterSymbol = false}) {
    try {
      NumberFormat currencyFormatter = NumberFormat.currency(
        locale: 'id',
        symbol: (withoutSymbol ?? false) == true
            ? ''
            : useDotAfterSymbol
                ? 'Rp. '
                : 'Rp ',
        decimalDigits: decimalDigit,
      );
      return currencyFormatter.format(number);
    } catch (e) {
      return '';
    }
  }
}