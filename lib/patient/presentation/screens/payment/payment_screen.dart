// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_care/core/routes/app_routes.dart';
import 'package:health_care/core/widgets/app_bar_widget.dart';
import 'package:health_care/patient/presentation/controller/Patient_cubit/patient_cubit.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaymentScreen extends StatefulWidget {
  PaymentScreen({
    required this.url,
    required this.sessionId,
    required this.appointmentId,
    Key? key,
  }) : super(key: key);

  String url;
  String sessionId;
  String appointmentId;

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
        widget.url,
      ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PatientCubit, PatientState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = PatientCubit.get(context);
        return Scaffold(
          appBar: AppBarWidget(
            isBack: true,
            isBackWithFunc: true,
            onTapBackFunc: () {
              cubit.afterPayment(
                widget.appointmentId,
                widget.sessionId,
              );
              Navigator.pushNamed(
                context,
                Routes.layoutPatientRoute,
              );
            },
            title: 'Return Home',
          ),
          body: WebViewWidget(
            controller: controller,
          ),
        );
      },
    );
  }
}
