import 'package:http/http.dart';
import 'dart:convert';

class WorldTime {

  String location; //location name for the UI
  String time; //the time in that location
  String flag; // url to an asset flag icon
  String url; //this is the location for api endpoint

  WorldTime({ this.location, this.flag, this.url }); 

  Future<void> getTime() async {
    //make the request 
    Uri url = Uri.parse('http://worldtimeapi.org/api/timezone/' + this.url);
    Response response = await get(url);
    Map data = jsonDecode(response.body);

    //get properties from data
    String datetime = data['datetime'];
    String offset = data['utc_offset'].substring(1,3);
    
    //create a datetime object
    DateTime now = DateTime.parse(datetime);
    now = now.add(Duration(hours: int.parse(offset)));

    //set the time property
    time = now.toString();
  }

}