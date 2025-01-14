import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  final Widget content;
  final Widget title;
  final Color firstColor;
  final Color secondColor;
  final Widget headerIcon;

  CustomDialog({
    required this.content,
    required this.title,
    required this.firstColor,
    required this.secondColor,
    required this.headerIcon,
  });
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      elevation: 8,
      backgroundColor: Colors.transparent,
      child: buildChild(context),
    );
  }

  buildChild(BuildContext context) => Container(
    height: 450,
    width: 350,
    decoration: BoxDecoration(
      color: firstColor,
      borderRadius: BorderRadius.circular(20.0),
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 6.0, 6.0, 0),
          child: Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: const Icon(
                  Icons.close,
                  color: Colors.white,
                  size: 25.0,
                ),
                onPressed: () => Navigator.pop(context),
              )),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: headerIcon,
        ),
        Expanded(
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
                color: secondColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15.0),
                  topRight: Radius.circular(15.0),
                  bottomLeft: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0),
                )),
            child: FittedBox(
              fit: BoxFit.contain,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  title,
                  content,
                ],
              ),
            ),
          ),
        )
      ],
    ),
  );
}

/*
class DialogHelper {
  static exit(context) =>
      showDialog(context: context, builder: (context) => CustomDialog());
}*/
