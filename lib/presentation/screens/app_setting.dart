import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';


class AppSettings extends StatefulWidget {
  const AppSettings({Key? key}) : super(key: key);

  _AppSettings createState() => _AppSettings();
}

class _AppSettings extends State<AppSettings> {
  bool switcher = true;
  var slide = 0.8;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: ListView(
        children: [
          ListTile(
              leading: Icon(Icons.language),
              title: Text('AppLanguage'),
              trailing: IconButton(
                onPressed: () {},
                icon: Icon(Icons.arrow_drop_down),
              )),
          ListTile(
              leading: Icon(Icons.notifications),
              title: Text('Notifications'),
              trailing: Switch(
                  value: switcher,
                  onChanged: (value) {
                    setState(() {
                      switcher = value;
                    });
                  })),
          Divider(),
          ListTile(
            leading: Icon(Icons.brightness_6),
            title: Text('Dark Theme'),
            trailing: Switch(
              value: false,
              onChanged: (bool value) {},
            ),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.volume_up),
            title: Text('Volume'),
            subtitle: Slider(
              value: slide,
              onChanged: (double value) {
                setState(() {
                  slide = value;
                });
              },
              min: 0.0,
              max: 1.0,
            ),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.info),
            title: Text('About'),
            onTap: () {},
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
