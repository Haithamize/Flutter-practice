import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/layout/news_app/cubit/news_states.dart';
import 'package:flutter_app/modules/news_app_modules/business/business_screen.dart';
import 'package:flutter_app/modules/news_app_modules/science/science_screen.dart';
import 'package:flutter_app/modules/news_app_modules/settings/settings_screen.dart';
import 'package:flutter_app/modules/news_app_modules/sports/sports_screen.dart';
import 'package:flutter_app/network/remote/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialState());

  List<BottomNavigationBarItem> bottomNavItems = [
    BottomNavigationBarItem(icon: Icon(Icons.business), label: 'Business'),
    BottomNavigationBarItem(icon: Icon(Icons.sports), label: 'Sports'),
    BottomNavigationBarItem(icon: Icon(Icons.science), label: 'Science'),
  ];

  List<Widget> listOfScreens = [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
  ];

  List<Widget> titles = [
    Text('Business'),
    Text('Sports'),
    Text('Science'),
  ];

  List<dynamic> business =
      []; //de htb2a el list eli h3ml feha save lel response eli gyli ml server f shakl list of map, bs h3mlha List<dynamic> 3shan mydnesh error
  List<dynamic> science = [];
  List<dynamic> sports = [];

  List<dynamic> search = [];

  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  void changeBottomNavState(index) {
    if (index == 1) {
      getSports();
    }
    if (index == 2) {
      getScience();
    }
    currentIndex = index;
    emit(NewsBottomNavStates());
  }

  void getBusiness() {
    emit(
        NewsGetBusinessLoadingState()); //tb3n ana 3ayz awl state tb2a el loading abl magip el data

    if (business.length == 0) {
      DioHelper.getData('v2/top-headlines', query:{
        'country': 'eg',
        'category': 'business',
        'apiKey': 'f26f38211b234181a30a8ac2430e7679',
      }).then((value) {
        print(value.data['articles'][0]['urlToImage']);
        business = value.data[
            'articles']; //tb3n hna ana ha5od el list of articles eli 3yzha fl list bt3ti w la7z en el value.data da el response kolo 3la shakl map fna 3mlt access 3la el key elu 3yzo eli hwa el articles eli hya list of map brdo
        emit(
            NewsGetBusinessSuccessState()); // w tb3n ha3ml emit lel success state f 7alet en raga3li response
      }).catchError((error) {
        print(error.toString());
        emit(NewsGetBusinessErrorState(error.toString())); // w tb3n ha3ml emit lel error state f 7alet en raga3li error w hb3t el error msg lel state de 3shan a2dr a3ml access 3leha fl ui lw e7tgtha
      });
    } else {
      emit(NewsGetBusinessSuccessState());
    }
  }

  void getSports() {
    emit(
        NewsGetSportsLoadingState()); //tb3n ana 3ayz awl state tb2a el loading abl magip el data

    if (sports.length == 0) {
      //3mlt el condition da 3shan msh 3ayz kol mara ados 3la ay tab fehom afdl a3id w azid fl states bt3ty
      DioHelper.getData('v2/top-headlines', query: {
        'country': 'eg',
        'category': 'sports',
        'apiKey': 'f26f38211b234181a30a8ac2430e7679',
      }).then((value) {
        print(value.data['articles'][0]['urlToImage']);
        sports = value.data[
            'articles']; //tb3n hna ana ha5od el list of articles eli 3yzha fl list bt3ti w la7z en el value.data da el response kolo 3la shakl map fna 3mlt access 3la el key elu 3yzo eli hwa el articles eli hya list of map brdo
        emit(
            NewsGetSportsSuccessState()); // w tb3n ha3ml emit lel success state f 7alet en raga3li response
      }).catchError((error) {
        print(error.toString());
        emit(NewsGetSportsErrorState(error
            .toString())); // w tb3n ha3ml emit lel error state f 7alet en raga3li error w hb3t el error msg lel state de 3shan a2dr a3ml access 3leha fl ui lw e7tgtha
      });
    } else {
      emit(NewsGetSportsSuccessState());
    }
  }

  void getScience() {
    emit(
        NewsGetScienceLoadingState()); //tb3n ana 3ayz awl state tb2a el loading abl magip el data
    if (science.length == 0) {
      DioHelper.getData('v2/top-headlines',query: {
        'country': 'eg',
        'category': 'science',
        'apiKey': 'f26f38211b234181a30a8ac2430e7679',
      }).then((value) {
        print(value.data['articles'][0]['urlToImage']);
        science = value.data[
            'articles']; //tb3n hna ana ha5od el list of articles eli 3yzha fl list bt3ti w la7z en el value.data da el response kolo 3la shakl map fna 3mlt access 3la el key elu 3yzo eli hwa el articles eli hya list of map brdo
        emit(
            NewsGetScienceSuccessState()); // w tb3n ha3ml emit lel success state f 7alet en raga3li response
      }).catchError((error) {
        print(error.toString());
        emit(NewsGetScienceErrorState(error
            .toString())); // w tb3n ha3ml emit lel error state f 7alet en raga3li error w hb3t el error msg lel state de 3shan a2dr a3ml access 3leha fl ui lw e7tgtha
      });
    } else {
      emit(NewsGetScienceSuccessState());
    }
  }


  void getSearch(String value) {
    emit(
        NewsGetSearchLoadingState()); //tb3n ana 3ayz awl state tb2a el loading abl magip el data

      DioHelper.getData('v2/everything',query: {
        'q': '$value',
        'apiKey': 'f26f38211b234181a30a8ac2430e7679',
      }).then((value) {
        print(value.data['articles'][0]['urlToImage']);
        search = value.data[
        'articles']; //tb3n hna ana ha5od el list of articles eli 3yzha fl list bt3ti w la7z en el value.data da el response kolo 3la shakl map fna 3mlt access 3la el key elu 3yzo eli hwa el articles eli hya list of map brdo
        emit(
            NewsGetSearchSuccessState()); // w tb3n ha3ml emit lel success state f 7alet en raga3li response
      }).catchError((error) {
        print(error.toString());
        emit(NewsGetSearchErrorState(error
            .toString())); // w tb3n ha3ml emit lel error state f 7alet en raga3li error w hb3t el error msg lel state de 3shan a2dr a3ml access 3leha fl ui lw e7tgtha
      });
  }
}
