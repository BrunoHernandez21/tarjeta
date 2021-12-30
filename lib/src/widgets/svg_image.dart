import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

// ignore: avoid_web_libraries_in_flutter
import 'dart:html';
import 'dart:ui' as ui;

class ImageSvgWeb extends HookWidget {
  final String url;
  final int height;
  final int width;
  final BoxFit? fit;

  const ImageSvgWeb(
      {Key? key,
      required this.url,
      required this.height,
      required this.width,
      this.fit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final id = useMemoized(() => UniqueKey().toString());

    useEffect(() {
      ui.platformViewRegistry.registerViewFactory('img-svg-$id', (int viewId) {
        final element = ImageElement(
          src: url,
          height: height,
          width: width,
        );
        return element;
      });
      return () {};
    }, const []);

    return HtmlElementView(
      viewType: 'img-svg-$id',
    );
  }
}
