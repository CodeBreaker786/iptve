import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iptv/database/moor_curd.dart';
import 'package:iptv/database/user_curd/user_curd.dart';
import 'package:iptv/screen/fetch_channels.dart';

class LoginScreen extends StatefulWidget {
  var db;
  UsersDao usersDao;
  LoginScreen() {
    db = AppDatabase();
    usersDao = UsersDao(db);
  }
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool showPassword = true;
  TextEditingController _nameController = TextEditingController();
  TextEditingController _userNameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        child: Text(
                      'Trouble Logging in?',
                      style: TextStyle(color: Colors.white),
                    )),
                    ButtonTheme(
                      child: RaisedButton(
                          clipBehavior: Clip.antiAlias,
                          color: Theme.of(context).primaryColor,
                          child: Text(
                            'REFRESH DNS',
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () {}),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Icon(
                          FontAwesomeIcons.userCircle,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'Users List',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
          ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), bottomLeft: Radius.circular(20)),
            child: Container(
              constraints: BoxConstraints(
                  minWidth: 130, maxWidth: 400, minHeight: 170, maxHeight: 300),
              color: Colors.white.withOpacity(0.6),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                child: SingleChildScrollView(
                  child: Form(
                    key: formkey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Enter Your Login Details',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.grey,
                              fontWeight: FontWeight.w700),
                        ),
                        TextFormField(
                          controller: _nameController,
                          decoration: InputDecoration(
                              labelText: 'Name',
                              labelStyle: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                              icon: Icon(
                                Icons.person,
                              )),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Name is required';
                            } else {
                              return null;
                            }
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                        ),
                        TextFormField(
                          controller: _userNameController,
                          decoration: InputDecoration(
                              labelText: 'UserName',
                              labelStyle: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                              icon: Icon(
                                Icons.person,
                              )),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Username is required';
                            } else {
                              return null;
                            }
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                        ),
                        TextFormField(
                            controller: _passwordController,
                            decoration: InputDecoration(
                              labelStyle: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                              labelText: 'Password',
                              icon: Icon(
                                Icons.lock,
                              ),
                              suffixIcon: IconButton(
                                icon: !showPassword
                                    ? Icon(
                                        FontAwesomeIcons.eye,
                                      )
                                    : Icon(
                                        FontAwesomeIcons.eyeSlash,
                                      ),
                                onPressed: () {
                                  setState(() {
                                    showPassword = !showPassword;
                                  });
                                },
                              ),
                            ),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Password is required';
                              } else {
                                return null;
                              }
                            },
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            obscureText: showPassword),
                        SizedBox(
                          height: 10,
                        ),
                        ButtonTheme(
                          minWidth: double.infinity,
                          child: RaisedButton(
                              clipBehavior: Clip.antiAlias,
                              color: Theme.of(context).primaryColor,
                              child: Text(
                                'ADD USER',
                                style: TextStyle(color: Colors.white),
                              ),
                              onPressed: () {
                                if (formkey.currentState.validate()) {
                                  User user = User(
                                      name: _nameController.text,
                                      username: _userNameController.text,
                                      password: _passwordController.text);
                                  widget.usersDao.insertUser(user).then((value) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                FetchTVChannel(
                                                  user: user,
                                                )));
                                  });
                                }
                              }),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
