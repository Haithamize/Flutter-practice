import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_app/layout/shop_app/cubit/shop_cubit.dart';
import 'package:flutter_app/layout/shop_app/cubit/shop_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyBasketScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit,ShopStates>(
        builder: (context,state){
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
            body: ListView.separated(
              itemBuilder: (context,index){
                return buildBasketItem(context, index);
              },
              separatorBuilder: (context,index){
                return SizedBox(height: 0,);
              },
              itemCount: 3,
            ),
          );
        },
        listener: (context,state){

        }
    );
  }


  Widget buildBasketItem(context,index){
    return Dismissible(
      key: UniqueKey(),
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
                        'https://sc04.alicdn.com/kf/H7b1ef3f55e6d4506bef5d01d02651030f.jpg'),
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
                'Paldo Seafood Ramen Noodles - 120 g',
                style: TextStyle(
                  color: Colors.grey,
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
                          ShopCubit.get(context).changeBasketItemCount('minus');
                        },
                      ),
                      Text(
                        '${ShopCubit.get(context).currentNumberOfItems}',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.add, color: Colors.grey, size: 20,),
                        onPressed: (){
                          ShopCubit.get(context).changeBasketItemCount('plus');
                        },
                      )
                    ],
                  ),
                  Text(
                    '135.00 EGP',
                    style: TextStyle(
                      color: Colors.grey[900],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4,),
                  Text(
                    '180.00 EGP',
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
