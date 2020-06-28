//import 'dart:math';

class UserData {
  Map<String, User> loginDB = Map();

  UserData() {
    loginDB['admin'] = User();
    loginDB['admin'].setPw('admin');

  }
}

class User {
  //make username and password private
  String _userName;
  String _password;

  void setPw(String pw){
    this._password=pw;
  }
  String getPw(){
    return _password;
  }
}
