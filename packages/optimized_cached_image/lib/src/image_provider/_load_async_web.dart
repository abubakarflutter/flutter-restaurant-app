import 'dart:async';
import 'dart:ui' as ui;

import 'package:flutter/rendering.dart';

import '../../optimized_cached_image.dart';

/// Method to load html images using the webOnlyInstantiateImageCodecFromUrl.
/// This method is not recognized by the flutter analyzer.
Future<ui.Codec> loadAsyncHtmlImage(
  OptimizedCacheImageProvider key,
  StreamController<ImageChunkEvent> chunkEvents,
  DecoderCallback decode,
) {
  final Uri resolved = Uri.base.resolve(key.url);
  // ignore: undefined_function
  final Future<ui.Codec> uiCode = ui.webOnlyInstantiateImageCodecFromUrl(
    resolved,
    chunkCallback: (int bytes, int total) {
      chunkEvents.add(
        ImageChunkEvent(
          cumulativeBytesLoaded: bytes,
          expectedTotalBytes: total,
        ),
      );
    },
  );
  return uiCode;
}
