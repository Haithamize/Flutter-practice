import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/layout/shop_app/cubit/shop_cubit.dart';
import 'package:flutter_app/layout/shop_app/cubit/shop_states.dart';
import 'package:flutter_app/modules/shop_app/my_basket/my_basket_screen.dart';
import 'package:flutter_app/modules/shop_app/search/shop_search_screen.dart';
import 'package:flutter_app/modules/shop_app/shop_login/shop_login_screen.dart';
import 'package:flutter_app/network/local/cache_sharedpref.dart';
import 'package:flutter_app/shared/components/components.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../../main.dart';

class ShopLayout extends StatefulWidget {
  //el comment eli t7t da bta3 el signout



  @override
  State<ShopLayout> createState() => _ShopLayoutState();
}

class _ShopLayoutState extends State<ShopLayout> with SingleTickerProviderStateMixin {

  // Animation<double> animation;
  // AnimationController controller;
  @override
  void initState() {
    //initiallize animation
    // controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 5000));
    // animation = Tween(begin: 0.0, end: 300.0).animate(controller);
    // controller.forward();
    super.initState();
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification notification = message.notification;
      AndroidNotification android = message.notification?.android;
      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel.id,
                channel.name,
                channel.description,
                color: Colors.blue,
                playSound: true,
                icon: '@mipmap/ic_launcher',
              ),
            ));
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('A new onMessageOpenedApp event was published!');
      RemoteNotification notification = message.notification;
      AndroidNotification android = message.notification?.android;
      if (notification != null && android != null) {
        showDialog(
            context: context,
            builder: (_) {
              return AlertDialog(
                title: Text(notification.title),
                content: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [Text(notification.body)],
                  ),
                ),
              );
            });
      }
    });
  }



  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit , ShopStates>(
      listener: (context, state){},
      builder: (context, state){
        var cubit = ShopCubit.get(context);
        var screenList = cubit.list;
        var bottomNavItems = cubit.bottomNavItems;
        return Scaffold(
          appBar: AppBar(
            title: Text('Zumra'),
            backgroundColor: Colors.white,
            actions:
            [
              IconButton(icon: Icon(Icons.search,color: Colors.black,),
                  onPressed: (){
                    navigateTo(context, ShopSearchScreen());
                  }),
              IconButton(
                  onPressed: (){
                    navigateTo(context, MyBasketScreen());
                    ShopCubit.get(context).loadCartItems();
                  },
                  icon: Icon(Icons.shopping_cart, color: Colors.black,)),
            ],
          ),
          body: screenList[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            items: bottomNavItems,
            onTap: (index){
              cubit.changeBottomNavState(index,context);
            },
            currentIndex: cubit.currentIndex,

          ),
        );
      },
    );
  }
}
