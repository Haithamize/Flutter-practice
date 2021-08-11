import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_app/layout/shop_app/cubit/shop_cubit.dart';
import 'package:flutter_app/layout/shop_app/cubit/shop_states.dart';
import 'package:flutter_app/models/shop_app/basket_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/flutter_conditional_rendering.dart';

class MyBasketScreen extends StatefulWidget {

  @override
  State<MyBasketScreen> createState() => _MyBasketScreenState();
}

class _MyBasketScreenState extends State<MyBasketScreen> {
  List<Products> products;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit,ShopStates>(
        builder: (context,state){
          products = ShopCubit.get(context).products;
          return Conditional.single(
              fallbackBuilder: (BuildContext context) {
                return Scaffold(
                  body: Center(child: CircularProgressIndicator()),
                );
              },
              context: context,
              widgetBuilder: (BuildContext context) {
                return Scaffold(
                  backgroundColor: Colors.grey[350],
                  appBar: AppBar(
                    leading: Icon(Icons.arrow_back_ios, color: Colors.black,),
                    title: Text(
                      'My Basket',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    actions:
                    [
                      IconButton(
                        icon: Icon(Icons.edit, color: Colors.black,),
                        onPressed: () {},
                      )
                    ],
                  ),
                  body: Column(
                    children: [
                      Expanded(
                        child: ListView.separated(
                          itemBuilder: (context,index){
                            return buildBasketItem(context, index, products[index], state);
                          },
                          separatorBuilder: (context,index){
                            return SizedBox(height: 0,);
                          },
                          itemCount: products.length,
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children:
                          [
                            Container(
                              color: Color(0xFFFEF5E7),
                              width: double.infinity,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children:
                                  [
                                    Icon(Icons.info),
                                    SizedBox(width: 5,),
                                    Expanded(
                                      child: Text(
                                        'Add 250 EGP of eligible items to your order to qualify for FREE Shipping.',
                                        maxLines: 2,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 11
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ), //da el container eli shayel el freeshiping details
                            Container(
                              color: Color(0xFFDEFFF7),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children:
                                  [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children:
                                      [
                                        Text(
                                          'Sub Total:   ',
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontWeight: FontWeight.normal,
                                              fontSize: 11
                                          ),
                                        ),
                                        Text(
                                          '500 EGP',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.normal,
                                              fontSize: 18
                                          ),
                                        ),
                                      ],
                                    ), // da el row eli feh el subtotal wl flos
                                    ElevatedButton(
                                        onPressed: (){},
                                        child: Text(
                                          'PROCEED TO CHECKOUT',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12
                                          ),
                                        ),
                                        style: ButtonStyle(
                                        backgroundColor: MaterialStateProperty.all(Colors.green[400]),
                                      ),
                                    ),
                                    Text(
                                      'Apply coupon in the next step',
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.normal,
                                          fontSize: 10
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            conditionBuilder: (BuildContext context) {
                return (state is! ShopLoadCartItemsLoadingState && products != null );
            },

          );
        },
        listener: (context,state){

        }
    );
  }

  Widget buildBasketItem(context,index, Products product, state){
    // print(product.iId);
    // print(product.wooCommerceId);
    // print(product.quantity);
    // print(ShopCubit.get(context).myBasketModel.products[index].quantity);
    // print(ShopCubit.get(context).myBasketModel.products[index].stockQuantity);
    return Dismissible(
      key: ValueKey<String>(product.key),
      confirmDismiss: (direction)async{
        if(direction == DismissDirection.startToEnd){
          return true;
        }else{
          return false;
        }
      },

      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children:
          [
            ListTile(
              tileColor: Colors.white,
              leading: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Image(
                    image: NetworkImage(
                        '${product.images[0].url}'),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.red.withOpacity(0.8),
                    ),
                    child: Text(
                      '22% OFF',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              trailing: IconButton(
                icon: Icon(Icons.delete_sweep, color: Colors.black,),
                onPressed: (){

                },
              ),
              isThreeLine: true,
              title: Text(
                '${product.name}',
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.normal,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children:
                    [
                      Text(
                        'Qty:',
                        style: TextStyle(
                          color: Colors.grey[900],
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.remove, color: Colors.grey, size: 20,),
                        onPressed: (){
                          // ShopCubit.get(context).changeBasketItemCount('plus');
                          setState(() {
                            print(product.wooCommerceId);
                            ShopCubit.get(context).increaseOrDecreaseCartItems(product.wooCommerceId, -1);
                          });
                        },
                      ),

                      (state is ShopIncreaseOrDecreaseCartItemLoadingState)? CircularProgressIndicator() : Text(
                        '${product.quantity}',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.add, color: Colors.grey, size: 20,),
                        onPressed: (){
                          // ShopCubit.get(context).changeBasketItemCount('plus');
                          setState(() {
                            print(product.wooCommerceId);
                            ShopCubit.get(context).increaseOrDecreaseCartItems(product.wooCommerceId, 1);
                          });
                        },
                      )
                    ],
                  ),
                  Text(
                    '${product.price} EGP',
                    style: TextStyle(
                      color: Colors.grey[900],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4,),
                  Text(
                    '${product.regularPrice} EGP',
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.normal,
                        decoration: TextDecoration.lineThrough,
                        fontSize: 10
                    ),
                  ),
                  SizedBox(height: 5,),
                  Row(
                    children:
                    [
                      Text(
                        'Eligible for ',
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.normal,
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        'FREE Shipping',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 14
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
