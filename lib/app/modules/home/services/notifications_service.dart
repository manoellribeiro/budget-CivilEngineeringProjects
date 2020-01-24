import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart';

class NotificationsService extends Disposable {

  static final Client client = Client();

  static const String serverKey =
      "AAAAqq1aUh4:APA91bEjVPgf4_YyKtQAbQKfD3JhpmXQHh-38tVw6IagMD2sjPr-Egf-UprhyyhfLSDBAh-Fo2g47LVjIaqoT69BLkCmLgb7OozBs41KWhoRxz_TcYl_k7WRiTzDtf8krBvShwO_p5hU";

  static Future<Response> sendToAll({
  @required String title,
  @required String body,
}) =>
      client.post("https://fcm.googleapis.com/fcm/send",
      body: json.encode({"notification": {"body": "$body",
        "title": "$title"},
        "priority": "high",
        "data": {"click_action": "FLUTTER_NOTIFICATION_CLICK",
          "id": "1",
          "status": "done"},
        "to": "/topics/all"}),
      headers: {
        "Content-Type": 'application/json',
        "Authorization": 'key=$serverKey',
      }
      );

  //dispose will be called automatically
  @override
  void dispose() {}
}
