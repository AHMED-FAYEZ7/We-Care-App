import 'package:flutter/material.dart';
import 'package:health_care/core/widgets/app_bar_widget.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaymentScreen extends StatefulWidget {
  PaymentScreen({
    Key? key,
  }) : super(key: key);

  // String url;

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  late final WebViewController controller;

  @override
  void initState() {
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(
          'https://checkout.stripe.com/c/pay/cs_test_a1OKXb4pj5rOk7sVLGDkC6EuFgXJR99ZOEYRsyAJauuv2VBErDE0C5v5Td#fidkdWxOYHwnPyd1blpxYHZxWjA0S1VVTHZNUUFVfWxkNHZJfHd3N3JddkhiUUkzbG9pUGNPTzRyRkNES2JGNWtBRElRZ1BGa2lTTldXXWM3NFVuajd8fVxyNn1tVHx%2FTkx9YlZQaGNEcFFENTUwSGd3Tml3MScpJ2N3amhWYHdzYHcnP3F3cGApJ2lkfGpwcVF8dWAnPyd2bGtiaWBabHFgaCcpJ2BrZGdpYFVpZGZgbWppYWB3dic%2FcXdwYHgl'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        isBack: true,
        title: 'Let\'s Pay',
      ),
      body: WebViewWidget(
        controller: controller,
      ),
    );
  }
}
