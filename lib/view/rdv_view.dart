import 'package:e_rdv_health/constants/Strings.dart';
import 'package:e_rdv_health/models/user_model.dart';
import 'package:flutter/material.dart';

class ListUserView extends StatefulWidget {
  ListUserView({Key key}) : super(key: key);

  @override
  _ListUserViewState createState() => _ListUserViewState();
}

class _ListUserViewState extends State<ListUserView> {
  MockData _data = MockData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(Rd.title),
        ),
        body: FutureBuilder(
          future: _data.createUsers(),
          builder: (context, _) => ListView.builder(
              itemCount: _data.userList.length,
              itemBuilder: (context, index) => ListTile(
                    title: Text(_data.userList[index].name,
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor)),
                  )),
        ));
  }
}
