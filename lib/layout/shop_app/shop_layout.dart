import 'package:flutter/material.dart';
import 'package:flutter_app/layout/shop_app/cubit/shop_cubit.dart';
import 'package:flutter_app/layout/shop_app/cubit/shop_states.dart';
import 'package:flutter_app/modules/shop_app/search/shop_search_screen.dart';
import 'package:flutter_app/modules/shop_app/shop_login/shop_login_screen.dart';
import 'package:flutter_app/network/local/cache_sharedpref.dart';
import 'package:flutter_app/shared/components/components.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShopLayout extends StatelessWidget {
  //el comment eli t7t da bta3 el signout



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
