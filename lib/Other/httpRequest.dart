import 'dart:convert';

import 'package:http/http.dart';
import 'package:dudar/pages/Doctors/components/global.dart' as global;
import 'package:intl/intl.dart';

class GetSymptoms {
  @override
  void getData() async {
    var url = Uri.parse(
        "http://api.c9113991.beget.tech/v1.0/api/symptom/searchData.php");
    var response = await post(url, body: {
      "user_id": '1',
      "dates": DateFormat('yyyy-MM-dd').format(global.selectedDay),
    });
    var data = json.decode(response.body);
    if (data == "Not symptoms") {
    } else {
      Map data = jsonDecode(response.body);
      print(data['symptoms']);
      Map<String, int> tempData = Map.castFrom(jsonDecode(data['symptoms']));
      global.listTag = tempData;
      global.viewSymptomDay.clear();
      global.listTag.forEach((k, v) {
        //print('${k}: ${v}');
        var tempMap = global.listSymptom['${k}'];
        if (v != 0) {
          global.viewSymptomDay.add(tempMap![v]);
        }
      });
      print(global.viewSymptomDay);

      // global.viewSymptomDay.add();
    }
  }
}
