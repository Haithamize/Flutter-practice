import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MessengerScreen extends StatelessWidget {
  Widget buildChatItem(){
    return Row(
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: [
            CircleAvatar(
              radius: 30.0,
              backgroundImage: NetworkImage('https://otakukart.com/wp-content/uploads/2021/02/gojo.jpg'),
            ),
            CircleAvatar(
              radius: 9,
              backgroundColor: Colors.black,
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(bottom: 3,end: 3),
              child: CircleAvatar(
                radius: 6,
                backgroundColor: Colors.green,
              ),
            ),
          ],
        ),
        SizedBox(width: 10,),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Haitham Ghanem',
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 5,),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'You: Greetings from Haitham Mohamed Ghanem',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 13,
                      ),
                    ),
                  ),
                  SizedBox(width: 5,),
                  Container(
                    width: 2,
                    height: 2,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 5,),
                  Text(
                    '3:15 AM',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildStoryItem() => Row(
    children: [
      Container(
        width: 60,
        child: Column(
          children:
          [
            SizedBox(height: 15,),
            Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [
                CircleAvatar(
                  radius: 30.0,
                  backgroundImage: NetworkImage('https://otakukart.com/wp-content/uploads/2021/02/gojo.jpg'),
                ),
                CircleAvatar(
                  radius: 9,
                  backgroundColor: Colors.black,
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(bottom: 3,end: 3),
                  child: CircleAvatar(
                    radius: 6,
                    backgroundColor: Colors.green,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10,),
            Text(
              'Haitham Ghanemmmmmmmmmm',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
      SizedBox(width: 20,),
      Container(
        width: 60,
        child: Column(
          children:
          [
            SizedBox(height: 15,),
            Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [
                CircleAvatar(
                  radius: 30.0,
                  backgroundImage: NetworkImage('https://otakukart.com/wp-content/uploads/2021/02/gojo.jpg'),
                ),
                CircleAvatar(
                  radius: 9,
                  backgroundColor: Colors.black,
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(bottom: 3,end: 3),
                  child: CircleAvatar(
                    radius: 6,
                    backgroundColor: Colors.green,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10,),
            Text(
              'Haitham Ghanemmmmmmmmmm',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
      SizedBox(width: 20,),
      Container(
        width: 60,
        child: Column(
          children:
          [
            SizedBox(height: 15,),
            Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [
                CircleAvatar(
                  radius: 30.0,
                  backgroundImage: NetworkImage('https://otakukart.com/wp-content/uploads/2021/02/gojo.jpg'),
                ),
                CircleAvatar(
                  radius: 9,
                  backgroundColor: Colors.black,
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(bottom: 3,end: 3),
                  child: CircleAvatar(
                    radius: 6,
                    backgroundColor: Colors.green,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10,),
            Text(
              'Haitham Ghanemmmmmmmmmm',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
      SizedBox(width: 20,),
      Container(
        width: 60,
        child: Column(
          children:
          [
            SizedBox(height: 15,),
            Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [
                CircleAvatar(
                  radius: 30.0,
                  backgroundImage: NetworkImage('https://otakukart.com/wp-content/uploads/2021/02/gojo.jpg'),
                ),
                CircleAvatar(
                  radius: 9,
                  backgroundColor: Colors.black,
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(bottom: 3,end: 3),
                  child: CircleAvatar(
                    radius: 6,
                    backgroundColor: Colors.green,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10,),
            Text(
              'Haitham Ghanemmmmmmmmmm',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
      SizedBox(width: 20,),
      Container(
        width: 60,
        child: Column(
          children:
          [
            SizedBox(height: 15,),
            Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [
                CircleAvatar(
                  radius: 30.0,
                  backgroundImage: NetworkImage('https://otakukart.com/wp-content/uploads/2021/02/gojo.jpg'),
                ),
                CircleAvatar(
                  radius: 9,
                  backgroundColor: Colors.black,
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(bottom: 3,end: 3),
                  child: CircleAvatar(
                    radius: 6,
                    backgroundColor: Colors.green,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10,),
            Text(
              'Haitham Ghanemmmmmmmmmm',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
      SizedBox(width: 20,),
      Container(
        width: 60,
        child: Column(
          children:
          [
            SizedBox(height: 15,),
            Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [
                CircleAvatar(
                  radius: 30.0,
                  backgroundImage: NetworkImage('https://otakukart.com/wp-content/uploads/2021/02/gojo.jpg'),
                ),
                CircleAvatar(
                  radius: 9,
                  backgroundColor: Colors.black,
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(bottom: 3,end: 3),
                  child: CircleAvatar(
                    radius: 6,
                    backgroundColor: Colors.green,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10,),
            Text(
              'Haitham Ghanemmmmmmmmmm',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
      SizedBox(width: 20,),
      Container(
        width: 60,
        child: Column(
          children:
          [
            SizedBox(height: 15,),
            Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [
                CircleAvatar(
                  radius: 30.0,
                  backgroundImage: NetworkImage('https://otakukart.com/wp-content/uploads/2021/02/gojo.jpg'),
                ),
                CircleAvatar(
                  radius: 9,
                  backgroundColor: Colors.black,
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(bottom: 3,end: 3),
                  child: CircleAvatar(
                    radius: 6,
                    backgroundColor: Colors.green,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10,),
            Text(
              'Haitham Ghanemmmmmmmmmm',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
      SizedBox(width: 20,),
      Container(
        width: 60,
        child: Column(
          children:
          [
            SizedBox(height: 15,),
            Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [
                CircleAvatar(
                  radius: 30.0,
                  backgroundImage: NetworkImage('https://otakukart.com/wp-content/uploads/2021/02/gojo.jpg'),
                ),
                CircleAvatar(
                  radius: 9,
                  backgroundColor: Colors.black,
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(bottom: 3,end: 3),
                  child: CircleAvatar(
                    radius: 6,
                    backgroundColor: Colors.green,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10,),
            Text(
              'Haitham Ghanemmmmmmmmmm',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
      SizedBox(width: 20,),
      Container(
        width: 60,
        child: Column(
          children:
          [
            SizedBox(height: 15,),
            Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [
                CircleAvatar(
                  radius: 30.0,
                  backgroundImage: NetworkImage('https://otakukart.com/wp-content/uploads/2021/02/gojo.jpg'),
                ),
                CircleAvatar(
                  radius: 9,
                  backgroundColor: Colors.black,
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(bottom: 3,end: 3),
                  child: CircleAvatar(
                    radius: 6,
                    backgroundColor: Colors.green,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10,),
            Text(
              'Haitham Ghanemmmmmmmmmm',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
      SizedBox(width: 20,),
      Container(
        width: 60,
        child: Column(
          children:
          [
            SizedBox(height: 15,),
            Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [
                CircleAvatar(
                  radius: 30.0,
                  backgroundImage: NetworkImage('https://otakukart.com/wp-content/uploads/2021/02/gojo.jpg'),
                ),
                CircleAvatar(
                  radius: 9,
                  backgroundColor: Colors.black,
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(bottom: 3,end: 3),
                  child: CircleAvatar(
                    radius: 6,
                    backgroundColor: Colors.green,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10,),
            Text(
              'Haitham Ghanemmmmmmmmmm',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
      SizedBox(width: 20,),
      Container(
        width: 60,
        child: Column(
          children:
          [
            SizedBox(height: 15,),
            Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [
                CircleAvatar(
                  radius: 30.0,
                  backgroundImage: NetworkImage('https://otakukart.com/wp-content/uploads/2021/02/gojo.jpg'),
                ),
                CircleAvatar(
                  radius: 9,
                  backgroundColor: Colors.black,
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(bottom: 3,end: 3),
                  child: CircleAvatar(
                    radius: 6,
                    backgroundColor: Colors.green,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10,),
            Text(
              'Haitham Ghanemmmmmmmmmm',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        titleSpacing: 15,
        backgroundColor: Colors.black,
        elevation: 0.0,
        title: Row(
          children: [
            CircleAvatar(
              radius: 20.0,
              backgroundImage: NetworkImage('https://otakukart.com/wp-content/uploads/2021/02/gojo.jpg'),
            ),
            SizedBox(width: 10,),
            Text(
              'Chats',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white
              ),
            ),
          ],
        ),
        actions:
        [
          CircleAvatar(
            backgroundColor: Colors.grey,
            radius: 15,
            child: Icon(
              Icons.camera_alt,
              size: 20,
              color: Colors.white,
            ),
          ),
          SizedBox(width: 15,),
          CircleAvatar(
            backgroundColor: Colors.grey,
            radius: 15,
            child: Icon(
              Icons.edit,
              size: 20,
              color: Colors.white,
            ),
          ),
          SizedBox(width: 15,),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey,
                ),
                child: Row(
                  children:
                  [
                    Icon(
                      Icons.search
                    ),
                    Text('Search'),
                  ],
                ),
              ),//da el search bar
              Container(
                height: 113,
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index){return buildStoryItem();},
                    separatorBuilder:  (context, index){return SizedBox(width: 15,);},
                    itemCount: 10),
              ),
              SizedBox(height: 15,),
              ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                  itemBuilder: (context,index){return buildChatItem();},
                  separatorBuilder: (context,index){return SizedBox(height: 15,);},
                  itemCount: 10),
            ],
          ),
        ),
      ),

    );
  }

  // SingleChildScrollView(
//               scrollDirection: Axis.horizontal,
//               child: Row(
//                 children: [
//                   Container(
//                     width: 60,
//                     child: Column(
//                       children:
//                       [
//                         SizedBox(height: 15,),
//                         Stack(
//                           alignment: AlignmentDirectional.bottomEnd,
//                           children: [
//                             CircleAvatar(
//                               radius: 30.0,
//                               backgroundImage: NetworkImage('https://otakukart.com/wp-content/uploads/2021/02/gojo.jpg'),
//                             ),
//                             CircleAvatar(
//                               radius: 9,
//                               backgroundColor: Colors.black,
//                             ),
//                             Padding(
//                               padding: const EdgeInsetsDirectional.only(bottom: 3,end: 3),
//                               child: CircleAvatar(
//                                 radius: 6,
//                                 backgroundColor: Colors.green,
//                               ),
//                             ),
//                           ],
//                         ),
//                         SizedBox(height: 10,),
//                         Text(
//                           'Haitham Ghanemmmmmmmmmm',
//                           maxLines: 2,
//                           overflow: TextOverflow.ellipsis,
//                           textAlign: TextAlign.center,
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 12,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(width: 20,),
//                   Container(
//                     width: 60,
//                     child: Column(
//                       children:
//                       [
//                         SizedBox(height: 15,),
//                         Stack(
//                           alignment: AlignmentDirectional.bottomEnd,
//                           children: [
//                             CircleAvatar(
//                               radius: 30.0,
//                               backgroundImage: NetworkImage('https://otakukart.com/wp-content/uploads/2021/02/gojo.jpg'),
//                             ),
//                             CircleAvatar(
//                               radius: 9,
//                               backgroundColor: Colors.black,
//                             ),
//                             Padding(
//                               padding: const EdgeInsetsDirectional.only(bottom: 3,end: 3),
//                               child: CircleAvatar(
//                                 radius: 6,
//                                 backgroundColor: Colors.green,
//                               ),
//                             ),
//                           ],
//                         ),
//                         SizedBox(height: 10,),
//                         Text(
//                           'Haitham Ghanemmmmmmmmmm',
//                           maxLines: 2,
//                           overflow: TextOverflow.ellipsis,
//                           textAlign: TextAlign.center,
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 12,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(width: 20,),
//                   Container(
//                     width: 60,
//                     child: Column(
//                       children:
//                       [
//                         SizedBox(height: 15,),
//                         Stack(
//                           alignment: AlignmentDirectional.bottomEnd,
//                           children: [
//                             CircleAvatar(
//                               radius: 30.0,
//                               backgroundImage: NetworkImage('https://otakukart.com/wp-content/uploads/2021/02/gojo.jpg'),
//                             ),
//                             CircleAvatar(
//                               radius: 9,
//                               backgroundColor: Colors.black,
//                             ),
//                             Padding(
//                               padding: const EdgeInsetsDirectional.only(bottom: 3,end: 3),
//                               child: CircleAvatar(
//                                 radius: 6,
//                                 backgroundColor: Colors.green,
//                               ),
//                             ),
//                           ],
//                         ),
//                         SizedBox(height: 10,),
//                         Text(
//                           'Haitham Ghanemmmmmmmmmm',
//                           maxLines: 2,
//                           overflow: TextOverflow.ellipsis,
//                           textAlign: TextAlign.center,
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 12,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(width: 20,),
//                   Container(
//                     width: 60,
//                     child: Column(
//                       children:
//                       [
//                         SizedBox(height: 15,),
//                         Stack(
//                           alignment: AlignmentDirectional.bottomEnd,
//                           children: [
//                             CircleAvatar(
//                               radius: 30.0,
//                               backgroundImage: NetworkImage('https://otakukart.com/wp-content/uploads/2021/02/gojo.jpg'),
//                             ),
//                             CircleAvatar(
//                               radius: 9,
//                               backgroundColor: Colors.black,
//                             ),
//                             Padding(
//                               padding: const EdgeInsetsDirectional.only(bottom: 3,end: 3),
//                               child: CircleAvatar(
//                                 radius: 6,
//                                 backgroundColor: Colors.green,
//                               ),
//                             ),
//                           ],
//                         ),
//                         SizedBox(height: 10,),
//                         Text(
//                           'Haitham Ghanemmmmmmmmmm',
//                           maxLines: 2,
//                           overflow: TextOverflow.ellipsis,
//                           textAlign: TextAlign.center,
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 12,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(width: 20,),
//                   Container(
//                     width: 60,
//                     child: Column(
//                       children:
//                       [
//                         SizedBox(height: 15,),
//                         Stack(
//                           alignment: AlignmentDirectional.bottomEnd,
//                           children: [
//                             CircleAvatar(
//                               radius: 30.0,
//                               backgroundImage: NetworkImage('https://otakukart.com/wp-content/uploads/2021/02/gojo.jpg'),
//                             ),
//                             CircleAvatar(
//                               radius: 9,
//                               backgroundColor: Colors.black,
//                             ),
//                             Padding(
//                               padding: const EdgeInsetsDirectional.only(bottom: 3,end: 3),
//                               child: CircleAvatar(
//                                 radius: 6,
//                                 backgroundColor: Colors.green,
//                               ),
//                             ),
//                           ],
//                         ),
//                         SizedBox(height: 10,),
//                         Text(
//                           'Haitham Ghanemmmmmmmmmm',
//                           maxLines: 2,
//                           overflow: TextOverflow.ellipsis,
//                           textAlign: TextAlign.center,
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 12,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(width: 20,),
//                   Container(
//                     width: 60,
//                     child: Column(
//                       children:
//                       [
//                         SizedBox(height: 15,),
//                         Stack(
//                           alignment: AlignmentDirectional.bottomEnd,
//                           children: [
//                             CircleAvatar(
//                               radius: 30.0,
//                               backgroundImage: NetworkImage('https://otakukart.com/wp-content/uploads/2021/02/gojo.jpg'),
//                             ),
//                             CircleAvatar(
//                               radius: 9,
//                               backgroundColor: Colors.black,
//                             ),
//                             Padding(
//                               padding: const EdgeInsetsDirectional.only(bottom: 3,end: 3),
//                               child: CircleAvatar(
//                                 radius: 6,
//                                 backgroundColor: Colors.green,
//                               ),
//                             ),
//                           ],
//                         ),
//                         SizedBox(height: 10,),
//                         Text(
//                           'Haitham Ghanemmmmmmmmmm',
//                           maxLines: 2,
//                           overflow: TextOverflow.ellipsis,
//                           textAlign: TextAlign.center,
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 12,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(width: 20,),
//                   Container(
//                     width: 60,
//                     child: Column(
//                       children:
//                       [
//                         SizedBox(height: 15,),
//                         Stack(
//                           alignment: AlignmentDirectional.bottomEnd,
//                           children: [
//                             CircleAvatar(
//                               radius: 30.0,
//                               backgroundImage: NetworkImage('https://otakukart.com/wp-content/uploads/2021/02/gojo.jpg'),
//                             ),
//                             CircleAvatar(
//                               radius: 9,
//                               backgroundColor: Colors.black,
//                             ),
//                             Padding(
//                               padding: const EdgeInsetsDirectional.only(bottom: 3,end: 3),
//                               child: CircleAvatar(
//                                 radius: 6,
//                                 backgroundColor: Colors.green,
//                               ),
//                             ),
//                           ],
//                         ),
//                         SizedBox(height: 10,),
//                         Text(
//                           'Haitham Ghanemmmmmmmmmm',
//                           maxLines: 2,
//                           overflow: TextOverflow.ellipsis,
//                           textAlign: TextAlign.center,
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 12,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(width: 20,),
//                   Container(
//                     width: 60,
//                     child: Column(
//                       children:
//                       [
//                         SizedBox(height: 15,),
//                         Stack(
//                           alignment: AlignmentDirectional.bottomEnd,
//                           children: [
//                             CircleAvatar(
//                               radius: 30.0,
//                               backgroundImage: NetworkImage('https://otakukart.com/wp-content/uploads/2021/02/gojo.jpg'),
//                             ),
//                             CircleAvatar(
//                               radius: 9,
//                               backgroundColor: Colors.black,
//                             ),
//                             Padding(
//                               padding: const EdgeInsetsDirectional.only(bottom: 3,end: 3),
//                               child: CircleAvatar(
//                                 radius: 6,
//                                 backgroundColor: Colors.green,
//                               ),
//                             ),
//                           ],
//                         ),
//                         SizedBox(height: 10,),
//                         Text(
//                           'Haitham Ghanemmmmmmmmmm',
//                           maxLines: 2,
//                           overflow: TextOverflow.ellipsis,
//                           textAlign: TextAlign.center,
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 12,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(width: 20,),
//                   Container(
//                     width: 60,
//                     child: Column(
//                       children:
//                       [
//                         SizedBox(height: 15,),
//                         Stack(
//                           alignment: AlignmentDirectional.bottomEnd,
//                           children: [
//                             CircleAvatar(
//                               radius: 30.0,
//                               backgroundImage: NetworkImage('https://otakukart.com/wp-content/uploads/2021/02/gojo.jpg'),
//                             ),
//                             CircleAvatar(
//                               radius: 9,
//                               backgroundColor: Colors.black,
//                             ),
//                             Padding(
//                               padding: const EdgeInsetsDirectional.only(bottom: 3,end: 3),
//                               child: CircleAvatar(
//                                 radius: 6,
//                                 backgroundColor: Colors.green,
//                               ),
//                             ),
//                           ],
//                         ),
//                         SizedBox(height: 10,),
//                         Text(
//                           'Haitham Ghanemmmmmmmmmm',
//                           maxLines: 2,
//                           overflow: TextOverflow.ellipsis,
//                           textAlign: TextAlign.center,
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 12,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(width: 20,),
//                   Container(
//                     width: 60,
//                     child: Column(
//                       children:
//                       [
//                         SizedBox(height: 15,),
//                         Stack(
//                           alignment: AlignmentDirectional.bottomEnd,
//                           children: [
//                             CircleAvatar(
//                               radius: 30.0,
//                               backgroundImage: NetworkImage('https://otakukart.com/wp-content/uploads/2021/02/gojo.jpg'),
//                             ),
//                             CircleAvatar(
//                               radius: 9,
//                               backgroundColor: Colors.black,
//                             ),
//                             Padding(
//                               padding: const EdgeInsetsDirectional.only(bottom: 3,end: 3),
//                               child: CircleAvatar(
//                                 radius: 6,
//                                 backgroundColor: Colors.green,
//                               ),
//                             ),
//                           ],
//                         ),
//                         SizedBox(height: 10,),
//                         Text(
//                           'Haitham Ghanemmmmmmmmmm',
//                           maxLines: 2,
//                           overflow: TextOverflow.ellipsis,
//                           textAlign: TextAlign.center,
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 12,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(width: 20,),
//                   Container(
//                     width: 60,
//                     child: Column(
//                       children:
//                       [
//                         SizedBox(height: 15,),
//                         Stack(
//                           alignment: AlignmentDirectional.bottomEnd,
//                           children: [
//                             CircleAvatar(
//                               radius: 30.0,
//                               backgroundImage: NetworkImage('https://otakukart.com/wp-content/uploads/2021/02/gojo.jpg'),
//                             ),
//                             CircleAvatar(
//                               radius: 9,
//                               backgroundColor: Colors.black,
//                             ),
//                             Padding(
//                               padding: const EdgeInsetsDirectional.only(bottom: 3,end: 3),
//                               child: CircleAvatar(
//                                 radius: 6,
//                                 backgroundColor: Colors.green,
//                               ),
//                             ),
//                           ],
//                         ),
//                         SizedBox(height: 10,),
//                         Text(
//                           'Haitham Ghanemmmmmmmmmm',
//                           maxLines: 2,
//                           overflow: TextOverflow.ellipsis,
//                           textAlign: TextAlign.center,
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 12,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),//w da el stories

  //Expanded(
//
//               child: SingleChildScrollView(
//                 child: Column(
//                   children:
//                   [
//                     Row(
//                       children: [
//                         Stack(
//                           alignment: AlignmentDirectional.bottomEnd,
//                           children: [
//                             CircleAvatar(
//                               radius: 30.0,
//                               backgroundImage: NetworkImage('https://otakukart.com/wp-content/uploads/2021/02/gojo.jpg'),
//                             ),
//                             CircleAvatar(
//                               radius: 9,
//                               backgroundColor: Colors.black,
//                             ),
//                             Padding(
//                               padding: const EdgeInsetsDirectional.only(bottom: 3,end: 3),
//                               child: CircleAvatar(
//                                 radius: 6,
//                                 backgroundColor: Colors.green,
//                               ),
//                             ),
//                           ],
//                         ),
//                         SizedBox(width: 10,),
//                         Expanded(
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 'Haitham Ghanem',
//                                 overflow: TextOverflow.ellipsis,
//                                 maxLines: 1,
//                                 style: TextStyle(
//                                   color: Colors.grey,
//                                   fontSize: 16,
//                                 ),
//                               ),
//                               SizedBox(height: 5,),
//                               Row(
//                                 children: [
//                                   Expanded(
//                                     child: Text(
//                                       'You: Greetings from Haitham Mohamed Ghanem',
//                                       maxLines: 1,
//                                       overflow: TextOverflow.ellipsis,
//                                       style: TextStyle(
//                                         color: Colors.grey,
//                                         fontSize: 13,
//                                       ),
//                                     ),
//                                   ),
//                                   SizedBox(width: 5,),
//                                   Container(
//                                     width: 2,
//                                     height: 2,
//                                     decoration: BoxDecoration(
//                                       shape: BoxShape.circle,
//                                       color: Colors.white,
//                                     ),
//                                   ),
//                                   SizedBox(width: 5,),
//                                   Text(
//                                     '3:15 AM',
//                                     maxLines: 1,
//                                     overflow: TextOverflow.ellipsis,
//                                     style: TextStyle(
//                                       color: Colors.grey,
//                                       fontSize: 14,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),//da kda el item kamla eli feha el chat bl kalam eli gwah mn barra
//                     SizedBox(height: 20,),
//                     Row(
//                       children: [
//                         Stack(
//                           alignment: AlignmentDirectional.bottomEnd,
//                           children: [
//                             CircleAvatar(
//                               radius: 30.0,
//                               backgroundImage: NetworkImage('https://otakukart.com/wp-content/uploads/2021/02/gojo.jpg'),
//                             ),
//                             CircleAvatar(
//                               radius: 9,
//                               backgroundColor: Colors.black,
//                             ),
//                             Padding(
//                               padding: const EdgeInsetsDirectional.only(bottom: 3,end: 3),
//                               child: CircleAvatar(
//                                 radius: 6,
//                                 backgroundColor: Colors.green,
//                               ),
//                             ),
//                           ],
//                         ),
//                         SizedBox(width: 10,),
//                         Expanded(
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 'Haitham Ghanem',
//                                 overflow: TextOverflow.ellipsis,
//                                 maxLines: 1,
//                                 style: TextStyle(
//                                   color: Colors.grey,
//                                   fontSize: 16,
//                                 ),
//                               ),
//                               SizedBox(height: 5,),
//                               Row(
//                                 children: [
//                                   Expanded(
//                                     child: Text(
//                                       'You: Greetings from Haitham Mohamed Ghanem',
//                                       maxLines: 1,
//                                       overflow: TextOverflow.ellipsis,
//                                       style: TextStyle(
//                                         color: Colors.grey,
//                                         fontSize: 13,
//                                       ),
//                                     ),
//                                   ),
//                                   SizedBox(width: 5,),
//                                   Container(
//                                     width: 2,
//                                     height: 2,
//                                     decoration: BoxDecoration(
//                                       shape: BoxShape.circle,
//                                       color: Colors.white,
//                                     ),
//                                   ),
//                                   SizedBox(width: 5,),
//                                   Text(
//                                     '3:15 AM',
//                                     maxLines: 1,
//                                     overflow: TextOverflow.ellipsis,
//                                     style: TextStyle(
//                                       color: Colors.grey,
//                                       fontSize: 14,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: 20,),
//                     Row(
//                       children: [
//                         Stack(
//                           alignment: AlignmentDirectional.bottomEnd,
//                           children: [
//                             CircleAvatar(
//                               radius: 30.0,
//                               backgroundImage: NetworkImage('https://otakukart.com/wp-content/uploads/2021/02/gojo.jpg'),
//                             ),
//                             CircleAvatar(
//                               radius: 9,
//                               backgroundColor: Colors.black,
//                             ),
//                             Padding(
//                               padding: const EdgeInsetsDirectional.only(bottom: 3,end: 3),
//                               child: CircleAvatar(
//                                 radius: 6,
//                                 backgroundColor: Colors.green,
//                               ),
//                             ),
//                           ],
//                         ),
//                         SizedBox(width: 10,),
//                         Expanded(
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 'Haitham Ghanem',
//                                 overflow: TextOverflow.ellipsis,
//                                 maxLines: 1,
//                                 style: TextStyle(
//                                   color: Colors.grey,
//                                   fontSize: 16,
//                                 ),
//                               ),
//                               SizedBox(height: 5,),
//                               Row(
//                                 children: [
//                                   Expanded(
//                                     child: Text(
//                                       'You: Greetings from Haitham Mohamed Ghanem',
//                                       maxLines: 1,
//                                       overflow: TextOverflow.ellipsis,
//                                       style: TextStyle(
//                                         color: Colors.grey,
//                                         fontSize: 13,
//                                       ),
//                                     ),
//                                   ),
//                                   SizedBox(width: 5,),
//                                   Container(
//                                     width: 2,
//                                     height: 2,
//                                     decoration: BoxDecoration(
//                                       shape: BoxShape.circle,
//                                       color: Colors.white,
//                                     ),
//                                   ),
//                                   SizedBox(width: 5,),
//                                   Text(
//                                     '3:15 AM',
//                                     maxLines: 1,
//                                     overflow: TextOverflow.ellipsis,
//                                     style: TextStyle(
//                                       color: Colors.grey,
//                                       fontSize: 14,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: 20,),
//                     Row(
//                       children: [
//                         Stack(
//                           alignment: AlignmentDirectional.bottomEnd,
//                           children: [
//                             CircleAvatar(
//                               radius: 30.0,
//                               backgroundImage: NetworkImage('https://otakukart.com/wp-content/uploads/2021/02/gojo.jpg'),
//                             ),
//                             CircleAvatar(
//                               radius: 9,
//                               backgroundColor: Colors.black,
//                             ),
//                             Padding(
//                               padding: const EdgeInsetsDirectional.only(bottom: 3,end: 3),
//                               child: CircleAvatar(
//                                 radius: 6,
//                                 backgroundColor: Colors.green,
//                               ),
//                             ),
//                           ],
//                         ),
//                         SizedBox(width: 10,),
//                         Expanded(
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 'Haitham Ghanem',
//                                 overflow: TextOverflow.ellipsis,
//                                 maxLines: 1,
//                                 style: TextStyle(
//                                   color: Colors.grey,
//                                   fontSize: 16,
//                                 ),
//                               ),
//                               SizedBox(height: 5,),
//                               Row(
//                                 children: [
//                                   Expanded(
//                                     child: Text(
//                                       'You: Greetings from Haitham Mohamed Ghanem',
//                                       maxLines: 1,
//                                       overflow: TextOverflow.ellipsis,
//                                       style: TextStyle(
//                                         color: Colors.grey,
//                                         fontSize: 13,
//                                       ),
//                                     ),
//                                   ),
//                                   SizedBox(width: 5,),
//                                   Container(
//                                     width: 2,
//                                     height: 2,
//                                     decoration: BoxDecoration(
//                                       shape: BoxShape.circle,
//                                       color: Colors.white,
//                                     ),
//                                   ),
//                                   SizedBox(width: 5,),
//                                   Text(
//                                     '3:15 AM',
//                                     maxLines: 1,
//                                     overflow: TextOverflow.ellipsis,
//                                     style: TextStyle(
//                                       color: Colors.grey,
//                                       fontSize: 14,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: 20,),
//                     Row(
//                       children: [
//                         Stack(
//                           alignment: AlignmentDirectional.bottomEnd,
//                           children: [
//                             CircleAvatar(
//                               radius: 30.0,
//                               backgroundImage: NetworkImage('https://otakukart.com/wp-content/uploads/2021/02/gojo.jpg'),
//                             ),
//                             CircleAvatar(
//                               radius: 9,
//                               backgroundColor: Colors.black,
//                             ),
//                             Padding(
//                               padding: const EdgeInsetsDirectional.only(bottom: 3,end: 3),
//                               child: CircleAvatar(
//                                 radius: 6,
//                                 backgroundColor: Colors.green,
//                               ),
//                             ),
//                           ],
//                         ),
//                         SizedBox(width: 10,),
//                         Expanded(
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 'Haitham Ghanem',
//                                 overflow: TextOverflow.ellipsis,
//                                 maxLines: 1,
//                                 style: TextStyle(
//                                   color: Colors.grey,
//                                   fontSize: 16,
//                                 ),
//                               ),
//                               SizedBox(height: 5,),
//                               Row(
//                                 children: [
//                                   Expanded(
//                                     child: Text(
//                                       'You: Greetings from Haitham Mohamed Ghanem',
//                                       maxLines: 1,
//                                       overflow: TextOverflow.ellipsis,
//                                       style: TextStyle(
//                                         color: Colors.grey,
//                                         fontSize: 13,
//                                       ),
//                                     ),
//                                   ),
//                                   SizedBox(width: 5,),
//                                   Container(
//                                     width: 2,
//                                     height: 2,
//                                     decoration: BoxDecoration(
//                                       shape: BoxShape.circle,
//                                       color: Colors.white,
//                                     ),
//                                   ),
//                                   SizedBox(width: 5,),
//                                   Text(
//                                     '3:15 AM',
//                                     maxLines: 1,
//                                     overflow: TextOverflow.ellipsis,
//                                     style: TextStyle(
//                                       color: Colors.grey,
//                                       fontSize: 14,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: 20,),
//                     Row(
//                       children: [
//                         Stack(
//                           alignment: AlignmentDirectional.bottomEnd,
//                           children: [
//                             CircleAvatar(
//                               radius: 30.0,
//                               backgroundImage: NetworkImage('https://otakukart.com/wp-content/uploads/2021/02/gojo.jpg'),
//                             ),
//                             CircleAvatar(
//                               radius: 9,
//                               backgroundColor: Colors.black,
//                             ),
//                             Padding(
//                               padding: const EdgeInsetsDirectional.only(bottom: 3,end: 3),
//                               child: CircleAvatar(
//                                 radius: 6,
//                                 backgroundColor: Colors.green,
//                               ),
//                             ),
//                           ],
//                         ),
//                         SizedBox(width: 10,),
//                         Expanded(
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 'Haitham Ghanem',
//                                 overflow: TextOverflow.ellipsis,
//                                 maxLines: 1,
//                                 style: TextStyle(
//                                   color: Colors.grey,
//                                   fontSize: 16,
//                                 ),
//                               ),
//                               SizedBox(height: 5,),
//                               Row(
//                                 children: [
//                                   Expanded(
//                                     child: Text(
//                                       'You: Greetings from Haitham Mohamed Ghanem',
//                                       maxLines: 1,
//                                       overflow: TextOverflow.ellipsis,
//                                       style: TextStyle(
//                                         color: Colors.grey,
//                                         fontSize: 13,
//                                       ),
//                                     ),
//                                   ),
//                                   SizedBox(width: 5,),
//                                   Container(
//                                     width: 2,
//                                     height: 2,
//                                     decoration: BoxDecoration(
//                                       shape: BoxShape.circle,
//                                       color: Colors.white,
//                                     ),
//                                   ),
//                                   SizedBox(width: 5,),
//                                   Text(
//                                     '3:15 AM',
//                                     maxLines: 1,
//                                     overflow: TextOverflow.ellipsis,
//                                     style: TextStyle(
//                                       color: Colors.grey,
//                                       fontSize: 14,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: 20,),
//                     Row(
//                       children: [
//                         Stack(
//                           alignment: AlignmentDirectional.bottomEnd,
//                           children: [
//                             CircleAvatar(
//                               radius: 30.0,
//                               backgroundImage: NetworkImage('https://otakukart.com/wp-content/uploads/2021/02/gojo.jpg'),
//                             ),
//                             CircleAvatar(
//                               radius: 9,
//                               backgroundColor: Colors.black,
//                             ),
//                             Padding(
//                               padding: const EdgeInsetsDirectional.only(bottom: 3,end: 3),
//                               child: CircleAvatar(
//                                 radius: 6,
//                                 backgroundColor: Colors.green,
//                               ),
//                             ),
//                           ],
//                         ),
//                         SizedBox(width: 10,),
//                         Expanded(
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 'Haitham Ghanem',
//                                 overflow: TextOverflow.ellipsis,
//                                 maxLines: 1,
//                                 style: TextStyle(
//                                   color: Colors.grey,
//                                   fontSize: 16,
//                                 ),
//                               ),
//                               SizedBox(height: 5,),
//                               Row(
//                                 children: [
//                                   Expanded(
//                                     child: Text(
//                                       'You: Greetings from Haitham Mohamed Ghanem',
//                                       maxLines: 1,
//                                       overflow: TextOverflow.ellipsis,
//                                       style: TextStyle(
//                                         color: Colors.grey,
//                                         fontSize: 13,
//                                       ),
//                                     ),
//                                   ),
//                                   SizedBox(width: 5,),
//                                   Container(
//                                     width: 2,
//                                     height: 2,
//                                     decoration: BoxDecoration(
//                                       shape: BoxShape.circle,
//                                       color: Colors.white,
//                                     ),
//                                   ),
//                                   SizedBox(width: 5,),
//                                   Text(
//                                     '3:15 AM',
//                                     maxLines: 1,
//                                     overflow: TextOverflow.ellipsis,
//                                     style: TextStyle(
//                                       color: Colors.grey,
//                                       fontSize: 14,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: 20,),
//                     Row(
//                       children: [
//                         Stack(
//                           alignment: AlignmentDirectional.bottomEnd,
//                           children: [
//                             CircleAvatar(
//                               radius: 30.0,
//                               backgroundImage: NetworkImage('https://otakukart.com/wp-content/uploads/2021/02/gojo.jpg'),
//                             ),
//                             CircleAvatar(
//                               radius: 9,
//                               backgroundColor: Colors.black,
//                             ),
//                             Padding(
//                               padding: const EdgeInsetsDirectional.only(bottom: 3,end: 3),
//                               child: CircleAvatar(
//                                 radius: 6,
//                                 backgroundColor: Colors.green,
//                               ),
//                             ),
//                           ],
//                         ),
//                         SizedBox(width: 10,),
//                         Expanded(
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 'Haitham Ghanem',
//                                 overflow: TextOverflow.ellipsis,
//                                 maxLines: 1,
//                                 style: TextStyle(
//                                   color: Colors.grey,
//                                   fontSize: 16,
//                                 ),
//                               ),
//                               SizedBox(height: 5,),
//                               Row(
//                                 children: [
//                                   Expanded(
//                                     child: Text(
//                                       'You: Greetings from Haitham Mohamed Ghanem',
//                                       maxLines: 1,
//                                       overflow: TextOverflow.ellipsis,
//                                       style: TextStyle(
//                                         color: Colors.grey,
//                                         fontSize: 13,
//                                       ),
//                                     ),
//                                   ),
//                                   SizedBox(width: 5,),
//                                   Container(
//                                     width: 2,
//                                     height: 2,
//                                     decoration: BoxDecoration(
//                                       shape: BoxShape.circle,
//                                       color: Colors.white,
//                                     ),
//                                   ),
//                                   SizedBox(width: 5,),
//                                   Text(
//                                     '3:15 AM',
//                                     maxLines: 1,
//                                     overflow: TextOverflow.ellipsis,
//                                     style: TextStyle(
//                                       color: Colors.grey,
//                                       fontSize: 14,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: 20,),
//                     Row(
//                       children: [
//                         Stack(
//                           alignment: AlignmentDirectional.bottomEnd,
//                           children: [
//                             CircleAvatar(
//                               radius: 30.0,
//                               backgroundImage: NetworkImage('https://otakukart.com/wp-content/uploads/2021/02/gojo.jpg'),
//                             ),
//                             CircleAvatar(
//                               radius: 9,
//                               backgroundColor: Colors.black,
//                             ),
//                             Padding(
//                               padding: const EdgeInsetsDirectional.only(bottom: 3,end: 3),
//                               child: CircleAvatar(
//                                 radius: 6,
//                                 backgroundColor: Colors.green,
//                               ),
//                             ),
//                           ],
//                         ),
//                         SizedBox(width: 10,),
//                         Expanded(
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 'Haitham Ghanem',
//                                 overflow: TextOverflow.ellipsis,
//                                 maxLines: 1,
//                                 style: TextStyle(
//                                   color: Colors.grey,
//                                   fontSize: 16,
//                                 ),
//                               ),
//                               SizedBox(height: 5,),
//                               Row(
//                                 children: [
//                                   Expanded(
//                                     child: Text(
//                                       'You: Greetings from Haitham Mohamed Ghanem',
//                                       maxLines: 1,
//                                       overflow: TextOverflow.ellipsis,
//                                       style: TextStyle(
//                                         color: Colors.grey,
//                                         fontSize: 13,
//                                       ),
//                                     ),
//                                   ),
//                                   SizedBox(width: 5,),
//                                   Container(
//                                     width: 2,
//                                     height: 2,
//                                     decoration: BoxDecoration(
//                                       shape: BoxShape.circle,
//                                       color: Colors.white,
//                                     ),
//                                   ),
//                                   SizedBox(width: 5,),
//                                   Text(
//                                     '3:15 AM',
//                                     maxLines: 1,
//                                     overflow: TextOverflow.ellipsis,
//                                     style: TextStyle(
//                                       color: Colors.grey,
//                                       fontSize: 14,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: 20,),
//                     Row(
//                       children: [
//                         Stack(
//                           alignment: AlignmentDirectional.bottomEnd,
//                           children: [
//                             CircleAvatar(
//                               radius: 30.0,
//                               backgroundImage: NetworkImage('https://otakukart.com/wp-content/uploads/2021/02/gojo.jpg'),
//                             ),
//                             CircleAvatar(
//                               radius: 9,
//                               backgroundColor: Colors.black,
//                             ),
//                             Padding(
//                               padding: const EdgeInsetsDirectional.only(bottom: 3,end: 3),
//                               child: CircleAvatar(
//                                 radius: 6,
//                                 backgroundColor: Colors.green,
//                               ),
//                             ),
//                           ],
//                         ),
//                         SizedBox(width: 10,),
//                         Expanded(
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 'Haitham Ghanem',
//                                 overflow: TextOverflow.ellipsis,
//                                 maxLines: 1,
//                                 style: TextStyle(
//                                   color: Colors.grey,
//                                   fontSize: 16,
//                                 ),
//                               ),
//                               SizedBox(height: 5,),
//                               Row(
//                                 children: [
//                                   Expanded(
//                                     child: Text(
//                                       'You: Greetings from Haitham Mohamed Ghanem',
//                                       maxLines: 1,
//                                       overflow: TextOverflow.ellipsis,
//                                       style: TextStyle(
//                                         color: Colors.grey,
//                                         fontSize: 13,
//                                       ),
//                                     ),
//                                   ),
//                                   SizedBox(width: 5,),
//                                   Container(
//                                     width: 2,
//                                     height: 2,
//                                     decoration: BoxDecoration(
//                                       shape: BoxShape.circle,
//                                       color: Colors.white,
//                                     ),
//                                   ),
//                                   SizedBox(width: 5,),
//                                   Text(
//                                     '3:15 AM',
//                                     maxLines: 1,
//                                     overflow: TextOverflow.ellipsis,
//                                     style: TextStyle(
//                                       color: Colors.grey,
//                                       fontSize: 14,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),//da el column eli shayel el item bta3t el chat
}
