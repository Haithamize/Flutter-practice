import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/layout/news_app/cubit/news_cubit.dart';
import 'package:flutter_app/layout/news_app/news_layout.dart';
import 'package:flutter_app/layout/shop_app/cubit/shop_cubit.dart';
import 'package:flutter_app/layout/shop_app/shop_layout.dart';
import 'package:flutter_app/layout/todo_app/home_layout.dart';
import 'package:flutter_app/modules/counter/stateful_example.dart';
import 'package:flutter_app/modules/shop_app/on_boarding/on_boarding_screen.dart';
import 'package:flutter_app/modules/shop_app/shop_login/shop_login_screen.dart';
import 'package:flutter_app/modules/todo/new_tasks_screen.dart';
import 'package:flutter_app/network/local/cache_sharedpref.dart';
import 'package:flutter_app/network/remote/dio_helper.dart';
import 'package:flutter_app/shared/bloc_observer.dart';
import 'package:flutter_app/shared/components/constants.dart';
import 'package:flutter_app/shared/cubit/cubit.dart';
import 'package:flutter_app/shared/cubit/states.dart';
import 'package:flutter_app/styles/themes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();

  bool isLight = CacheHelper.getBool('isLight');

  bool onBoarding = CacheHelper.getData('onBoarding');

  print(onBoarding);

    token = CacheHelper.getData('token');

  Widget widget;
  if(onBoarding != null){ //el condition da m3nah en el user 3ada el onBoarding 5las
    if(token != null) {//w hna m3nah eno ra7 el login screen w kan successfull w m3ah token
      widget = ShopLayout();
    }else{
      widget = ShopLoginScreen();
    }
  }else{//hna lw m3dash mn el onBoarding screen
    widget = OnBoardingScreen();
  }

  runApp(MyApp(isLight,widget));
}

class MyApp extends StatelessWidget {

  final bool isLight;
  final Widget startWidget;

  MyApp(this.isLight, this.startWidget);

  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(
      providers:
      [
        BlocProvider(create: (context) => NewsCubit()..getBusiness()),
        BlocProvider(create: (BuildContext context) => AppCubit()..changeTheme(fromSharedPrefValue: isLight),),
        BlocProvider(create: (BuildContext context) => ShopCubit()..getHomeDataFromApi()..getCategoriesDataFromApi()),
      ],
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context,state){},
        builder: (context,state){
          return RefreshConfiguration(
            headerBuilder: () => WaterDropHeader(),        // Configure the default header indicator. If you have the same header indicator for each page, you need to set this
            footerBuilder:  () => ClassicFooter(),        // Configure default bottom indicator
            headerTriggerDistance: 80.0,        // header trigger refresh trigger distance
            springDescription:SpringDescription(stiffness: 170, damping: 16, mass: 1.9),         // custom spring back animate,the props meaning see the flutter api
            maxOverScrollExtent :100, //The maximum dragging range of the head. Set this property if a rush out of the view area occurs
            maxUnderScrollExtent:0, // Maximum dragging range at the bottom
            enableScrollWhenRefreshCompleted: true, //This property is incompatible with PageView and TabBarView. If you need TabBarView to slide left and right, you need to set it to true.
            enableLoadingWhenFailed : true, //In the case of load failure, users can still trigger more loads by gesture pull-up.
            hideFooterWhenNotFull: false, // Disable pull-up to load more functionality when Viewport is less than one screen
            enableBallisticLoad: true,
            child: MaterialApp(
              debugShowCheckedModeBanner: false,

              home: startWidget,
              theme: lightTheme,

              darkTheme: darkTheme,

              themeMode: AppCubit.get(context).isLightTheme? ThemeMode.light : ThemeMode.dark,
            ),
          );
        },
      ),
    );
  }
}
