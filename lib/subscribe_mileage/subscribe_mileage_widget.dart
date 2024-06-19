import '../backend/braintree/payment_manager.dart';
import '../flutter_flow/flutter_flow_credit_card_form.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../main_dashboard/main_dashboard_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class SubscribeMileageWidget extends StatefulWidget {
  const SubscribeMileageWidget({Key key}) : super(key: key);

  @override
  _SubscribeMileageWidgetState createState() => _SubscribeMileageWidgetState();
}

class _SubscribeMileageWidgetState extends State<SubscribeMileageWidget> {
  String transactionId2;
  String transactionId;
  final creditCardFormKey = GlobalKey<FormState>();
  CreditCardModel creditCardInfo = emptyCreditCard();
  String transactionId3;
  String transactionId4;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'subscribeMileage'});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).darkBackground,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Material(
            color: Colors.transparent,
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0),
            ),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 1,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).background,
                boxShadow: [
                  BoxShadow(
                    color: FlutterFlowTheme.of(context).background,
                  )
                ],
                borderRadius: BorderRadius.circular(0),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 44, 20, 20),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Subscribe To Send Stuff',
                          style: FlutterFlowTheme.of(context).title1,
                        ),
                        Card(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          color: FlutterFlowTheme.of(context).background,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 30,
                            buttonSize: 48,
                            icon: Icon(
                              Icons.close_rounded,
                              color: FlutterFlowTheme.of(context).textColor,
                              size: 30,
                            ),
                            onPressed: () async {
                              logFirebaseEvent(
                                  'SUBSCRIBE_MILEAGE_close_rounded_ICN_ON_T');
                              logFirebaseEvent('IconButton_Navigate-Back');
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(12, 0, 12, 0),
                      child: FlutterFlowCreditCardForm(
                        formKey: creditCardFormKey,
                        creditCardModel: creditCardInfo,
                        obscureNumber: true,
                        obscureCvv: true,
                        spacing: 10,
                        textStyle: FlutterFlowTheme.of(context).title3,
                        inputDecoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).grayDark,
                              width: 3,
                            ),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).grayDark,
                              width: 3,
                            ),
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 25, 0, 0),
                      child: Text(
                        'Select a delivery mileage plan to proceed.',
                        style: FlutterFlowTheme.of(context).bodyText1,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: 80,
                        constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width * 0.8,
                        ),
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).darkBackground,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: InkWell(
                          onTap: () async {
                            logFirebaseEvent(
                                'SUBSCRIBE_MILEAGE_Column_30p8ta96_ON_TAP');
                            logFirebaseEvent('Column_Braintree-Payment');
                            final transacAmount = 5000.0;
                            if (!(creditCardFormKey.currentState?.validate() ??
                                false)) {
                              return;
                            }
                            if (kIsWeb) {
                              showSnackbar(context,
                                  'Payments not yet supported on web.');
                              return;
                            }

                            final cardRequest = BraintreeCreditCardRequest(
                              cardNumber: creditCardInfo.cardNumber,
                              expirationMonth:
                                  creditCardInfo.expiryDate.split('/').first,
                              expirationYear:
                                  creditCardInfo.expiryDate.split('/').last,
                              cvv: creditCardInfo.cvvCode,
                            );
                            final cardResult =
                                await Braintree.tokenizeCreditCard(
                              braintreeClientToken(),
                              cardRequest,
                            );
                            if (cardResult == null) {
                              return;
                            }
                            showSnackbar(
                              context,
                              'Processing payment...',
                              duration: 10,
                              loading: true,
                            );
                            final paymentResponse =
                                await processBraintreePayment(
                              transacAmount,
                              cardResult.nonce,
                            );
                            if (paymentResponse.errorMessage != null) {
                              showSnackbar(context,
                                  'Error: ${paymentResponse.errorMessage}');
                              return;
                            }
                            showSnackbar(context, 'Success!');
                            transactionId = paymentResponse.transactionId;

                            logFirebaseEvent('Column_Update-Local-State');
                            setState(() => FFAppState().mileageBalance =
                                FFAppState().mileageBalance + 55.0);
                            logFirebaseEvent('Column_Navigate-To');
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MainDashboardWidget(
                                  subscribeParam: 55.0,
                                ),
                              ),
                            );

                            setState(() {});
                          },
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    'Lite',
                                    style: FlutterFlowTheme.of(context).title3,
                                  ),
                                  Text(
                                    'NGN 5000',
                                    style: FlutterFlowTheme.of(context)
                                        .title3
                                        .override(
                                          fontFamily: 'Lexend Deca',
                                          color: FlutterFlowTheme.of(context)
                                              .grayLight,
                                        ),
                                  ),
                                ],
                              ),
                              Text(
                                '55km max per month',
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Lexend Deca',
                                      fontStyle: FontStyle.italic,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: 80,
                        constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width * 0.8,
                        ),
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).darkBackground,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: InkWell(
                          onTap: () async {
                            logFirebaseEvent(
                                'SUBSCRIBE_MILEAGE_Column_i5al28oj_ON_TAP');
                            logFirebaseEvent('Column_Braintree-Payment');
                            final transacAmount = 10000.0;
                            if (!(creditCardFormKey.currentState?.validate() ??
                                false)) {
                              return;
                            }
                            if (kIsWeb) {
                              showSnackbar(context,
                                  'Payments not yet supported on web.');
                              return;
                            }

                            final cardRequest = BraintreeCreditCardRequest(
                              cardNumber: creditCardInfo.cardNumber,
                              expirationMonth:
                                  creditCardInfo.expiryDate.split('/').first,
                              expirationYear:
                                  creditCardInfo.expiryDate.split('/').last,
                              cvv: creditCardInfo.cvvCode,
                            );
                            final cardResult =
                                await Braintree.tokenizeCreditCard(
                              braintreeClientToken(),
                              cardRequest,
                            );
                            if (cardResult == null) {
                              return;
                            }
                            showSnackbar(
                              context,
                              'Processing payment...',
                              duration: 10,
                              loading: true,
                            );
                            final paymentResponse =
                                await processBraintreePayment(
                              transacAmount,
                              cardResult.nonce,
                            );
                            if (paymentResponse.errorMessage != null) {
                              showSnackbar(context,
                                  'Error: ${paymentResponse.errorMessage}');
                              return;
                            }
                            showSnackbar(context, 'Success!');
                            transactionId2 = paymentResponse.transactionId;

                            logFirebaseEvent('Column_Update-Local-State');
                            setState(() => FFAppState().mileageBalance =
                                FFAppState().mileageBalance + 130.0);
                            logFirebaseEvent('Column_Navigate-To');
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MainDashboardWidget(
                                  subscribeParam: 130.0,
                                ),
                              ),
                            );

                            setState(() {});
                          },
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    'Amateur',
                                    style: FlutterFlowTheme.of(context).title3,
                                  ),
                                  Text(
                                    'NGN 10,000',
                                    style: FlutterFlowTheme.of(context)
                                        .title3
                                        .override(
                                          fontFamily: 'Lexend Deca',
                                          color: Color(0xFF2079CF),
                                        ),
                                  ),
                                ],
                              ),
                              Text(
                                '130km max per month',
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Lexend Deca',
                                      fontStyle: FontStyle.italic,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: 80,
                        constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width * 0.8,
                        ),
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).darkBackground,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: InkWell(
                          onTap: () async {
                            logFirebaseEvent(
                                'SUBSCRIBE_MILEAGE_Column_fvfhcvj1_ON_TAP');
                            logFirebaseEvent('Column_Braintree-Payment');
                            final transacAmount = 20000.0;
                            if (!(creditCardFormKey.currentState?.validate() ??
                                false)) {
                              return;
                            }
                            if (kIsWeb) {
                              showSnackbar(context,
                                  'Payments not yet supported on web.');
                              return;
                            }

                            final cardRequest = BraintreeCreditCardRequest(
                              cardNumber: creditCardInfo.cardNumber,
                              expirationMonth:
                                  creditCardInfo.expiryDate.split('/').first,
                              expirationYear:
                                  creditCardInfo.expiryDate.split('/').last,
                              cvv: creditCardInfo.cvvCode,
                            );
                            final cardResult =
                                await Braintree.tokenizeCreditCard(
                              braintreeClientToken(),
                              cardRequest,
                            );
                            if (cardResult == null) {
                              return;
                            }
                            showSnackbar(
                              context,
                              'Processing payment...',
                              duration: 10,
                              loading: true,
                            );
                            final paymentResponse =
                                await processBraintreePayment(
                              transacAmount,
                              cardResult.nonce,
                            );
                            if (paymentResponse.errorMessage != null) {
                              showSnackbar(context,
                                  'Error: ${paymentResponse.errorMessage}');
                              return;
                            }
                            showSnackbar(context, 'Success!');
                            transactionId3 = paymentResponse.transactionId;

                            logFirebaseEvent('Column_Update-Local-State');
                            setState(() => FFAppState().mileageBalance =
                                FFAppState().mileageBalance + 300.0);
                            logFirebaseEvent('Column_Navigate-To');
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MainDashboardWidget(
                                  subscribeParam: 300.0,
                                ),
                              ),
                            );

                            setState(() {});
                          },
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    'Professional',
                                    style: FlutterFlowTheme.of(context).title3,
                                  ),
                                  Text(
                                    'NGN 20,000',
                                    style: FlutterFlowTheme.of(context)
                                        .title3
                                        .override(
                                          fontFamily: 'Lexend Deca',
                                          color: Color(0xFF17E63C),
                                        ),
                                  ),
                                ],
                              ),
                              Text(
                                '300km max per month',
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Lexend Deca',
                                      fontStyle: FontStyle.italic,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: 80,
                        constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width * 0.8,
                        ),
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).darkBackground,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: InkWell(
                          onTap: () async {
                            logFirebaseEvent(
                                'SUBSCRIBE_MILEAGE_Column_ah8ij7d2_ON_TAP');
                            logFirebaseEvent('Column_Braintree-Payment');
                            final transacAmount = 50000.0;
                            if (!(creditCardFormKey.currentState?.validate() ??
                                false)) {
                              return;
                            }
                            if (kIsWeb) {
                              showSnackbar(context,
                                  'Payments not yet supported on web.');
                              return;
                            }

                            final cardRequest = BraintreeCreditCardRequest(
                              cardNumber: creditCardInfo.cardNumber,
                              expirationMonth:
                                  creditCardInfo.expiryDate.split('/').first,
                              expirationYear:
                                  creditCardInfo.expiryDate.split('/').last,
                              cvv: creditCardInfo.cvvCode,
                            );
                            final cardResult =
                                await Braintree.tokenizeCreditCard(
                              braintreeClientToken(),
                              cardRequest,
                            );
                            if (cardResult == null) {
                              return;
                            }
                            showSnackbar(
                              context,
                              'Processing payment...',
                              duration: 10,
                              loading: true,
                            );
                            final paymentResponse =
                                await processBraintreePayment(
                              transacAmount,
                              cardResult.nonce,
                            );
                            if (paymentResponse.errorMessage != null) {
                              showSnackbar(context,
                                  'Error: ${paymentResponse.errorMessage}');
                              return;
                            }
                            showSnackbar(context, 'Success!');
                            transactionId4 = paymentResponse.transactionId;

                            logFirebaseEvent('Column_Update-Local-State');
                            setState(() => FFAppState().mileageBalance =
                                FFAppState().mileageBalance + 800.0);
                            logFirebaseEvent('Column_Navigate-To');
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MainDashboardWidget(
                                  subscribeParam: 800.0,
                                ),
                              ),
                            );

                            setState(() {});
                          },
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    'Business/SME',
                                    style: FlutterFlowTheme.of(context).title3,
                                  ),
                                  Text(
                                    'NGN 50,000',
                                    style: FlutterFlowTheme.of(context)
                                        .title3
                                        .override(
                                          fontFamily: 'Lexend Deca',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryColor,
                                        ),
                                  ),
                                ],
                              ),
                              Text(
                                '800km max per month',
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Lexend Deca',
                                      fontStyle: FontStyle.italic,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
