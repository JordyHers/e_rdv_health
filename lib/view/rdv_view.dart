import 'package:e_rdv_health/constants/Strings.dart';
import 'package:e_rdv_health/utils/widgets/custom_appBar.dart';
import 'package:flutter/material.dart';

class ListUserView extends StatefulWidget {
  ListUserView({Key key, this.users}) : super(key: key);
  final List users;
  @override
  _ListUserViewState createState() => _ListUserViewState();
}

class _ListUserViewState extends State<ListUserView> {
  List _data;
  @override
  void initState() {
    _data = widget.users;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomAppBar(Rd.title),
          Flexible(
            child: ListView.builder(
                itemCount: _data.length,
                itemBuilder: (context, index) => ListTile(
                      title: Text(_data[index]['name'],
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.blueAccent)),
                    )),
          ),
        ],
      ),
    );
  }
}
