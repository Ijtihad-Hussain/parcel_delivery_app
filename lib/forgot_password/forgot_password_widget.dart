import '../auth/auth_util.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgotPasswordWidget extends StatefulWidget {
  const ForgotPasswordWidget({Key key}) : super(key: key);

  @override
  _ForgotPasswordWidgetState createState() => _ForgotPasswordWidgetState();
}

class _ForgotPasswordWidgetState extends State<ForgotPasswordWidget> {
  TextEditingController emailAddressController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    emailAddressController = TextEditingController();
    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'forgotPassword'});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xFF1A1F24),
        automaticallyImplyLeading: false,
        leading: InkWell(
          onTap: () async {
            logFirebaseEvent('FORGOT_PASSWORD_Icon_ydd5jcke_ON_TAP');
            logFirebaseEvent('Icon_Navigate-Back');
            Navigator.pop(context);
          },
          child: Icon(
            Icons.chevron_left_rounded,
            color: FlutterFlowTheme.of(context).grayLight,
            size: 32,
          ),
        ),
        title: Text(
          'Forgot Password',
          style: FlutterFlowTheme.of(context).title3,
        ),
        actions: [],
        centerTitle: false,
        elevation: 0,
      ),
      backgroundColor: FlutterFlowTheme.of(context).background,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 1,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).background,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Text(
                      'Enter the email associated with your account and we will send you a verification code.',
                      style: FlutterFlowTheme.of(context).bodyText1,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
              child: TextFormField(
                controller: emailAddressController,
                obscureText: false,
                decoration: InputDecoration(
                  labelStyle: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily: 'Lexend Deca',
                        color: Color(0x98FFFFFF),
                      ),
                  hintText: 'Enter your email...',
                  hintStyle: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily: 'Lexend Deca',
                        color: Color(0x98FFFFFF),
                      ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0x00000000),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0x00000000),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  filled: true,
                  fillColor: FlutterFlowTheme.of(context).darkBackground,
                  contentPadding:
                      EdgeInsetsDirectional.fromSTEB(20, 24, 20, 24),
                ),
                style: FlutterFlowTheme.of(context).bodyText1.override(
                      fontFamily: 'Lexend Deca',
                      color: FlutterFlowTheme.of(context).tertiaryColor,
                    ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
              child: FFButtonWidget(
                onPressed: () async {
                  logFirebaseEvent('FORGOT_PASSWORD_PAGE_Button-Login_ON_TAP');
                  logFirebaseEvent('Button-Login_Auth');
                  if (emailAddressController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Email required!',
                        ),
                      ),
                    );
                    return;
                  }
                  await resetPassword(
                    email: emailAddressController.text,
                    context: context,
                  );
                },
                text: 'Send Reset Link',
                options: FFButtonOptions(
                  width: 190,
                  height: 50,
                  color: Color(0xFFFFCD3C),
                  textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                        fontFamily: 'Lexend Deca',
                        color: FlutterFlowTheme.of(context).background,
                      ),
                  elevation: 3,
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
