
import 'package:flutter_stripe/flutter_stripe.dart';

class StripeConnect {


  static void initialize() {
    const publicApiKey = "pk_live_51KCP2UBegzMO1uSFSHesZbid8tju45W0egsUj0qMjd2pMw77nhBgT3slKGzxTYLFbYGGECZ9Ki2VNuTZXa1OX12000f7l74v8i";
    Stripe.publishableKey = publicApiKey;
  }

}