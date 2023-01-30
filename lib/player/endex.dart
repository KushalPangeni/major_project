import 'package:get/get.dart';

class Endex extends GetxController {
  var endex = 0.obs;
  // final changed = true;
  // final _isplaying = false.obs;
  // var endex = 0.obs;
  //.obs ko matlab k ho vanda ni
  //jaha pani hamro widget OBS vitra xa tyo afai build hunxa without setstate((){}) function.
  //cool xa ni hai.

  //getter
  int get index => endex.toInt();

  //setter
  set index(int newvalue) {
    index = newvalue;
    notifyChildrens();
  }

  Endex(RxInt value) {
    endex = value;
  }
}
