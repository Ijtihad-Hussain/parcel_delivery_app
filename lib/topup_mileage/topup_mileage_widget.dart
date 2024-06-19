import '../backend/braintree/payment_manager.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_credit_card_form.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../main.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class TopupMileageWidget extends StatefulWidget {
  const TopupMileageWidget({Key key}) : super(key: key);

  @override
  _TopupMileageWidgetState createState() => _TopupMileageWidgetState();
}

class _TopupMileageWidgetState extends State<TopupMileageWidget>
    with TickerProviderStateMixin {
  String transactionId;
  TextEditingController amountNGNmileageController;
  final creditCardFormKey = GlobalKey<FormState>();
  CreditCardModel creditCardInfo = emptyCreditCard();
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final animationsMap = {
    'textFieldOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      hideBeforeAnimating: false,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 40),
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        opacity: 1,
      ),
    ),
  };

  @override
  void initState() {
    super.initState();
    startPageLoadAnimations(
      animationsMap.values
          .where((anim) => anim.trigger == AnimationTrigger.onPageLoad),
      this,
    );

    amountNGNmileageController = TextEditingController();
    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'topupMileage'});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).darkBackground,
      body: Form(
        key: formKey,
        autovalidateMode: AutovalidateMode.disabled,
        child: Column(
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
                            'Top Up Mileage',
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
                                    'TOPUP_MILEAGE_close_rounded_ICN_ON_TAP');
                                logFirebaseEvent('IconButton_Navigate-Back');
                                Navigator.pop(context);
                              },
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: 100,
                        constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width * 0.8,
                        ),
                        decoration: BoxDecoration(),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                          child: TextFormField(
                            controller: amountNGNmileageController,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelStyle: FlutterFlowTheme.of(context)
                                  .title1
                                  .override(
                                    fontFamily: 'Lexend Deca',
                                    color:
                                        FlutterFlowTheme.of(context).grayLight,
                                    fontWeight: FontWeight.w300,
                                  ),
                              hintText: 'Amount (NGN)',
                              hintStyle: FlutterFlowTheme.of(context)
                                  .title1
                                  .override(
                                    fontFamily: 'Lexend Deca',
                                    color:
                                        FlutterFlowTheme.of(context).grayLight,
                                    fontWeight: FontWeight.w300,
                                  ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).grayDark,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).grayDark,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              contentPadding: EdgeInsetsDirectional.fromSTEB(
                                  20, 24, 24, 24),
                            ),
                            style: FlutterFlowTheme.of(context).title1,
                            textAlign: TextAlign.center,
                            keyboardType: const TextInputType.numberWithOptions(
                                signed: true, decimal: true),
                            validator: (val) {
                              if (val == null || val.isEmpty) {
                                return 'Please enter an amount';
                              }

                              return null;
                            },
                          ).animated(
                              [animationsMap['textFieldOnPageLoadAnimation']]),
                        ),
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
                        padding: EdgeInsetsDirectional.fromSTEB(20, 40, 20, 20),
                        child: FFButtonWidget(
                          onPressed: () async {
                            logFirebaseEvent(
                                'TOPUP_MILEAGE_PAGE_TOP_UP_BTN_ON_TAP');
                            logFirebaseEvent('Button_Braintree-Payment');
                            final transacAmount =
                                double.parse(amountNGNmileageController.text);
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

                            logFirebaseEvent('Button_Update-Local-State');
                            setState(() => FFAppState().mileageBalance =
                                FFAppState().mileageBalance +
                                    functions.mileageBalance(
                                        functions.ngnToKm(double.parse(
                                            amountNGNmileageController.text)),
                                        0.0,
                                        0.0));
                            logFirebaseEvent('Button_Navigate-To');
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    NavBarPage(initialPage: 'mainDashboard'),
                              ),
                            );

                            setState(() {});
                          },
                          text: 'Top Up',
                          options: FFButtonOptions(
                            width: double.infinity,
                            height: 40,
                            color: FlutterFlowTheme.of(context).primaryColor,
                            textStyle:
                                FlutterFlowTheme.of(context).subtitle2.override(
                                      fontFamily: 'Lexend Deca',
                                      color: FlutterFlowTheme.of(context)
                                          .darkBackground,
                                    ),
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(12),
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
      ),
    );
  }
}
