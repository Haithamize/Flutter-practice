import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProductDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(
              image: NetworkImage(
                  'https://sc04.alicdn.com/kf/He3ab10fe009547279911eda7ed453029o.jpg'),
              width: double.infinity,
              height: 250,
            ),
            Text(
              'Product Name',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.normal,
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    '135.00 EGP',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ), // de el text eli feha el flos
                Container(
                  color: Colors.grey,
                  height: 30,
                  width: 1,
                ), //de el sharta el wa2fa
                SizedBox(
                  width: 8,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RatingBar.builder(
                      itemBuilder: (context, index) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                      initialRating: 3,
                      minRating: 1,
                      direction: Axis.horizontal,
                      itemCount: 5,
                      allowHalfRating: true,
                      itemSize: 15,
                    ),
                    // TextButton(
                    //   onPressed: () {},
                    //   child: Text(
                    //     '13 Reviews',
                    //     style: TextStyle(
                    //       color: Colors.blue,
                    //       fontWeight: FontWeight.normal,
                    //       fontSize: 12,
                    //     ),
                    //   ),
                    // ),
                    SizedBox(
                      height: 3,
                    ),
                    Text(
                      '13 Reviews',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.normal,
                        fontSize: 10,
                      ),
                    ),
                  ],
                ), // da el column eli feh el rating wl reviews
              ],
            ), // da el row eli feh el se3r wl stars
            Row(
              children: [
                Text(
                  'All prices include VAT',
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.normal,
                    fontSize: 12,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Details',
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.normal,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            Text(
              'Product details',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Product made with love and shit Product made with love and shit Product made with love and shit Product made with love and shit Product made with love and shit.',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.normal,
                fontSize: 14,
              ),
            ), // da el product details
            SizedBox(height: 10,),
            Container(
              width: double.infinity,
              color: Colors.grey[200],
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Ship to ',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        'Qism El-Montaza',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          '(Change city)',
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.normal,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Delivered within ',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                          fontSize: 14,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'Thursday, Aug 19 - Friday, Aug 20 to Qism El-Montaza.',
                          maxLines: 3,
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15,),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    child: IconButton(
                      icon: Text(
                        'ADD TO CART',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      onPressed: () {},
                    ),
                  ), // da el button bta3 el add to cart
                  SizedBox(height: 10,),
                ],
              ),
            ), //da el container el gray eli gwah zorar el add to cart wl kalam eli fo2ih
            SizedBox(
              height: 15,
            ),
            Text(
              'Pay online for contactless deliveries',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              height: 10,
              color: Colors.grey[200],
              width: double.infinity,
            ),
          ],
        ),
      ),
    );
  }
}
