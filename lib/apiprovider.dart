import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart'as http;
import 'package:intl/intl.dart';

import 'apimodel.dart';


class notificationProvider extends ChangeNotifier{
  List<Apimodel> ApiList=[];


Future getApi()async{
http.Response response;
response = await
  http.get(Uri.parse("https://raw.githubusercontent.com/sayanp23/test-api/main/test-notifications.json"));
print(response.body);
if (response.statusCode==200){

final Map<String,dynamic> data1=json.decode(response.body);
final List<dynamic> data=data1['data'];


ApiList=data.map((e) => Apimodel
  (image:e["image"] ,
    title:e ['title'],
    body: e['body'],
    timestamp:DateTime.parse(e["timestamp"]) )).toList();

    notifyListeners();





}
}
  String formatTimestamp(DateTime timestamp) {
    DateTime now = DateTime.now();
    Duration difference = now.difference(timestamp);

    if (difference.inSeconds < 60) {
      return 'Just now';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes} minutes ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours} hours ago';
    } else if (difference.inDays == 1) {
      return 'Yesterday at ${DateFormat.jm().format(timestamp)}';
    } else {
      return DateFormat('MMM d, yyyy, hh:mm a').format(timestamp);
    }
    }

}