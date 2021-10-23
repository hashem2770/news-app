import 'dart:convert';
import 'package:hands_on/networking/Author_Model.dart';
import 'package:hands_on/networking/api_uitilities.dart';
import 'package:http/http.dart' as http;

class AuthorApi{
  Future<Authors> fetchBusinessData() async {
    var response =await http.get(apiBusinessUrl);
    if(response.statusCode == 200){
      return Authors.fromJson(jsonDecode(response.body));
    }else{
      throw Exception('failed to contact api');
    }
  }
  Future<Authors> fetchEntertainmentData() async {
    var response =await http.get(apiEntertainmentUrl);
    if(response.statusCode == 200){
      return Authors.fromJson(jsonDecode(response.body));
    }else{
      throw Exception('failed to contact api');
    }
  }
  Future<Authors> fetchHealthData() async {
    var response =await http.get(apiHealthUrl);
    if(response.statusCode == 200){
      return Authors.fromJson(jsonDecode(response.body));
    }else{
      throw Exception('failed to contact api');
    }
  }
  Future<Authors> fetchScienceData() async {
    var response =await http.get(apiScienceUrl);
    if(response.statusCode == 200){
      return Authors.fromJson(jsonDecode(response.body));
    }else{
      throw Exception('failed to contact api');
    }
  }
  Future<Authors> fetchSportsData() async {
    var response =await http.get(apiSportsUrl);
    if(response.statusCode == 200){
      return Authors.fromJson(jsonDecode(response.body));
    }else{
      throw Exception('failed to contact api');
    }
  }
  Future<Authors> fetchTechData() async {
    var response =await http.get(apiTechUrl);
    if(response.statusCode == 200){
      return Authors.fromJson(jsonDecode(response.body));
    }else{
      throw Exception('failed to contact api');
    }
  }
}