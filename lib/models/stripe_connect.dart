
library stripe;

import 'package:brofinance/models/shared_preferences_helper.dart';
import 'package:js/js.dart';

void redirectToCheckout(int price) async {

  await SharedPreferencesHelper.setValue("amountPayedByUser", price.toDouble());

  final stripe = Stripe("pk_test_51KCP2UBegzMO1uSFb7gEkFzZLFOPzc3eKFDEi5gLUYhmvQ2e0gtLS9HX8MRmGCP55aYO1WkMTXPfOiRQWxvOJQ2L00AKogRdWE");
  stripe.redirectToCheckout(CheckoutOptions(
    lineItems: [
      LineItem(price: "price_1KCiECBegzMO1uSF3eNJHmud", quantity: price)
    ],
    mode: "payment",
    successUrl: "http://localhost:60762/#/user-success",
    cancelUrl: "https://brofinancestuttgart.com",
  ));
}

@JS()
class Stripe {

  external Stripe(String publickKey);

  external redirectToCheckout(CheckoutOptions options);

}

@JS()
@anonymous
class CheckoutOptions {

  external List<LineItem> get lineItems;

  external String get mode;

  external String get successUrl;

  external String get cancelUrl;

  external String get sessionId;

  external factory CheckoutOptions({
    List<LineItem> lineItems,
    String mode,
    String successUrl,
    String cancelUrl,
    String sessionId,
});

}

@JS()
@anonymous
class LineItem {
  external String get price;

  external int get quantity;

  external factory LineItem({String price, int quantity});
}


