import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderTrackingWidget extends StatefulWidget {
  const OrderTrackingWidget({Key key}) : super(key: key);

  @override
  _OrderTrackingWidgetState createState() => _OrderTrackingWidgetState();
}

class _OrderTrackingWidgetState extends State<OrderTrackingWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'orderTracking'});
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
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
                topLeft: Radius.circular(0),
                topRight: Radius.circular(0),
              ),
            ),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.8,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).background,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                  topLeft: Radius.circular(0),
                  topRight: Radius.circular(0),
                ),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 44, 20, 20),
                child: StreamBuilder<List<BookOrderRecord>>(
                  stream: queryBookOrderRecord(
                    singleRecord: true,
                  ),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 40,
                          height: 40,
                          child: SpinKitFadingGrid(
                            color: FlutterFlowTheme.of(context).primaryColor,
                            size: 40,
                          ),
                        ),
                      );
                    }
                    List<BookOrderRecord> columnBookOrderRecordList =
                        snapshot.data;
                    // Return an empty Container when the document does not exist.
                    if (snapshot.data.isEmpty) {
                      return Container();
                    }
                    final columnBookOrderRecord =
                        columnBookOrderRecordList.isNotEmpty
                            ? columnBookOrderRecordList.first
                            : null;
                    return Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Tracking',
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
                                      'ORDER_TRACKING_close_rounded_ICN_ON_TAP');
                                  logFirebaseEvent('IconButton_Navigate-Back');
                                  Navigator.pop(context);
                                },
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            height: 100,
                            constraints: BoxConstraints(
                              maxWidth: MediaQuery.of(context).size.width * 0.8,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                color: FlutterFlowTheme.of(context).grayDark,
                              ),
                            ),
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
                                      columnBookOrderRecord.senderName,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1,
                                    ),
                                  ],
                                ),
                                Icon(
                                  Icons.moped,
                                  color: FlutterFlowTheme.of(context).grayLight,
                                  size: 24,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            height: 100,
                            constraints: BoxConstraints(
                              maxWidth: MediaQuery.of(context).size.width * 0.8,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                color: FlutterFlowTheme.of(context).grayDark,
                              ),
                            ),
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
                                      columnBookOrderRecord.receiverPhone
                                          .toString(),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1,
                                    ),
                                  ],
                                ),
                                Icon(
                                  Icons.fact_check_outlined,
                                  color: FlutterFlowTheme.of(context).grayLight,
                                  size: 24,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            height: 100,
                            constraints: BoxConstraints(
                              maxWidth: MediaQuery.of(context).size.width * 0.8,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                color: FlutterFlowTheme.of(context).grayDark,
                              ),
                            ),
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
                                      columnBookOrderRecord.receiverLocation
                                          .toString(),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1,
                                    ),
                                  ],
                                ),
                                Icon(
                                  Icons.east,
                                  color: FlutterFlowTheme.of(context).grayLight,
                                  size: 24,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            height: 100,
                            constraints: BoxConstraints(
                              maxWidth: MediaQuery.of(context).size.width * 0.8,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                color: FlutterFlowTheme.of(context).grayDark,
                              ),
                            ),
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
                                      'Item delivered',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1,
                                    ),
                                  ],
                                ),
                                Icon(
                                  Icons.done_all_rounded,
                                  color: FlutterFlowTheme.of(context).grayLight,
                                  size: 24,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
            child: Text(
              'Tap to report a problem with this order',
              style: FlutterFlowTheme.of(context).bodyText1,
            ),
          ),
        ],
      ),
    );
  }
}
