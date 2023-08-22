import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mavental/src/network/model/common/error_code.dart';

class MResult<T> {
  MResult.exception(Object? e, {String? message}) {
    data = null;
    if (e is PlatformException) {
      error = e.message;
    } else if (e is AssertionError) {
      error = e.message?.toString();
    } else if (e is FlutterError) {
      error = e.message;
    }
    error ??= (message ?? MErrorCode.unknown);
  }
  MResult.error(String? error) {
    data = null;
    this.error = error ?? '';
  }
  MResult.success(this.data) {
    error = null;
  }

  T? data;
  String? error;
  bool get isError => error != null;
  bool get isSuccess => !isError;
}
