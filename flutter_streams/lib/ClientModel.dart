import 'package:flutter_streams/DBProvider.dart';

class Client{
  bool statusOne;
  bool statusTwo;
  bool statusThree;
  bool statusFour;
  Client(
    this.statusOne,
    this.statusTwo,
    this.statusThree,
    this.statusFour,
  );
  
  void setStatusOne(bool status){
    this.statusOne = status;
    DBProvider.db.updateClient(this);
  }
  void setStatusTwo(bool status){
    this.statusTwo = status;
    DBProvider.db.updateClient(this);
  }
  void setStatusThree(bool status){
    this.statusThree = status;
    DBProvider.db.updateClient(this);
  }
  void setStatusFour(bool status){
    this.statusFour = status;
    DBProvider.db.updateClient(this);
  }

  
}