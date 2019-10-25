import 'package:redux/redux.dart';
import 'package:vastram/actions/loading_actions.dart';

final loadingReducer = combineReducers<bool>([
  TypedReducer<bool, StartLoading>(_startLoading),
  TypedReducer<bool, StopLoading>(_stopLoading)
]);

bool _startLoading(bool isLoading, action) {
  return true;
}

bool _stopLoading(bool isLoading, action) {
  return false;
}