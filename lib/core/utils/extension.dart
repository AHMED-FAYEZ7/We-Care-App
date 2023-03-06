// ignore_for_file: constant_identifier_names, non_constant_identifier_names

const String EMPTY = "";
const int ZERO = 0;

extension NonNullString on String? {
  String orEmpty() {
    if (this == null) {
      return EMPTY;
    } else {
      return this!;
    }
  }
}

extension NonNullInt on int? {
  int orZero() {
    if (this == null) {
      return ZERO;
    } else {
      return this!;
    }
  }
}

List<String> EMPTY_LIST = [];

extension NonNullList on List<String>? {
  List<String> orEmptyList() {
    if (this == null) {
      return EMPTY_LIST;
    } else {
      return this!;
    }
  }
}

bool FALSE = false;

extension NonNullboll on bool? {
  bool orFalse() {
    if (this == null) {
      return FALSE;
    } else {
      return this!;
    }
  }
}
