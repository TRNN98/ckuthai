const String TABLE_LG = 'lgs';
const String COLUMN_ID = 'id';
const String COLUMN_LG = 'lg';

class LGDb {
  int id;
  String lg;

  LGDb();

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      COLUMN_LG: lg,
    };

    if (id != null) {
      map[COLUMN_ID] = id;
    }
    return map;
  }

  LGDb.fromMap(Map<String, dynamic> map) {
    id = map[COLUMN_ID];
    lg = map[COLUMN_LG];
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "lg": lg,
      };
  @override
  String toString() => "$id, $lg";
  
}
