import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class MenuDrawerCubit extends Cubit<GlobalKey<ScaffoldState>> {
  MenuDrawerCubit() : super(GlobalKey<ScaffoldState>());

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;

  void controlMenu() {
    if (!_scaffoldKey.currentState!.isDrawerOpen) {
      _scaffoldKey.currentState!.openDrawer();
    } else {
      _scaffoldKey.currentState!.closeDrawer();
    }
  }
}
