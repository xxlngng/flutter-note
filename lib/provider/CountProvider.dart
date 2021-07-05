import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';

class CountProvider extends ChangeNotifier {
  int _count = 0;

  get count => _count;

  void add() {
    _count++;
    notifyListeners(); // 通知组件更新
  }
}

