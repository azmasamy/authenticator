class User{
  String _email;
  String _uid;

  User(String email, String uid) {
    this._email = email;
    this._uid = uid;
  }

  String get email => _email;
  String get uid => _uid;

}