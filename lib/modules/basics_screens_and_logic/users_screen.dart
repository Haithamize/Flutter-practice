

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserModel{
  int id;
  String name;
  String number;
  UserModel(this.id, this.name, this.number);
}


class UsersScreen extends StatelessWidget {

  List<UserModel> users= [
    UserModel(1, "Haitham", "+201288255025"),
    UserModel(2, "sayed", "+2012222025"),
    UserModel(3, "samah", "+2012881115025"),
    UserModel(4, "osama", "+2012884555025"),
    UserModel(1, "Haitham", "+201288255025"),
    UserModel(2, "sayed", "+2012222025"),
    UserModel(3, "samah", "+2012881115025"),
    UserModel(4, "osama", "+2012884555025"),
  ];

  Widget buildUser(UserModel user){
    return Padding(
      padding: EdgeInsets.all(15),
      child: Row(
        children: [
          CircleAvatar(
            radius: 35,
            backgroundColor: Colors.black,
            child: Text(
              '${user.id}',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(width: 20,),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children:
              [
                Text(
                  '${user.name}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  '${user.number}',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[400],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Users Screen'
        ),
      ),
      body:  ListView.separated(
          itemBuilder: (context,index)=> buildUser(users[index]),
          separatorBuilder: (context,index)=> Padding(
            padding: EdgeInsets.symmetric(horizontal: 50),
            child: Container(
              width: double.infinity,
              color: Colors.grey,
              height: 1,
            ),
          ),
          itemCount: users.length),
    );
  }
}
