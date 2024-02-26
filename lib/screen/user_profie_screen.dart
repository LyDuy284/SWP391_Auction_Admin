import 'package:flutter/material.dart';
import 'package:swp391_auction_admin/constants.dart';
import 'package:swp391_auction_admin/models/respone/user_profile_model.dart';
import 'package:swp391_auction_admin/provider/api_provider.dart';

class UserListProfile extends StatefulWidget {
  @override
  _UserListProfile createState() => _UserListProfile();
}

class _UserListProfile extends State<UserListProfile> {
  List<UserProfileModel> userData = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ApiProvider.getAllUsers().then((dataFromServer) {
      setState(() {
        userData = dataFromServer!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Http Request")),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(10),
              itemCount: userData.length,
              itemBuilder:  (context, index) {
                return Card(
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('${userData[index].firstName}',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black
                        )),
                        SizedBox(
                          height: 5,
                        )
                      ],
                    ),
                  ),
                );
              } 
              )
            )
        ]
        ),
    );
  }
}
