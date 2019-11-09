import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:vastram/actions/auth_actions.dart';
import 'package:vastram/components/auth/home_button.dart';
import 'package:vastram/components/decorated_container.dart';
import 'package:vastram/components/loader.dart';
import 'package:vastram/models/app_state.dart';

const _kDuration = const Duration(milliseconds: 300);
const _kCurve = Curves.ease;

class Onboarding extends StatefulWidget {
  Onboarding({Key key}) : super(key: key);

  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  PageController _pageController = PageController();
  List<Map> _onboardingPages = [
    {
      "input": {
        "name": "mobile",
        "label": "Mobile",
        "hint": "XXXXXXXXXX",
        "keyboard_type": TextInputType.phone,
        "max_length": 10,
        "controller": TextEditingController(),
        "validation_message": "Please enter 10 digit mobile number.",
        "prefix": "country_code"
      }
    },
    {
      "input": {
        "name": "name",
        "label": "Full Name",
        "hint": "First and Last Name",
        "keyboard_type": TextInputType.text,
        "max_length": 255,
        "controller": TextEditingController(),
        "validation_message": "Please enter full name.",
      }
    },
    {
      "input": {
        "name": "dob",
        "label": "Date of Birth",
        "hint": "DD/MM/YYYY",
        "keyboard_type": TextInputType.datetime,
        "max_length": 10,
        "controller": TextEditingController(),
        "validation_message": "Please enter your date of birth.",
      }
    }
  ];
  FocusNode _focusNode = FocusNode();
  String countryCode = "";

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    setState(() {
      countryCode = "+91";
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: DecoratedContainer(
          showImage: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(top: 80, left: 40, right: 40),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                child: Text('VASTRAM', style: Theme.of(context).textTheme.subhead.copyWith(color: Theme.of(context).primaryColor.withOpacity(0.7)))
                              ),
                              Container(
                                child: Text('Sign Up', style: Theme.of(context).textTheme.display1.copyWith(color: Theme.of(context).accentColor))
                              ),
                            ],
                          ),
                          Container(
                            child: StoreConnector<AppState, bool>(
                              converter: (store) => store.state.isLoading,
                              builder: (BuildContext context, bool isLoading) {
                                return isLoading ? Loader(
                                  color: Theme.of(context).primaryColor,
                                ) : Container();
                              }
                            )
                          )
                        ],
                      ),
                      Expanded(
                        child: Form(
                          key: _formKey,
                          child: PageView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            controller: _pageController,
                            itemCount: _onboardingPages.length,
                            itemBuilder: (BuildContext context, int index) {
                              Map input = _onboardingPages[index % _onboardingPages.length]['input'];
                              TextEditingController _controller = input['controller'];
                              return Container(
                                margin: EdgeInsets.only(top: 100),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    input.containsKey("prefix") ? Padding(
                                      padding: EdgeInsets.only(top: 23, right: 20),
                                      child: InkWell(
                                        onTap: _openCountryPickerDialog,
                                        child: Text(countryCode, style: Theme.of(context).textTheme.display2.copyWith(fontWeight: FontWeight.w400, color: Theme.of(context).primaryColor.withOpacity(0.7))),
                                      )
                                    ) : Container(),
                                    Expanded(
                                      child: InkWell(
                                        onTap: input['name'] == 'dob' ? () {
                                          print('open date');
                                          _selectDate();
                                        } : null,
                                        child: IgnorePointer(
                                          ignoring: input['name'] == 'dob' ? true : false,
                                          child: TextFormField(
                                            maxLines: 1,
                                            maxLength: input['max_length'],
                                            focusNode: _focusNode,
                                            validator: (value) {
                                              if (value.isEmpty) {
                                                return input['validation_message'];
                                              }
                                              return null;
                                            },
                                            decoration: InputDecoration(
                                              counter: Offstage(),
                                              enabledBorder: InputBorder.none,
                                              focusedBorder: InputBorder.none,
                                              border: InputBorder.none,
                                              labelText: input['label'],
                                              labelStyle: _focusNode.hasFocus || _controller.text.isNotEmpty ? Theme.of(context).textTheme.display3 : Theme.of(context).textTheme.display2.copyWith(color: Theme.of(context).primaryColor.withOpacity(0.3)),
                                              hintText: input['hint'],
                                              hintStyle: Theme.of(context).textTheme.display2.copyWith(color: Theme.of(context).primaryColor.withOpacity(0.3)),
                                            ),
                                            textCapitalization: TextCapitalization.words,
                                            style: Theme.of(context).textTheme.display2.copyWith(fontWeight: FontWeight.w400),
                                            keyboardType: input['keyboard_type'],
                                            controller: _controller,
                                          ),
                                        )
                                      )
                                    )
                                  ],
                                ),
                              );
                            },
                          ),
                        )
                      )
                    ],
                  )
                )
              ),
              StoreConnector<AppState, _OnboardingViewModel>(
                converter: _OnboardingViewModel.fromStore,
                onWillChange: (viewModel) {
                  if (_pageController.page.toInt() == 0 && viewModel.isNewUser) {
                    _pageController.nextPage(duration: _kDuration, curve: _kCurve);
                  }
                },
                builder: (BuildContext context, _OnboardingViewModel viewModel) {
                  return HomeButton(
                    text: 'Next',
                    handler: () {
                      Map input = _onboardingPages[_pageController.page.toInt()]['input'];
                      TextEditingController _controller = input['controller'];
                      viewModel.handler(_pageController, _controller.text, input['name'], _formKey);
                    }
                  );
                }
              )
            ],
          )
        ),
      )
    );
  }

  void _openCountryPickerDialog() {
    showDialog(
      context: context,
      builder: (context) => Theme(
        data: Theme.of(context).copyWith(dialogBackgroundColor: Colors.white),
        child: CountryPickerDialog(
          titlePadding: EdgeInsets.all(0.0),
          searchCursorColor: Colors.pinkAccent,
          searchInputDecoration: InputDecoration(
            hintText: 'Search...'
          ),
          isSearchable: true,
          title: Text('Country Code'),
          itemBuilder: (Country country) {
            return Container(
              child: Text("+${country.phoneCode} (${country.isoCode})")
            );
          },
          onValuePicked: (country) {
            setState(() {
              countryCode = "+${country.phoneCode}";
            });
          },
        )
      )
    );
  }

  Future _selectDate() async {
    DateTime picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2016),
        lastDate: DateTime(2020)
    );
    return picked;
  }
}

class _OnboardingViewModel {
  final bool isNewUser;
  final Function(PageController, String, String, GlobalKey<FormState>) handler;

  _OnboardingViewModel({
    this.isNewUser,
    this.handler
  });

  static _OnboardingViewModel fromStore(Store<AppState> store) {
    return _OnboardingViewModel(
      isNewUser: store.state.authState.isNewUser,
      handler: (pageController, text, name, formKey) {
        if (store.state.isLoading) {
          return null;
        }
        if (formKey.currentState.validate()) {
          store.dispatch(UpdateUser(keyValues: {name: text}));
          if (store.state.authState.isNewUser) {
            if (pageController.page.toInt() == 2) {
              store.dispatch(RegisterUser());
            }
            else {
              pageController.nextPage(duration: _kDuration, curve: _kCurve);
            }
          }
          else {
            store.dispatch(CheckIfUserExists(mobile: text));
          }
        }
      }
    );
  }
}