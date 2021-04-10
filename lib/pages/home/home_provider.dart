
import 'package:fluttour/services/safety/notifier_safety.dart';
import 'package:fluttour/utils/app_enum.dart';

class HomeProvider extends ChangeNotifierSafety {

  List<Tutorial> _listTutorial = <Tutorial>[];

  List<Tutorial> get listTutorial => _listTutorial;

  set listTutorial(List<Tutorial> value) {
    _listTutorial = value;
    notifyListeners();
  }

  void setupData() {
    listTutorial = Tutorial.values;
  }

  @override
  void resetState() {
  }
}