import 'package:flutter/material.dart';

class TitleAdd extends StatelessWidget {
  final String? textTitle;
  final String? textSubTitle;
  final Widget? iconTitle;
  final Widget? iconSubTitle;
  final VoidCallback? function;
  final Color? color;

  const TitleAdd({
    Key? key,
    this.color,
    this.textTitle,
    this.textSubTitle,
    this.iconTitle,
    this.iconSubTitle,
    this.function,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: Colors.black,
            ),
            borderRadius: BorderRadius.circular(30)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                (iconTitle == null) ? Container() : iconTitle!,
                const SizedBox(
                  width: 10,
                ),
                Flexible(
                  child: Text(
                    textTitle ?? "",
                    style: TextStyle(
                      color: color,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                (iconSubTitle == null) ? Container() : iconSubTitle!,
                const SizedBox(
                  width: 10,
                ),
                Flexible(
                  child: Text(
                    textSubTitle ?? "",
                    style: TextStyle(
                      color: color,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
