import 'package:vastram/models/app_state.dart';
import 'package:vastram/reducers/auth_reducer.dart';
import 'package:vastram/reducers/loading_reducer.dart';

AppState appReducer(AppState state, action) {
  return AppState(
    isLoading: loadingReducer(state.isLoading, action),
    authState: authReducer(state.authState, action)
  );
}