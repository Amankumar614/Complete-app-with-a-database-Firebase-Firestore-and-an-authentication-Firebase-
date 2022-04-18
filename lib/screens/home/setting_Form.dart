import 'package:brew/screens/model/uid.dart';
import 'package:brew/screens/model/user.dart';
import 'package:brew/screens/services/databases.dart';
import 'package:brew/shared/loding.dart';
import 'package:flutter/material.dart';


class settingForm extends StatefulWidget {
  const settingForm({Key? key}) : super(key: key);

  @override
  State<settingForm> createState() => _settingFormState();
}

class _settingFormState extends State<settingForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> suger = ['0', '1', '2', '3', '4'];

  String ?_currentName;
  String ?_currentSuger;
  int ?_currentStrength;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<UserData>(
      stream: DatabaseService(uid: OwnUid).userdata,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          UserData? userData = snapshot.data;
          print("real name ${userData!.name}");
          return Form(
            
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  "Update your brew setting",
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  // initialValue: userData!.name,
                  initialValue: userData.name,
                  validator: (val) => val!.isEmpty ? 'Enter the Name' : null,
                  onChanged: (val) => setState(() {
                    _currentName = val;
                  }),
                ),
                SizedBox(
                  height: 20,
                ),
                DropdownButtonFormField(
                    value: userData.suger,
                    items: suger.map((suger) {
                      return DropdownMenuItem(
                          child: Text('$suger suger'), value: suger);
                    }).toList(),
                    onChanged: (val) => setState(() {
                          _currentSuger=val.toString();
                        })),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Slider(
                          
                          value: (_currentStrength ?? 100).toDouble(),

                          activeColor: Colors.brown[_currentStrength ?? 100],
                          inactiveColor: Colors.brown[_currentStrength ?? 100],
                          min: 100.0,
                          max: 900.0,
                          divisions: 8,
                          onChanged: (val) => setState(() => _currentStrength = val.round()),
                        ),
                      ),
                      CircleAvatar(backgroundColor: Colors.brown[userData.strength],)
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () async{
                    if (_formKey.currentState!.validate()) {
                      await DatabaseService(uid: OwnUid).UpdateUserData(_currentSuger??userData.suger, _currentName??userData.name, _currentStrength??userData.strength);
                      setState(() {
                        
                      });
                    }
                    Navigator.pop(context);
                  },
                  child: Text('update'),
                  style: ElevatedButton.styleFrom(primary: Colors.pink),
                )
              ],
            ),
          ),
        );
        } 
        else if(snapshot.error != null){
          print("no error ${snapshot.error}");
          return Center(child: Text('try again'),);
        }else{
          return loader();
        }
        
      }
    );
  }
}
