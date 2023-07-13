import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{

  String location; // location name for the UI
  String time=''; // the time in that location
  String flag; // url to an asset flag icon
  String url; // location url for api endpoint
  bool? isDaytime; // true or false if daytime or not

  WorldTime({required this.location,required this.flag,required this.url});

  // void getData() async {
  //     Response response=await get(Uri.parse('https://jsonplaceholder.typicode.com/todos/1'));
  //     // Response response=await get(Uri.http('pscnetinvest.moneydj.com.tw/z/zc/zcq/zcq_5519.djhtm',''));
  //     // print(response.body.userId);
  //     Map data=jsonDecode(response.body);
  //     print(data);
  //     print(data['title']);
  //   }

  //Future<> like promise in javascript? placeholder value?
  Future<void> getTime() async {

    //try and catch are for error handling
    try {
      // make the request
      // Response response = await get(Uri.parse('https://worldtimeapi.org/api/timezone/Europe/London'));
      Response response = await get(Uri.parse('https://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);

      //get properties from data
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1,3);

      //create datetime object
      String plusOrMinus = data['utc_offset'].substring(0,1);
      DateTime now = DateTime.parse(datetime);
      if(plusOrMinus == '-'){
        print('now=$now');
        now = now.subtract(Duration(hours: int.parse(offset)));
        print('now=$now , daytime=$datetime , offset=$plusOrMinus $offset');
      }else{
        print('now=$now');
        now = now.add(Duration(hours: int.parse(offset)));
        print('now=$now , daytime=$datetime , offset=$plusOrMinus $offset');
      }
      // DateTime now=DateTime.parse(datetime);
      // now.add(Duration(hours:int.parse(offset)));

      //set the time property
      // time = now.toString();
      isDaytime = now.hour > 6 && now.hour <18 ? true : false ;
      time = DateFormat.jm().format(now);
    }
    catch (e) {
      print('caught error: $e');
      time='could not get time data';
    }

  }



}

// WorldTime instance = WorldTime(location: 'Berlin', flag='germany.png', url:'Europe/Berlin')
// instance.getTime()