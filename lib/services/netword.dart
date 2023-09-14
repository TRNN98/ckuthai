import 'dart:convert';
import 'package:appbase/class/myclass.dart';
import 'package:appbase/models/addressJson.dart';
import 'package:appbase/models/cremationJson.dart';
import 'package:appbase/models/gainJson.dart';
import 'package:appbase/models/newsJson.dart';
import 'package:appbase/pins.dart';
import 'package:flutter/material.dart';

import 'package:appbase/models/authJson.dart';
import 'package:appbase/models/depJson.dart';
import 'package:appbase/models/dividendJson.dart';
import 'package:appbase/models/guaranteeJson.dart';
import 'package:appbase/models/infoJson.dart';
import 'package:appbase/models/keptJson.dart';
import 'package:appbase/models/loanJson.dart';
import 'package:appbase/models/shareJson.dart';
import 'package:http/http.dart' as http;

class Network {
  static Future<List<AuthModel>> fetchAuth(data) async {
    final url = '${MyClass.hostApp()}/api/member/Nauths';

    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8'
    };
    String jsons = json.encode(data);
    final response =
        await http.post(url, headers: headers, body: json.decode(jsons));
    if (response.statusCode == 200) {
      final List jsonResponse = json.decode(response.body);
      List<AuthModel> result =
          jsonResponse.map((i) => AuthModel.fromJson(i)).toList();
      return result;
    } else {
      throw Exception('Failed to load post');
    }
  }

  static Future<List<AuthRegitModel>> fetchAuthReg(data) async {
    final url = '${MyClass.hostApp()}/api/member/Nauths';

    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8'
    };
    String jsons = json.encode(data);
    final response =
        await http.post(url, headers: headers, body: json.decode(jsons));
    if (response.statusCode == 200) {
      final List jsonResponse = json.decode(response.body);
      List<AuthRegitModel> result =
          jsonResponse.map((i) => AuthRegitModel.fromJson(i)).toList();
      return result;
    } else {
      throw Exception('Failed to load post');
    }
  }

  static Future fetchpinlogin(data) async {
    final url = Uri.parse('${MyClass.hostApp()}/api/member/auth/login');
    // final url = '${MyClass.hostApp()}/api/member/auth/login';
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8'
    };

    String jsons = json.encode(data);

    final response =
        await http.post(url, headers: headers, body: json.decode(jsons));

    if (response.statusCode == 200) {
      final List jsonResponse = json.decode('[' + response.body + ']');
      return jsonResponse;
    } else {
      return 'NoData';
      // throw Exception('Failed to load post');
    }
  }

  static Future fetchAuthFo(data) async {
    final url = '${MyClass.hostApp()}/api/member/auth/forgetMobile';
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8'
    };

    String jsons = json.encode(data);
    final response =
        await http.post(url, headers: headers, body: json.decode(jsons));
    if (response.statusCode == 200) {
      final List jsonResponse = json.decode('[' + response.body + ']');
      return jsonResponse;
    } else {
      return 'NoData';
      // throw Exception('Failed to load post');
    }
  }

  static Future fetchAuthRe(data) async {
    final url = '${MyClass.hostApp()}/api/member/auth/registerMobile';
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8'
    };

    String jsons = json.encode(data);

    final response =
        await http.post(url, headers: headers, body: json.decode(jsons));
    if (response.statusCode == 200) {
      final List jsonResponse = json.decode('[' + response.body + ']');
      return jsonResponse;
    } else {
      return 'NoData';
      // throw Exception('Failed to load post');
    }
  }

  static Future<List<ShareModel>> fetchShare(data, token, context) async {
    final url = '${MyClass.hostApp()}/api/member/Nshare';
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      "Authorization": "Bearer " + token
    };
    final jsons = json.encode(data);
    final response =
        await http.post(url, headers: headers, body: json.decode(jsons));
    if (response.statusCode == 200) {
      final List jsonResponse = json.decode(response.body);
      List<ShareModel> result =
          jsonResponse.map((i) => ShareModel.fromJson(i)).toList();
      return result;
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Pins(gettitle: 'pinCode'),
        ),
      );
    }
  }

  static Future<List<Headshare>> fetchHeadShare(data, token, context) async {
    final url = '${MyClass.hostApp()}/api/member/Nshare';

    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      "Authorization": "Bearer " + token
    };
    String jsons = json.encode(data);
    final response =
        await http.post(url, headers: headers, body: json.decode(jsons));
    if (response.statusCode == 200) {
      final List jsonResponse = json.decode(response.body);
      List<Headshare> result =
          jsonResponse.map((i) => Headshare.fromJson(i)).toList();
      return result;
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Pins(gettitle: 'pinCode'),
        ),
      );
    }
  }

  static Future<List<Deposits>> fetchDep(data, token, context) async {
    final url = '${MyClass.hostApp()}/api/member/Ndep';

    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      "Authorization": "Bearer " + token
    };

    String jsons = json.encode(data);
    var response =
        await http.post(url, headers: headers, body: json.decode(jsons));
    if (response.statusCode == 200) {
      final List jsonResponse = json.decode(response.body);
      List<Deposits> result =
          jsonResponse.map((i) => Deposits.fromJson(i)).toList();
      return result;
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Pins(gettitle: 'pinCode'),
        ),
      );
    }
  }

  static Future<List<DepositMovement>> fetchDepMovement(
      data, token, context) async {
    final url = '${MyClass.hostApp()}/api/member/Ndep';

    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      "Authorization": "Bearer " + token
    };

    String jsons = json.encode(data);
    final response =
        await http.post(url, headers: headers, body: json.decode(jsons));
    if (response.statusCode == 200) {
      final List jsonResponse = json.decode(response.body);
      List<DepositMovement> result =
          jsonResponse.map((i) => DepositMovement.fromJson(i)).toList();
      return result;
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Pins(gettitle: 'pinCode'),
        ),
      );
    }
  }

  static Future<List<LoanModel>> fetchLoan(data, token, context) async {
    final url = '${MyClass.hostApp()}/api/member/Nlon';

    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      "Authorization": "Bearer " + token
    };

    String jsons = json.encode(data);
    final response =
        await http.post(url, headers: headers, body: json.decode(jsons));
    if (response.statusCode == 200) {
      final List jsonResponse = json.decode(response.body);
      List<LoanModel> result =
          jsonResponse.map((i) => LoanModel.fromJson(i)).toList();
      return result;
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Pins(gettitle: 'pinCode'),
        ),
      );
    }
  }

  static Future<List<LoanGuaranteeModel>> fetchLoanGuarantee(
      data, token, context) async {
    final url = '${MyClass.hostApp()}/api/member/Nlon';

    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      "Authorization": "Bearer " + token
    };

    String jsons = json.encode(data);
    final response =
        await http.post(url, headers: headers, body: json.decode(jsons));
    if (response.statusCode == 200) {
      final List jsonResponse = json.decode(response.body);
      List<LoanGuaranteeModel> result =
          jsonResponse.map((i) => LoanGuaranteeModel.fromJson(i)).toList();
      return result;
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Pins(gettitle: 'pinCode'),
        ),
      );
    }
  }

  static Future<List<LoanMovementModel>> fetchLoanMovement(
      data, token, context) async {
    final url = '${MyClass.hostApp()}/api/member/Nlon';

    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      "Authorization": "Bearer " + token
    };

    String jsons = json.encode(data);
    final response =
        await http.post(url, headers: headers, body: json.decode(jsons));
    if (response.statusCode == 200) {
      final List jsonResponse = json.decode(response.body);
      List<LoanMovementModel> result =
          jsonResponse.map((i) => LoanMovementModel.fromJson(i)).toList();
      return result;
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Pins(gettitle: 'pinCode'),
        ),
      );
    }
  }

  static Future<List<GuaranteeModel>> fetchGuarantee(
      data, token, context) async {
    final url = '${MyClass.hostApp()}/api/member/Nmem_coll';

    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      "Authorization": "Bearer " + token
    };

    String jsons = json.encode(data);
    final response =
        await http.post(url, headers: headers, body: json.decode(jsons));
    if (response.statusCode == 200) {
      final List jsonResponse = json.decode(response.body);
      List<GuaranteeModel> result =
          jsonResponse.map((i) => GuaranteeModel.fromJson(i)).toList();
      return result;
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Pins(gettitle: 'pinCode'),
        ),
      );
    }
  }

  static Future<List<DividendModel>> fetchDividend(data, token, context) async {
    final url = '${MyClass.hostApp()}/api/member/Ndiv';

    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      "Authorization": "Bearer " + token
    };

    String jsons = json.encode(data);
    final response =
        await http.post(url, headers: headers, body: json.decode(jsons));
    if (response.statusCode == 200) {
      final List jsonResponse = json.decode(response.body);
      List<DividendModel> result =
          jsonResponse.map((i) => DividendModel.fromJson(i)).toList();
      return result;
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Pins(gettitle: 'pinCode'),
        ),
      );
    }
  }

  static Future<List<DividendDetailModel>> fetchDividendDetail(
      data, token, context) async {
    final url = '${MyClass.hostApp()}/api/member/Ndiv';

    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      "Authorization": "Bearer " + token
    };

    String jsons = json.encode(data);
    final response =
        await http.post(url, headers: headers, body: json.decode(jsons));
    if (response.statusCode == 200) {
      final List jsonResponse = json.decode(response.body);
      List<DividendDetailModel> result =
          jsonResponse.map((i) => DividendDetailModel.fromJson(i)).toList();
      return result;
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Pins(gettitle: 'pinCode'),
        ),
      );
    }
  }

  static Future<List<KeptModel>> fetchKept(data, token, context) async {
    final url = '${MyClass.hostApp()}/api/member/Nkept';

    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      "Authorization": "Bearer " + token
    };

    String jsons = json.encode(data);
    final response =
        await http.post(url, headers: headers, body: json.decode(jsons));
    if (response.statusCode == 200) {
      final List jsonResponse = json.decode(response.body);
      List<KeptModel> result =
          jsonResponse.map((i) => KeptModel.fromJson(i)).toList();
      return result;
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Pins(gettitle: 'pinCode'),
        ),
      );
    }
  }

  static Future<List<KeptDetailModel>> fetchKeptDetail(
      data, token, context) async {
    final url = '${MyClass.hostApp()}/api/member/Nkept';

    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      "Authorization": "Bearer " + token
    };

    String jsons = json.encode(data);
    final response =
        await http.post(url, headers: headers, body: json.decode(jsons));
    if (response.statusCode == 200) {
      final List jsonResponse = json.decode(response.body);
      List<KeptDetailModel> result =
          jsonResponse.map((i) => KeptDetailModel.fromJson(i)).toList();
      return result;
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Pins(gettitle: 'pinCode'),
        ),
      );
    }
  }

  static Future<List<GainModel>> fetchGain(data, token, context) async {
    final url = '${MyClass.hostApp()}/api/member/Ngain';

    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      "Authorization": "Bearer " + token
    };

    String jsons = json.encode(data);
    final response =
        await http.post(url, headers: headers, body: json.decode(jsons));
    if (response.statusCode == 200) {
      final List jsonResponse = json.decode(response.body);
      List<GainModel> result =
          jsonResponse.map((i) => GainModel.fromJson(i)).toList();
      return result;
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Pins(gettitle: 'pinCode'),
        ),
      );
    }
  }

  static Future<List<CremationModel>> fetchCremation(
      data, token, context) async {
    final url = '${MyClass.hostApp()}/api/member/Ncremation';

    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      "Authorization": "Bearer " + token
    };
    String jsons = json.encode(data);
    final response =
        await http.post(url, headers: headers, body: json.decode(jsons));

    if (response.statusCode == 200) {
      final List jsonResponse = json.decode(response.body);
      List<CremationModel> result =
          jsonResponse.map((i) => CremationModel.fromJson(i)).toList();
      return result;
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Pins(gettitle: 'pinCode'),
        ),
      );
    }
  }

  static Future<List<InfoModel>> fetchInfo(data, token, context) async {
    final url = '${MyClass.hostApp()}/api/member/Ninfo';
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      "Authorization": "Bearer " + token
    };

    String jsons = json.encode(data);
    final response =
        await http.post(url, headers: headers, body: json.decode(jsons));
    if (response.statusCode == 200) {
      final List jsonResponse = json.decode(response.body);
      List<InfoModel> result =
          jsonResponse.map((i) => InfoModel.fromJson(i)).toList();
      return result;
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Pins(gettitle: 'pinCode'),
        ),
      );
    }
  }

  static Future<List<NewsModel>> fetchNews(data, token, context) async {
    final url = '${MyClass.hostApp()}/api/member/Nmsg';
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      "Authorization": "Bearer " + token
    };

    String jsons = json.encode(data);
    final response =
        await http.post(url, headers: headers, body: json.decode(jsons));
    if (response.statusCode == 200) {
      final List jsonResponse = json.decode(response.body);
      List<NewsModel> result =
          jsonResponse.map((i) => NewsModel.fromJson(i)).toList();
      return result;
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Pins(gettitle: 'pinCode'),
        ),
      );
    }
  }

  // static Future<List<VersionsModel>> fetchVersions(data, token, context) async {
  //   final url = '${MyClass.hostApp()}/api/member/msg';
  //   Map<String, String> headers = {
  //     'Content-Type': 'application/json; charset=UTF-8'
  //   };

  //   String jsons = json.encode(data);
  //   final response =
  //       await http.post(url, headers: headers, body: json.decode(jsons));
  //   if (response.statusCode == 200) {
  //     final List jsonResponse = json.decode(response.body);
  //     List<VersionsModel> result =
  //         jsonResponse.map((i) => VersionsModel.fromJson(i)).toList();
  //     return result;
  //   } else {

  //   }
  // }

  static Future fetchVersions(data) async {
    final url = '${MyClass.hostApp()}/api/member/Nversions';
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8'
    };

    String jsons = json.encode(data);
    final response =
        await http.post(url, headers: headers, body: json.decode(jsons));
    if (response.statusCode == 200) {
      final List jsonResponse = json.decode(response.body);
      return jsonResponse;
    } else {
      // return 'NoData';
      // throw Exception('Failed to load post');
    }
  }

  static Future fetchCheckpassword(data) async {
    final url = '${MyClass.hostApp()}/api/member/Ncheckfogetpassword';
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8'
    };

    String jsons = json.encode(data);
    final response =
        await http.post(url, headers: headers, body: json.decode(jsons));
    if (response.statusCode == 200) {
      final List jsonResponse = json.decode('[' + response.body + ']');
      return jsonResponse[0]['checkforget'];
    } else {
      return '0';
      // throw Exception('Failed to load post');
    }
  }

  static Future<List<AddressModel>> fetchAddress(data) async {
    final url = '${MyClass.hostApp()}/api/member/Naddress';
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8'
    };

    String jsons = json.encode(data);
    final response =
        await http.post(url, headers: headers, body: json.decode(jsons));
    if (response.statusCode == 200) {
      final List jsonResponse = json.decode(response.body);
      List<AddressModel> result =
          jsonResponse.map((i) => AddressModel.fromJson(i)).toList();
      // List<AddressModel> jsonResponse = json.decode(response.body);
      return result;
    } else {
      // return 'NoData';
      // throw Exception('Failed to load post');
    }
  }
}
