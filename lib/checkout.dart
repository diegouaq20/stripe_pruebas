import 'package:flutter/material.dart';
import 'package:stripe_pruebas/stripe_service.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Stripe Checkout',
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: Center(
        child: TextButton(
            onPressed: () async {
              var items = [
                {
                  "productPrice": 4,
                  "productName": "Producto 1",
                  "qty": 1,
                },
                {"productPrice": 55, "productName": "Producto 2", "qty": 1},
              ];

              await StripeService.stripePaymentCheckout(
                  items, 500, context, mounted, onSuccess: () {
                print("Success");
              }, onCancel: () {
                print("Cancel");
              }, onError: (e) {
                print("Error:" + e.toString());
              });
            },
            style: TextButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                foregroundColor: Colors.white,
                shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(1)),
                )),
            child: Text('Pagar')),
      ),
    );
  }
}
