
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

const LOGIN_ZUMRA = 'woocommerce/auth/local';
const HOME_ZUMRA = 'woocommerce/products';
const CATEGORIES_ZUMRA = 'woocommerce/categories';
const USER_ZUMRA = 'woocommerce/users/{userId}';
const USER_UPDATE_DATA_ZUMRA = '/woocommerce/users/{userId}';
const REGISTER_ZUMRA = '/woocommerce/auth/register';

const FACEBOOK_AUTH_ZUMRA = '/woocommerce/auth/facebook';
const GOOGLE_AUTH_ZUMRA = '/woocommerce/auth/google';
// const RECOVER_PASSWORD_ZUMRA = '/woocommerce/auth/passwordRecover';
const RECOVER_PASSWORD_ZUMRA = '/woocommerce/auth/passwordRecoverRequest';
// const EMAIL_VERIFICATION_ZUMRA = '/woocommerce/auth/emailVerification';

const ADD_TO_CART_ZUMRA = '/woocommerce/carts';
const LOAD_CART_ITEMS_ZUMRA = '/woocommerce/carts';

String token = '';
int id ;

bool isLoggedWithFacebook = false;
bool isLoggedWithGoogle = false;

// const AndroidNotificationChannel channel = AndroidNotificationChannel(
//     'high_importance_channel', // id
//     'High Importance Notifications', // title
//     'This channel is used for important notifications.', // description
//     importance: Importance.high,
//     playSound: true);
