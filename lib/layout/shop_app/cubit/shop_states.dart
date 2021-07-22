abstract class ShopStates{}

class ShopInitialState extends ShopStates{}

class ShopChangeBottomNavState extends ShopStates{}

class ShopHomeLoadingState extends ShopStates{}
class ShopHomeSuccessState extends ShopStates{}
class ShopHomeErrorState extends ShopStates{
  final String error;

  ShopHomeErrorState(this.error);
}


class ShopCategoriesSuccessState extends ShopStates{}
class ShopCategoriesErrorState extends ShopStates{
  final String error;

  ShopCategoriesErrorState(this.error);
}

class ShopChangeFavoriteIcon extends ShopStates{}


class ShopUserLoadingState extends ShopStates{}
class ShopUserSuccessState extends ShopStates{}
class ShopUserErrorState extends ShopStates{
  final String error;

  ShopUserErrorState(this.error);
}

class ShopUserUpdateDataLoadingState extends ShopStates{}
class ShopUserUpdateDataSuccessState extends ShopStates{}
class ShopUserUpdateDataErrorState extends ShopStates{
  final String error;

  ShopUserUpdateDataErrorState(this.error);
}

class ShopSearchLoadingState extends ShopStates{}
class ShopSearchSuccessState extends ShopStates{}
class ShopSearchErrorState extends ShopStates{
  final String error;

  ShopSearchErrorState(this.error);
}
