const String TABLE_TF = 'touchandface';
const String COLUMN_ID = 'id';
const String COLUMN_TF = 'tf';

class TFDb {
  int id;
  String tf;

  TFDb();

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      COLUMN_TF: tf,
    };

    if (id != null) {
      map[COLUMN_ID] = id;
    }
    return map;
  }

  TFDb.fromMap(Map<String, dynamic> map) {
    id = map[COLUMN_ID];
    tf = map[COLUMN_TF];
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "tf": tf,
      };
  @override
  String toString() => "$id, $tf";
  
}
