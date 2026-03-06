import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

abstract class AppNavigation {
  static removeScreen(BuildContext context) {
    GoRouter.of(context).pop();
  }

  static navigateToNewScreen<T>({
    required BuildContext context,
    required String path,
    T? args,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? pathParameters,
  }) {
    context.pushNamed(
      path,
      extra: args,
      queryParameters: queryParameters ?? {},
      pathParameters: pathParameters ?? {},
    );
  }

  static replaceToNewScreen<T>({
    required BuildContext context,
    required String path,
    T? args,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? pathParameters,
  }) {
    context.pushReplacementNamed(
      path,
      extra: args,
      queryParameters: queryParameters ?? {},
      pathParameters: pathParameters ?? {},
    );
  }
}
