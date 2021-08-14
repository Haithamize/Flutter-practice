import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/layout/shop_app/cubit/shop_states.dart';
import 'package:flutter_app/models/shop_app/basket_model.dart';
import 'package:flutter_app/models/shop_app/shop_categories_model.dart';
import 'package:flutter_app/models/shop_app/shop_home_model.dart';
import 'package:flutter_app/models/shop_app/shop_login_model.dart';
import 'package:flutter_app/models/shop_app/shop_settings_model.dart';
import 'package:flutter_app/modules/shop_app/categories/shop_categories_screen.dart';
import 'package:flutter_app/modules/shop_app/favorites/shop_favorites_screen.dart';
import 'package:flutter_app/modules/shop_app/home/shop_home_screen.dart';
import 'package:flutter_app/modules/shop_app/register/cubit/register_cubit.dart';
import 'package:flutter_app/modules/shop_app/search/shop_search_screen.dart';
import 'package:flutter_app/modules/shop_app/settings/shop_settings_screen.dart';
import 'package:flutter_app/network/remote/dio_helper.dart';
import 'package:flutter_app/shared/components/components.dart';
import 'package:flutter_app/shared/components/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShopCubit extends Cubit<ShopStates>{
  ShopCubit() : super(ShopInitialState());

  static ShopCubit get(context) => BlocProvider.of(context);

  int page = 1;


  int currentIndex = 0;
  List<Widget> list =
  [
    ShopHomeScreen(),
    ShopFavoritesScreen(),
    ShopCategoriesScreen(),
    ShopSettingsScreen(),
  ];

  List<BottomNavigationBarItem> bottomNavItems = [
    BottomNavigationBarItem(icon:Icon(Icons.home) , label: 'Home'),
    BottomNavigationBarItem(icon:Icon(Icons.favorite_border_outlined) , label: 'Favorites'),
    BottomNavigationBarItem(icon:Icon(Icons.category_outlined) , label: 'Categories'),
    BottomNavigationBarItem(icon:Icon(Icons.settings) , label: 'Settings'),
  ];

  void changeBottomNavState(int index,context){
    currentIndex = index;
    if(currentIndex == 3 ){
      ShopCubit.get(context).getUserDataFromApi();
    }
    emit(ShopChangeBottomNavState());
  }

  bool isFavorite = false;

  changeColorOfFavoriteIcon(int id){
    isFavorite = !isFavorite;
    emit(ShopChangeFavoriteIcon());
  }


  ShopHomeModel shopHomeModel;
  List<Docs> oldAndNewItems = [];

  Future<bool> getHomeDataFromApi() async{
    emit(ShopHomeLoadingState());
    await DioHelper.getData(HOME_ZUMRA, token: token, query: {
      'itemsPerPage': 10,
      'page': page,
    }).then((value) {

      shopHomeModel = ShopHomeModel.fromJson(value.data);

      // printFullText(shopHomeModel.docs[0].id.toString());
      shopHomeModel.docs.forEach((element) {
        oldAndNewItems.add(element);
      });
      // oldAndNewItems.add(shopHomeModel.docs);
      page++;
      print(page);
      emit(ShopHomeSuccessState());
      return true;
    }).catchError((error){
      print(error.toString());
      emit(ShopHomeErrorState(error.toString()));
      return false;
    });
    return true;
  }


  ShopCategoriesModel shopCategoriesModel;

   getCategoriesDataFromApi() async{
    await DioHelper.getData(CATEGORIES_ZUMRA,).then((value) {

      shopCategoriesModel = ShopCategoriesModel.fromJson(value.data);
      // printFullText(value.data.toString());

      emit(ShopCategoriesSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(ShopCategoriesErrorState(error.toString()));
    });
  }


  UserModel userData;

  getUserDataFromApi() async{
    emit(ShopUserLoadingState());
    await DioHelper.getData(USER_ZUMRA,token: token).then((value) {

      userData = UserModel.fromJson(value.data);
      printFullText(value.data.toString());

      emit(ShopUserSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(ShopUserErrorState(error.toString()));
    });
  }

  updateUserData({
    @required firstName,
    @required lastName,
    @required email,
    @required mobile,
}) async{
    emit(ShopUserUpdateDataLoadingState());
    await DioHelper.put(
        path: USER_UPDATE_DATA_ZUMRA,
        token: token,
        data: {
          'firstName':'$firstName',
          'lastName':'$lastName',
          'email':'$email',
          'mobile':'$mobile',
        },
    ).then((value) {

      userData = UserModel.fromJson(value.data);
      printFullText(value.data.toString());


      emit(ShopUserUpdateDataSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(ShopUserUpdateDataErrorState(error.toString()));
    });
  }



  ShopHomeModel shopSearchModel;
  List<Docs> listOfSearchedItems = [];

  getSearchedDataFromApi(String search) async{
    emit(ShopSearchLoadingState());
    await DioHelper.getData(HOME_ZUMRA,query: {
      'itemsPerPage': 18,
      'search': search,
    }).then((value) {
      print(value.data);

      shopSearchModel = ShopHomeModel.fromJson(value.data);
      listOfSearchedItems = shopSearchModel.docs;

      emit(ShopSearchSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(ShopSearchErrorState(error.toString()));
    });
  }


  verifyEmailAddress() async{

    await DioHelper.post(
      path: '/woocommerce/users/${userData.id}/verification-email-resend',
      token: token,
      data: {
        'token':'$token',
      },
    ).then((value) {
      printFullText(value.statusMessage);


      emit(ShopEmailVerificationSuccessState());
    }).catchError((error){
      print(token.toString());
      print(error.toString());
      emit(ShopEmailVerificationFailureState(error.toString()));
    });
  }

  recoverPassword(String password) async{
    await DioHelper.post(
      path: RECOVER_PASSWORD_ZUMRA,
      token: token,
      data: {
        'email':'${userData.email}',
      },
    ).then((value) {
      printFullText(value.statusMessage);

      emit(ShopPasswordRecoverySuccessState());
    }).catchError((error){
      print(token.toString());
      print(userData.id.toString());
      print(error.toString());
      emit(ShopPasswordRecoveryFailureState(error.toString()));
    });
  }



  addToCart(id, quantity) async{
    await DioHelper.post(
      path: ADD_TO_CART_ZUMRA,
      data:
      {
        '_id':'$id',
        'quantity':'$quantity',
      },
      token: token
    ).then((value) {
      print('before');
      printFullText(value.data.toString());
      print('after');

      emit(ShopAddToCartSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(ShopAddToCartFailureState(error.toString()));
    });
  }


  MyBasketModel myBasketModel;
  List<Products> products = [];
  loadCartItems() async{

    emit(ShopLoadCartItemsLoadingState());
    await DioHelper.getData(
      LOAD_CART_ITEMS_ZUMRA,
      token: token
    ).then((value) {
      // print(value.data);
      myBasketModel = MyBasketModel.fromJson(value.data);
      products = myBasketModel.products;

      double pricePerItem = 0;
      double totalPrice = 0;
      products.forEach((element) {
        print(element.quantity);
        print(element.price);
        pricePerItem = double.parse(element.price);
        totalPrice+= pricePerItem * (element.quantity);
      });
      print(totalPrice);


      emit(ShopLoadCartItemsSuccessState(totalPrice));
    }).catchError((error){
      print(error.toString());
      emit(ShopLoadCartItemsErrorState(error.toString()));
    });
  }

  int currentNumberOfItems = 0;
  changeBasketItemCount(String mark){
    if(mark == 'plus'){
      currentNumberOfItems ++;
      emit(ShopChangeCartItemNumberState());
    }else if (mark == 'minus' && currentNumberOfItems > 0){
      currentNumberOfItems--;
      emit(ShopChangeCartItemNumberState());
    }
  }


  increaseOrDecreaseCartItems(id, quantity, key) async{

    emit(ShopIncreaseOrDecreaseCartItemLoadingState(key));
    await DioHelper.post(
        path: ADD_TO_CART_ZUMRA,
        data:
        {
          '_id':'$id',
          'quantity':'$quantity',
        },
        token: token
    ).then((value) {
      printFullText(value.data.toString());


      emit(ShopIncreaseOrDecreaseCartItemSuccessState());
      loadCartItems();
    }).catchError((error){
      print(error.toString());
      emit(ShopIncreaseOrDecreaseCartItemFailureState(error.toString()));
    });
  }



  removeCartItem(String key) async{

    emit(ShopDeleteCartItemLoadingState());

    await DioHelper.post(
        path: '/woocommerce/carts/{$key}',

        token: token
    ).then((value) {
      printFullText(value.data.toString());

      emit(ShopDeleteCartItemSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(ShopDeleteCartItemFailureState(error.toString()));
    });
  }
}