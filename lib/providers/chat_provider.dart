import 'dart:developer';

import 'package:flutter/material.dart' hide KeyboardListener;
import 'package:keyboard_utils/keyboard_listener.dart';
import 'package:keyboard_utils/keyboard_utils.dart';

class ChatProvider extends ChangeNotifier {
  final ScrollController scrollController = ScrollController(
    initialScrollOffset: 0.0,
  );
  TextEditingController messageController = TextEditingController();
  bool showEmojis = false;
  double keyboardHeight = 0.0;
  final KeyboardUtils keyboardUtils = KeyboardUtils();
  final List<String> dummyText = [
    'Lorem ipsum dolor sit amet, consectetuer adipiscing elit.',
    'Aliquam tincidunt mauris eu risus.',
    'Vestibulum auctor dapibus neque.',
    'Nunc dignissim risus id metus.',
    'Cras ornare tristique elit.',
    'Vivamus vestibulum ntulla nec ante.',
    'Praesent placerat risus quis eros.',
    'Fusce pellentesque suscipit nibh.',
    'Integer vitae libero ac risus egestas placerat.',
  ];
  int? listener;
  

  void toggle(BuildContext context) {
    log('emoji');
    showEmojis = !showEmojis;
    FocusScope.of(context).unfocus();
    notifyListeners();
  }

  @override
  void dispose() {
    keyboardUtils.unsubscribeListener(subscribingId: listener);
    if (keyboardUtils.canCallDispose()) {
      keyboardUtils.dispose();
    }
    super.dispose();
  }
}
