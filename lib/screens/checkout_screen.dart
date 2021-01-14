import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class CheckoutScreen extends StatefulWidget {
  final String amount;
  CheckoutScreen({@required this.amount});
  static final String id = 'razerpay_screen';
  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  bool isPaymentComplete = false;
  Razorpay _razorpay = Razorpay();

  @override
  void initState() {
    super.initState();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }

  void _openRazorpay() async {
    var options = {
      'key': "rzp_test_S1hzq8h7JbH0QQ", // Enter the Key ID generated from the Dashboard
      'amount': widget.amount, //in the smallest currency sub-unit.
      'name': 'organization',
//      'order_id': widget.order_id,
      'currency': "INR",
      'theme.color': "#F37254",
      'buttontext': "Pay with Razorpay",
      'description': 'RazorPay example',
      'prefill': {
        'contact': '6969696969',
        'email': 'gardenFTH@gmail.com',
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      print('Error: ${e.toString()}');
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    showPaymentPopupMessage(context, true, 'Payment Successful!');
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    showPaymentPopupMessage(context, false, 'Payment Failed!');
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    print(
        'You have chosen to pay via : ${response.walletName}. It will take some time to reflect your payment.');
  }

  void showPaymentPopupMessage(
      BuildContext ctx, bool isPaymentSuccess, String message) {
    showDialog<void>(
      context: ctx,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
            children: [
              isPaymentSuccess
                  ? Icon(
                Icons.done,
                color: Colors.green,
              )
                  : Icon(
                Icons.clear,
                color: Colors.red,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                isPaymentSuccess ? 'Payment Successful' : 'Payment Failed',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ],
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Divider(
                  color: Colors.grey,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(message),
                SizedBox(
                  height: 5,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Checkout'),
          backgroundColor: Colors.orange,
        ),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Center(
                  child: FlatButton(
                    color: Colors.blueAccent,
                    onPressed: () => _openRazorpay(),
                    child: Padding(
                      padding: const EdgeInsets.all(58.0),
                      child: Text('BUY NOW', style: TextStyle(
                          color: Colors.white
                      )
                      ),
                    ),
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(side: BorderSide(
                        color: Colors.blue,
                        width: 1,
                        style: BorderStyle.solid
                    ), borderRadius: BorderRadius.circular(50)),
                  )
                ),
              ),
              Container(
                color: Colors.orange,
                width: double.infinity,
                padding: EdgeInsets.all(40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Total amount: ₹${int.parse(widget.amount)/100}',
//                      'Total amount: ₹${(widget.amount)}',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
//                  RawMaterialButton(
//                    onPressed: () => _openRazorpay(),
//                    child: Text(
//                      'CHECKOUT',
//                      style: TextStyle(
//                        fontSize: 16,
//                        fontWeight: FontWeight.bold,
//                        color: Colors.white,
//                      ),
//                    ),
//                    padding: EdgeInsets.zero,
//                  ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


//import 'package:flutter/material.dart';
//import 'package:razorpay_flutter/razorpay_flutter.dart';
//
//class CheckRazor extends StatefulWidget {
//
//  static final String id = 'razerpay_screen';
//
//  final String amount;
//  CheckRazor({@required this.amount});
//
//  @override
//  _CheckRazorState createState() => _CheckRazorState();
//}
//
//class _CheckRazorState extends State<CheckRazor> {
//  Razorpay _checkpay;
//
//  Razorpay _razorpay = Razorpay();
//  var options;
//
//  Future payData() async {
//    try {
//      _razorpay.open(options);
//    } catch (e) {
//      print("errror occured here is ......................./:$e");
//    }
//
//    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
//    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
//    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
//  }
//
//  /// handle payment success
//    void _handlePaymentSuccess(PaymentSuccessResponse response) {
//      AlertDialog(
//        title: const Text('Success'),
//        content: new Column(
//          mainAxisSize: MainAxisSize.min,
//          crossAxisAlignment: CrossAxisAlignment.start,
//          children: <Widget>[
//            Text("Payment ID : ${response.paymentId}"),
//          ],
//        ),
//        actions: <Widget>[
//          new FlatButton(
//            onPressed: () {
//              Navigator.of(context).pop();
//            },
//            textColor: Theme.of(context).primaryColor,
//            child: const Text('Close'),
//          ),
//        ],
//      );
//  }
////  void _handlePaymentSuccess(PaymentSuccessResponse response) async {
////    print("payment has succedded");
////    print("order id : ${response.orderId} \npayment id : ${response.paymentId} \nsignature : ${response.signature}");
////    Navigator.pushAndRemoveUntil(
////      context,
////      MaterialPageRoute(
////        builder: (BuildContext context) => ConfirmPay(
////          response: response,
////        ),
////      ),
////          (Route<dynamic> route) => false,
////    );
////    _razorpay.clear();
////    // Do something when payment succeeds
////  }
//
//  /// handle payment failed
//    void _handlePaymentError(PaymentFailureResponse response) {
//      AlertDialog(
//        title: const Text('Fail'),
//        content: Text("Failed payment")
//      );
//  }
////  void _handlePaymentError(PaymentFailureResponse response) {
////    print("payment has error00000000000000000000000000000000000000");
////    // Do something when payment fails
////    Navigator.pushAndRemoveUntil(
////      context,
////      MaterialPageRoute(
////        builder: (BuildContext context) => PayFailed(
////          response: response,
////        ),
////      ),
////          (Route<dynamic> route) => false,
////    );
////    _razorpay.clear();
////  }
//
//  /// handle external wallet
//  void _handleExternalWallet(ExternalWalletResponse response) {
//    print("payment has externalWallet33333333333333333333333333");
//
//    _razorpay.clear();
//    // Do something when an external wallet is selected
//  }
//
//  @override
//  void initState() {
//    // TODO: implement initState
//    super.initState();
//
//    options = {
//      'key': "rzp_test_S1hzq8h7JbH0QQ", // Enter the Key ID generated from the Dashboard
//
//      'amount': widget.amount, //in the smallest currency sub-unit.
//      'name': 'organization',
////      'order_id': widget.order_id,
//      'currency': "INR",
//      'theme.color': "#F37254",
//      'buttontext': "Pay with Razorpay",
//      'description': 'RazorPay example',
//      'prefill': {
//        'contact': '6969696969',
//        'email': 'gardenFTH@gmail.com',
//      }
//    };
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    // print("razor runtime --------: ${_razorpay.runtimeType}");
//    return Scaffold(
//      body: FutureBuilder(
//          future: payData(),
//          builder: (context, snapshot) {
//            return Container(
//              child: Center(
//                child: Text(
//                  "Loading...",
//                  style: TextStyle(
//                    fontSize: 20,
//                  ),
//                ),
//              ),
//            );
//          }),
//    );
//  }
//}
