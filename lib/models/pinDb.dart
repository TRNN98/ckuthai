const String TABLE_PIN = 'TBpin';
const String COLUMN_ID = 'id';
const String COLUMN_PINNUMBER = 'pinnumber';

class PinDb {
  int id;
  String pinnumber;

  PinDb();

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      COLUMN_PINNUMBER: pinnumber,
    };

    if (id != null) {
      map[COLUMN_ID] = id;
    }
    return map;
  }

  PinDb.fromMap(Map<String, dynamic> map) {
    id = map[COLUMN_ID];
    pinnumber = map[COLUMN_PINNUMBER];
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "pinnumber": pinnumber,
      };
  @override
  String toString() => "$id, $pinnumber";
  
}
