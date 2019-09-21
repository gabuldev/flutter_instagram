
import 'package:rxdart/rxdart.dart';

class HomeBloc{

  HomeBloc(){
    photoIn = photo.sink;
    photoOut = photo.stream;
  }

  var photo = BehaviorSubject<String>();
  Sink<String> photoIn;
  Observable<String> photoOut;

  dispose(){
    photo.close();
    photoIn.close();
  }

}