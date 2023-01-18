import 'package:get/get.dart';

class Endex extends GetxController {
  final _index = 0.obs;
  final _isplaying = false.obs;
  // var endex = 0.obs;
  //.obs ko matlab k ho vanda ni
  //jaha pani hamro widger OBS vitra xa tyo afai build hunxa without setstate((){}) function.
  //cool xa ni hai.

  //getter
  int get index => _index.toInt();

  //setter
  set index(int newvalue) {
    index = newvalue;
    notifyChildrens();
  }
}
