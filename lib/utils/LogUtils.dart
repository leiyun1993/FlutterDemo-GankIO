
class LogUtils{

  static const _LOG = true;

  static void log(Object msg){
    if(_LOG){
      print(msg);
    }
  }
}