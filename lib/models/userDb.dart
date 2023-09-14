const String TABLE_USERNAME = 'username';
const String COLUMN_ID = 'id';
const String COLUMN_USER = 'user';
const String COLUMN_PASSWORD = 'password';

class UserDb {
  int id;
  String user;
  String password;

  UserDb();

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      COLUMN_USER: user,
      COLUMN_PASSWORD: password,
    };

    if (id != null) {
      map[COLUMN_ID] = id;
    }
    return map;
  }

  UserDb.fromMap(Map<String, dynamic> map) {
    id = map[COLUMN_ID];
    user = map[COLUMN_USER];
    password = map[COLUMN_PASSWORD];
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "user": user,
        "password": password,
      };
  @override
  String toString() => "$id, $user, $password";
  
}
