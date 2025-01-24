import 'dart:async';

import '../utils/package_export.dart';

extension RefExt<T> on Ref<T> {
  void refreshIn(Duration duration) {
    Timer(duration, () => invalidateSelf());
  }
}
