import 'package:flutter/material.dart';
import 'package:flutter_app/layout/news_app/cubit/news_cubit.dart';
import 'package:flutter_app/modules/news_app_modules/search_module_news_app/search_screen.dart';
import 'package:flutter_app/network/local/cache_sharedpref.dart';
import 'package:flutter_app/network/remote/dio_helper.dart';
import 'package:flutter_app/shared/components/components.dart';
import 'package:flutter_app/shared/cubit/cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/news_states.dart';

class NewsLayout extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context, state){},
      builder: (context, state){
        var cubit = NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: cubit.titles[cubit.currentIndex],
            actions:
            [
              IconButton(
                  icon: Icon(Icons.search),
                  onPressed: (){
                    navigateTo(context, SearchScreen());
                  }),
              IconButton(
                  icon: Icon(Icons.brightness_4),
                  onPressed: (){
                    AppCubit.get(context).changeTheme();
                  }),
            ],
          ),
          body: cubit.listOfScreens[cubit.currentIndex],

          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            items: cubit.bottomNavItems,
            currentIndex: cubit.currentIndex,
            onTap: (index){
              cubit.changeBottomNavState(index);
            },
          ),
        );
      },
    );
  }
}
