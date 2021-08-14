import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/layout/shop_app/cubit/shop_cubit.dart';
import 'package:flutter_app/layout/shop_app/cubit/shop_states.dart';
import 'package:flutter_app/models/shop_app/shop_categories_model.dart';
import 'package:flutter_app/models/shop_app/shop_home_model.dart';
import 'package:flutter_app/network/local/cache_sharedpref.dart';
import 'package:flutter_app/shared/components/components.dart';
import 'package:flutter_app/shared/components/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/flutter_conditional_rendering.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ShopHomeScreen extends StatefulWidget {
  @override
  _ShopHomeScreenState createState() => _ShopHomeScreenState();
}

class _ShopHomeScreenState extends State<ShopHomeScreen> {
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _refreshController.dispose();
  }

  final ScrollController scrollController = ScrollController();

  List<Widget> banners = [
    Image(
      image: NetworkImage(
          'https://sc04.alicdn.com/kf/He3ab10fe009547279911eda7ed453029o.jpg'),
      width: double.infinity,
    ),
    Image(
      image: NetworkImage(
          'https://sc04.alicdn.com/kf/H50fd610248c44de58fc9c3b14165e6c9z.jpg'),
      width: double.infinity,
    ),
    Image(
      image: NetworkImage(
          'https://sc04.alicdn.com/kf/H7b1ef3f55e6d4506bef5d01d02651030f.jpg'),
      width: double.infinity,
    ),
  ];

  // void setupScrollController(context){ //hst5dm el function de 3shan ara2b ay ta8yer y7sl 3la el listview 3ndi 3n tri2 eni h3ml add le listner 3la el controller bt3ha
  //   scrollController.addListener(() {
  //     // if(scrollController.position.atEdge){//el condition da m3nah lw el list fl bottom aw fl top
  //     //   if(scrollController.position.pixels != 0){//w el condition da m3nah en el list 3ndi fl bottom l2n el pixels htsawi 0 bs lw f awl el lista,,  3mlt el condition da 3shan at2kd eni fl bottom 3shan m3mlsh fetch lel data 8er fl bottom
  //     if (scrollController.position.pixels ==
  //         scrollController.position.maxScrollExtent) {
  //       print('Scrolled inside the controller');
  //       ShopCubit.get(context).getHomeDataFromApi();
  //     }
  //   });
  // }

  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    // monitor network fetch
    ShopCubit.get(context).getHomeDataFromApi();
    // if failed,use loadFailed(),if no data return,use LoadNodata()

    _refreshController.loadComplete();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is ShopUserSuccessState) {
          CacheHelper.setData('id', ShopCubit.get(context).userData.id);
          id = ShopCubit.get(context).userData.id;
          print(id);
        }
        // setupScrollController(context);
        return Conditional.single(
          context: context,
          conditionBuilder: (context) {
            return ShopCubit.get(context).shopHomeModel != null &&
                ShopCubit.get(context).shopCategoriesModel != null;
          },
          fallbackBuilder: (context) {
            return Center(child: CircularProgressIndicator());
          },
          widgetBuilder: (context) {
            return buildShopHomeScreen(ShopCubit.get(context).shopHomeModel,
                context, ShopCubit.get(context).shopCategoriesModel);
          },
        );
      },
    );
  }

  Widget buildShopHomeScreen(ShopHomeModel shopHomeModel, context,
      ShopCategoriesModel shopCategoriesModel) {
    return SmartRefresher(
      enablePullDown: true,
      physics: BouncingScrollPhysics(),
      enablePullUp: true,
      header: WaterDropMaterialHeader(),
      footer: CustomFooter(
        builder: (BuildContext context, LoadStatus mode) {
          Widget body;
          if (mode == LoadStatus.idle) {
            body = CircularProgressIndicator.adaptive();
          } else if (mode == LoadStatus.loading) {
            body = CupertinoActivityIndicator();
          } else if (mode == LoadStatus.failed) {
            body = Text("Load Failed!Click retry!");
          } else if (mode == LoadStatus.canLoading) {
            body = Text("release to load more");
          } else {
            body = Text("No more Data");
          }
          return Container(
            height: 55.0,
            child: Center(child: body),
          );
        },
      ),
      controller: _refreshController,
      onRefresh: _onRefresh,
      onLoading: _onLoading,
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        // controller: scrollController,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                'Hot & New',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            CarouselSlider(
              items: banners,
              // items: shopHomeModel.data.banners.map((banner) {
              //   return Image(
              //     image: NetworkImage('${banner.image}'),
              //     fit: BoxFit.cover,
              //     width: double.infinity,
              //   );
              // }).toList(),
              options: CarouselOptions(
                height: 250,
                enableInfiniteScroll: true,
                //w de bt5li el images tfdl t3ml scroll lw7dha
                initialPage: 0,
                // y3ni ebd2 ml awl
                reverse: false,
                // w de 3shan amn3 eno y2allep el n7ya el tanya
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                //y3ni m7tago y2allep kol 3 sawani mn sora lel tnya
                autoPlayAnimationDuration: Duration(seconds: 1),
                //w de el w2t eli hya5do 3shan yro7 mn wahdaa lel tnya awl mayegi y2allep b3d ma el 3 sawani eli fo2 y5lso
                autoPlayCurve: Curves.fastOutSlowIn,
                //da el shakl eli hyt2allep beh
                scrollDirection: Axis.horizontal,
                viewportFraction:
                    1.0, //w de mohema gdn bt5li el sora temla el makan bta3ha w mn 8erha hytl3 sorten gwa b3d
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Categories',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 102,
                    child: ListView.separated(
                        physics: BouncingScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return buildCategoryItem(
                              shopCategoriesModel.categories[index],
                              index,
                              shopCategoriesModel.categories[index].image[0]);
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            width: 12,
                          );
                        },
                        itemCount: 3),
                  ), //da el horizontal listview representing the categories
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Products',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              color: Colors.grey[300],
              child: GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return buildProductItem(
                      ShopCubit.get(context).oldAndNewItems[index],
                      index,
                      context);
                },
                itemCount: ShopCubit.get(context).oldAndNewItems.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 1,
                  //de eli btt7km fl masafa ben kol 2 items ta7t b3d
                  crossAxisSpacing: 1,
                  //de eli btt7km fl masafa ben kol 2 items ganb b3d
                  childAspectRatio: 1 / 1.68,
                  //el 3ard 3ala el tool fa lw zwdt el tool eli hwa fl makam hala2i el masafa el ra2sya ben 2 items fo2 b3d btzed w de bfdl a8ayar feha l8ayt ma el shakl yzbot w myb2ash feh overflow
                  crossAxisCount: 2,
                  //3shan a3ml grid fa b3ml GridView.Count w el crossAxisCount y3ni el items eli bl 3rd ana 3ayz a3red 2 bs w bya5od haga esmaha children w de bta5od list of widgets fa h3ml List.generate w adi el length bta3 el list eli gayali ml net w tani param da byb2a el item builder b2a kol product hyb2a 3aml ezay fa ana tl3tha f method barra for more clean code
                ),
                // children: List.generate(
                //     shopHomeModel.docs.length,
                //     (index) =>
                //         buildProductItem(ShopCubit.get(context).oldAndNewItems[index], index)),
              ),
            ), // da el gridView
          ],
        ),
      ),
    );
  }

  Widget buildProductItem(Docs docs, int index, context) {
    //de shakl kol product gwa el grid
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomStart,
            children: [
              Image(
                image: NetworkImage('${docs.images[0].url}'),
                height: 200,
                width: double.infinity,
              ),
              // if(product.discount != 0)
              // Container(
              //   color: Colors.red,
              //   child: Padding(
              //     padding: const EdgeInsets.symmetric(horizontal: 8.0),
              //     child: Text(
              //       'DISCOUNT!',
              //       style: TextStyle(
              //         color: Colors.white,
              //         fontWeight: FontWeight.bold,
              //         fontSize: 10,
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${docs.name}',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 14,
                    height:
                        1.1, //el height gwa el text style by2arap el masafat ben el lines eli mktola
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Text(
                      '${docs.price}',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.blue,
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    if (docs.regularPrice != docs.price)
                      Text(
                        '${docs.regularPrice}',
                        style: TextStyle(
                            fontSize: 10,
                            color: Colors.grey,
                            decoration: TextDecoration
                                .lineThrough //de attribute bt3mli 5at 3ala el kalam el maktop akeno mashtop
                            ),
                      ),
                    Spacer(),
                    Expanded(
                      child: CircleAvatar(
                        child: IconButton(
                          icon: Icon(Icons.add_shopping_cart),
                          iconSize: 15,
                          color: Colors.black,
                          onPressed: () {
                            print('tapped item: ' + '${docs.id}');
                            ShopCubit.get(context).addToCart(docs.id, 1);
                          },
                        ),
                        radius: 17,
                        backgroundColor: Colors.white,
                      ),
                    ),
                    CircleAvatar(
                      child: IconButton(
                        icon: Icon(Icons.favorite_border_outlined),
                        iconSize: 15,
                        color: Colors.white,
                        onPressed: () {
                          ShopCubit.get(context)
                              .changeColorOfFavoriteIcon(docs.id);
                          print('tapped item: ' + '${docs.id}');
                        },
                      ),
                      radius: 17,
                      backgroundColor: ShopCubit.get(context).isFavorite
                          ? Colors.blue
                          : Colors.grey,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget loadingIndicator() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(child: CircularProgressIndicator()),
    );
  }

  Widget buildCategoryItem(Categories categories, index, ImageModel image) {
    return Container(
      height: 100,
      width: 100,
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Image(
            image: NetworkImage(
                '${index == 0 || image == null ? 'https://wp-dev.zumrafood.com/wp-content/uploads/2021/04/White-basmati-with-mushroom-oyster-sauce-1.jpg' : image.url}'),
            height: 100,
            width: 100,
            fit: BoxFit.cover,
          ),
          Container(
            width: double.infinity,
            color: Colors.black.withOpacity(0.5),
            child: Text(
              categories.name,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
