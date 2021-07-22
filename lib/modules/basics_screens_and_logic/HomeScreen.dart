
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.menu,
        ),
        title: Text(
          'Flutter',
          style: TextStyle(
            color: Colors.red,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              print('search icon clicked');
            },
          ),
          Text('hello')
        ],
      ),
      body: Column(
        children: [
          Container(
            width: 250,
            decoration: BoxDecoration(borderRadius: BorderRadiusDirectional.only(topStart: Radius.circular(20.0),topEnd:  Radius.circular(20.0),),), //hst5dm de lw 3ayz a3ml corners mn 7etat mo3ayana
            // decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.0,),), //hst5dm de lw 3ayz a3ml corner 3la kolo
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Image(
                    image: NetworkImage('https://assets.nn.ps/CACHE/images/uploads/weblog/2020/09/13/28-08-20-886372404/c5d8ea60d9bc2cdc12a986a590df1932.jpg'),
                  width: 250,
                  height: 250,
                  fit: BoxFit.cover,
                ),
                Container(
                  color: Colors.black.withOpacity(0.8),
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  // padding: EdgeInsetsDirectional.only( //ast5dm el padding bl shakl da aw bl shakl el tani 3adi 3ala 7sb el usecase bt3ti
                  //   top: 10,
                  //   bottom: 10,
                  // ),
                  child: Text(
                    'Android',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30.0,
                    ),
                  ),
                ),
                Container(
                  color: Colors.red.withOpacity(0.5),
                  width: double.infinity,
                  child: Text(
                    'Flutter',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );


  }

  void onNotification() {
    print('clicked');
  }
}
