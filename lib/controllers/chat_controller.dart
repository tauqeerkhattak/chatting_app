import 'package:flutter/material.dart' hide KeyboardListener;
import 'package:get/get.dart';
import 'package:keyboard_utils/keyboard_listener.dart';
import 'package:keyboard_utils/keyboard_utils.dart';

class ChatController extends GetxController {
  final ScrollController scrollController = ScrollController(
    initialScrollOffset: 0.0,
  );
  TextEditingController messageController = TextEditingController();
  Rx<bool> showEmojis = false.obs;
  Rx<double> keyboardHeight = 0.0.obs;
  final KeyboardUtils _keyboardUtils = KeyboardUtils();
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

  @override
  void onInit() {
    listener = _keyboardUtils.add(
      listener: KeyboardListener(
        willShowKeyboard: (height) {
          keyboardHeight.value = height;
          showEmojis.value = false;
        },
      ),
    );
    super.onInit();
  }

  @override
  void dispose() {
    _keyboardUtils.unsubscribeListener(subscribingId: listener);
    if (_keyboardUtils.canCallDispose()) {
      _keyboardUtils.dispose();
    }
    super.dispose();
  }
}
