import 'package:stacked/stacked.dart';

class HomePageViewModel extends BaseViewModel {
  bool _expansionExpanded = false;
  get expansionExpanded => _expansionExpanded;

  expansionExpandingDecider() {
    _expansionExpanded = !_expansionExpanded;
    notifyListeners();
  }
}
