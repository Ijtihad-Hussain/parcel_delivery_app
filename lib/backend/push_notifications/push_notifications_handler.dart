import 'dart:async';
import 'dart:convert';

import 'serialization_util.dart';
import '../backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import '../../index.dart';
import '../../main.dart';

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({Key key, this.child}) : super(key: key);

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    setState(() => _loading = true);
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final pageBuilder = pageBuilderMap[initialPageName];
      if (pageBuilder != null) {
        final page = await pageBuilder(initialParameterData);
        await Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      setState(() => _loading = false);
    }
  }

  @override
  void initState() {
    super.initState();
    handleOpenedPushNotification();
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Container(
          color: FlutterFlowTheme.of(context).darkBackground,
          child: Center(
            child: Builder(
              builder: (context) => Image.asset(
                'assets/images/qonvayappsplash.svg',
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
        )
      : widget.child;
}

final pageBuilderMap = <String, Future<Widget> Function(Map<String, dynamic>)>{
  'loginPage': (data) async => LoginPageWidget(),
  'registerAccount': (data) async => RegisterAccountWidget(),
  'completeProfile': (data) async => CompleteProfileWidget(),
  'forgotPassword': (data) async => ForgotPasswordWidget(),
  'onboarding': (data) async => OnboardingWidget(),
  'createDefaultPickup': (data) async => CreateDefaultPickupWidget(),
  'MY_profilePage': (data) async => hasMatchingParameters(data, {'userProfile'})
      ? MYProfilePageWidget(
          userProfile: getParameter(data, 'userProfile'),
        )
      : NavBarPage(initialPage: 'MY_profilePage'),
  'bookDelivery': (data) async => hasMatchingParameters(data, {'distanceParam'})
      ? BookDeliveryWidget(
          distanceParam: getParameter(data, 'distanceParam'),
        )
      : NavBarPage(initialPage: 'bookDelivery'),
  'bookingComplete': (data) async => BookingCompleteWidget(
        mileageCost: getParameter(data, 'mileageCost'),
      ),
  'topupMileage': (data) async => TopupMileageWidget(),
  'subscribeMileage': (data) async => SubscribeMileageWidget(),
  'editProfile': (data) async => EditProfileWidget(
        userProfile: getParameter(data, 'userProfile'),
      ),
  'changePassword': (data) async => ChangePasswordWidget(),
  'notificationsSettings': (data) async => NotificationsSettingsWidget(),
  'privacyPolicy': (data) async => PrivacyPolicyWidget(),
  'orderTracking': (data) async => OrderTrackingWidget(),
  'deliveryOrderList': (data) async => DeliveryOrderListWidget(),
  'paymentMethod': (data) async => PaymentMethodWidget(),
};

bool hasMatchingParameters(Map<String, dynamic> data, Set<String> params) =>
    params.any((param) => getParameter(data, param) != null);

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}
