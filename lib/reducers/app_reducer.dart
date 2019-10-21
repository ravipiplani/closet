import 'package:vastram/models/app_state.dart';
import 'package:vastram/reducers/auth_reducer.dart';

AppState appReducer(AppState state, action) {
  return AppState(
    isLoading: false,
    currentUser: authReducer(state.currentUser, action)
  );
}