import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApplicationController extends ChangeNotifier{

  SharedPreferences? prefs;

  Future<bool> init() async {
    prefs=await SharedPreferences.getInstance();
    return true;
  }

  List<String>? getStartEndTimeGradeRecordList(){
    return prefs?.getStringList("start_end_grade_record_list");
  }

  void addStartEndTimeGradeRecordItem(String time){
    List<String>? tempList=getStartEndTimeGradeRecordList()??[];
    tempList.add(time);
    prefs?.setStringList("start_end_grade_record_list", tempList);
    notifyListeners();
  }

  int? getBestGrade(){
    return prefs?.getInt("best_grade");
  }

  void setBestGrade(int grade){
    prefs?.setInt("best_grade",grade);
    notifyListeners();
  }


}