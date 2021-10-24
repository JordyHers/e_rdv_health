import 'package:e_rdv_health/utils/routes/routes.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        elevation: 2,
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.space,
          children: [
            Flexible(
              flex: 2,
              child: DrawerHeader(
                child: CircleAvatar(
                  backgroundColor: Colors.black12,
                  foregroundColor: Colors.black,
                  radius: 35,
                  child: Icon(Icons.person),
                ),
              ),
            ),
            Flexible(
                flex: 1,
                child: ListTile(
                  trailing: Icon(Icons.logout),
                  title: TextButton(
                      onPressed: () => Navigator.of(context)
                          .pushReplacementNamed(RouteNames.loginPage),
                      child: Text(
                        'Se déconnecter',
                        style: TextStyle(color: Colors.black26),
                      )),
                )),
          ],
        ));
  }
}
