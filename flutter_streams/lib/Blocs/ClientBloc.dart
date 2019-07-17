import 'package:flutter_streams/BlocBase.dart';
import 'dart:async';

class UserBloc extends BlocBase{

  StreamController<int> notDone1Controller = StreamController<int>.broadcast();
  Stream<int> get outNotDone1 => notDone1Controller.stream;
  StreamSink<int> get sinkNotDone1 => notDone1Controller.sink;


  void dispose(){
    notDone1Controller.close();
  }
  
} 