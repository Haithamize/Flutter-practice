import 'package:flutter/material.dart';
import 'package:flutter_app/layout/shop_app/cubit/shop_cubit.dart';
import 'package:flutter_app/layout/shop_app/cubit/shop_states.dart';
import 'package:flutter_app/shared/components/components.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/flutter_conditional_rendering.dart';

class ShopFavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context,state){},
      builder: (context,state){
        return Conditional.single(
            context: context,
            conditionBuilder: (context){
              return true;
            },
            widgetBuilder: (context){
              return ListView.separated(
                physics: BouncingScrollPhysics(),
                  itemBuilder: (context,index){
                    return buildFavoriteItem();
                  },
                  separatorBuilder: (context,index){
                    return listViewSeparator();
                  },
                  itemCount: 10
              );
            },
            fallbackBuilder: (context){
              return CircularProgressIndicator();
            }
        );
      },
    );
  }


 Widget buildFavoriteItem(){
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Row(
        children: [
          Image(
            image: NetworkImage(
                'https://sc04.alicdn.com/kf/He3ab10fe009547279911eda7ed453029o.jpg'),
            height: 120,
            width: 120,
            fit: BoxFit.cover,
          ),
          SizedBox(width: 10,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Favorite itemFavorite itemFavorite itemFavorite itemFavorite item',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 20,),
                Row(
                  children: [
                    Text(
                      '1200',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                    Spacer(),
                    CircleAvatar(
                      child: IconButton(
                        icon: Icon(Icons.favorite_border_outlined),
                        iconSize: 20,
                        color: Colors.white,
                        onPressed: () {  },
                      ),
                      radius: 17,
                      backgroundColor: Colors.blue,
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
}
