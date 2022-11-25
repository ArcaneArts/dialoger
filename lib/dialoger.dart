library dialoger;

import 'package:flutter/material.dart';

Future<T?> dialogText<T>({
  required BuildContext context,
  required String title,
  required String submitButtonText,
  required T? Function(BuildContext context, String text) onSubmit,
  String? description,
  String? hint,
  String? initialValue,
  int? maxLines,
  int? minLines,
  int? maxLength,
}) async =>
    showDialog(
      context: context,
      builder: (dcontext) {
        TextEditingController td =
            TextEditingController(text: initialValue ?? "");

        return AlertDialog(
          title: Text(title),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Visibility(
                visible: description != null,
                child: Text(description ?? ""),
              ),
              TextField(
                autofocus: true,
                onSubmitted: (f) =>
                    Navigator.pop(context, onSubmit(context, f)),
                keyboardType: TextInputType.text,
                controller: td,
                maxLines: maxLines,
                minLines: minLines,
                maxLength: maxLength,
                decoration: InputDecoration(hintText: hint),
              )
            ],
          ),
          actions: [
            TextButton(
              child: const Text(
                "Cancel",
              ),
              onPressed: () => Navigator.pop(dcontext),
            ),
            TextButton(
                child: Text(
                  submitButtonText,
                ),
                onPressed: () {
                  String s = td.value.text;
                  T? v = onSubmit(context, s);

                  try {
                    Navigator.pop(context, v);
                  } catch (e) {
                    try {
                      Navigator.pop(dcontext, v);
                    } catch (e) {
                      rethrow;
                    }
                  }
                }),
          ],
        );
      },
    );

Future<T?> dialogText2<T>(
        {required BuildContext context,
        required String title,
        required String submitButtonText,
        required T? Function(BuildContext context, String text, String text2)
            onSubmit,
        String? description,
        String? hint,
        String? hint2,
        String? initialValue,
        String? initialValue2,
        int? maxLines,
        int? minLines,
        int? maxLength,
        bool obscureSecond = false}) async =>
    showDialog(
      context: context,
      builder: (dcontext) {
        TextEditingController td =
            TextEditingController(text: initialValue ?? "");
        TextEditingController td2 =
            TextEditingController(text: initialValue2 ?? "");

        return AlertDialog(
          title: Text(title),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Visibility(
                visible: description != null,
                child: Text(description ?? ""),
              ),
              TextField(
                autofocus: true,
                keyboardType: TextInputType.text,
                controller: td,
                maxLines: maxLines,
                minLines: minLines,
                maxLength: maxLength,
                decoration: InputDecoration(hintText: hint),
              ),
              !obscureSecond
                  ? TextField(
                      autofocus: true,
                      keyboardType: TextInputType.text,
                      controller: td2,
                      maxLines: maxLines,
                      minLines: minLines,
                      maxLength: maxLength,
                      decoration: InputDecoration(hintText: hint2),
                    )
                  : TextField(
                      controller: td2,
                      obscureText: obscureSecond,
                      decoration: InputDecoration(hintText: hint2),
                    )
            ],
          ),
          actions: [
            TextButton(
              child: const Text(
                "Cancel",
              ),
              onPressed: () => Navigator.pop(context),
            ),
            TextButton(
                child: Text(
                  submitButtonText,
                ),
                onPressed: () => Navigator.pop(
                    context, onSubmit(context, td.value.text, td2.value.text))),
          ],
        );
      },
    );

Future<T?> dialogEmail<T>({
  required BuildContext context,
  required String title,
  required String submitButtonText,
  required T? Function(BuildContext context, String text) onSubmit,
  String? description,
  String? hint,
  String? initialValue,
  int? maxLines,
  int? minLines,
  int? maxLength,
}) async =>
    showDialog(
      context: context,
      builder: (dcontext) {
        TextEditingController td =
            TextEditingController(text: initialValue ?? "");

        return AlertDialog(
          title: Text(title),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Visibility(
                visible: description != null,
                child: Text(description ?? ""),
              ),
              TextField(
                autofocus: true,
                onSubmitted: (f) =>
                    Navigator.pop(context, onSubmit(context, f)),
                keyboardType: TextInputType.text,
                controller: td,
                maxLines: maxLines,
                minLines: minLines,
                maxLength: maxLength,
                decoration: InputDecoration(hintText: hint),
              )
            ],
          ),
          actions: [
            TextButton(
              child: const Text(
                "Cancel",
              ),
              onPressed: () => Navigator.pop(context),
            ),
            TextButton(
                child: Text(
                  submitButtonText,
                ),
                onPressed: () =>
                    Navigator.pop(context, onSubmit(context, td.value.text))),
          ],
        );
      },
    );

Future<T?> dialogConfirm<T>(
        {required BuildContext context,
        required String title,
        required String description,
        Widget? descriptionWidget,
        bool cancelButton = true,
        required String confirmButtonText,
        String? cancelButtonText,
        required T? Function(BuildContext context) onConfirm,
        T? Function(BuildContext context)? onCancel}) async =>
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text(title),
              content: descriptionWidget ?? Text(description),
              actions: [
                cancelButton
                    ? TextButton(
                        child: Text(
                          cancelButtonText ?? "Cancel",
                        ),
                        onPressed: () =>
                            Navigator.pop(context, onCancel?.call(context)),
                      )
                    : Container(),
                TextButton(
                    child: Text(
                      confirmButtonText,
                    ),
                    onPressed: () =>
                        Navigator.pop(context, onConfirm(context))),
              ],
            ));
