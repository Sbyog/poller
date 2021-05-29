import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../polls/polls_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePageWidget extends StatefulWidget {
  HomePageWidget({
    Key key,
    this.pollname,
  }) : super(key: key);

  final String pollname;

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.primaryColor,
        automaticallyImplyLeading: false,
        title: Text(
          'Poller',
          style: FlutterFlowTheme.title1.override(
            fontFamily: 'Poppins',
          ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 4,
      ),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                      child: Text(
                        'Make your selection',
                        textAlign: TextAlign.start,
                        style: FlutterFlowTheme.subtitle2.override(
                          fontFamily: 'Poppins',
                          fontSize: 20,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            StreamBuilder<List<PollsRecord>>(
              stream: queryPollsRecord(
                queryBuilder: (pollsRecord) =>
                    pollsRecord.where('pollname', isEqualTo: widget.pollname),
                singleRecord: true,
              ),
              builder: (context, snapshot) {
                // Customize what your widget looks like when it's loading.
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                }
                List<PollsRecord> rowPollsRecordList = snapshot.data;
                // Customize what your widget looks like with no query results.
                if (snapshot.data.isEmpty) {
                  // return Container();
                  // For now, we'll just include some dummy data.
                  rowPollsRecordList = createDummyPollsRecord(count: 1);
                }
                final rowPollsRecord = rowPollsRecordList.first;
                return Padding(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Stack(
                                children: [
                                  Align(
                                    alignment: Alignment(0, 0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.network(
                                        rowPollsRecord.choiceAImg,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 200,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment(0, 0),
                                    child: Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(0, 150, 0, 0),
                                      child: FFButtonWidget(
                                        onPressed: () {
                                          print('Button pressed ...');
                                        },
                                        text: rowPollsRecord.choiceA,
                                        options: FFButtonOptions(
                                          width: 130,
                                          height: 40,
                                          color: Color(0xAB313131),
                                          textStyle: FlutterFlowTheme.subtitle2
                                              .override(
                                            fontFamily: 'Poppins',
                                            color: Colors.white,
                                          ),
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 0,
                                          ),
                                          borderRadius: 12,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Stack(
                                children: [
                                  Align(
                                    alignment: Alignment(0, 0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.network(
                                        rowPollsRecord.choiceBImg,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 200,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment(0, 0),
                                    child: Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(0, 150, 0, 0),
                                      child: FFButtonWidget(
                                        onPressed: () {
                                          print('Button pressed ...');
                                        },
                                        text: rowPollsRecord.choiceB,
                                        options: FFButtonOptions(
                                          width: 130,
                                          height: 40,
                                          color: Color(0xAB313131),
                                          textStyle: FlutterFlowTheme.subtitle2
                                              .override(
                                            fontFamily: 'Poppins',
                                            color: Colors.white,
                                            fontSize: 12,
                                          ),
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 0,
                                          ),
                                          borderRadius: 12,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(10, 0, 5, 0),
                      child: FFButtonWidget(
                        onPressed: () {
                          print('Button pressed ...');
                        },
                        text: 'Load next poll',
                        options: FFButtonOptions(
                          width: 160,
                          height: 40,
                          color: Color(0x00FFFFFF),
                          textStyle: FlutterFlowTheme.subtitle2.override(
                            fontFamily: 'Poppins',
                            color: Color(0xFF020202),
                            fontSize: 14,
                          ),
                          elevation: 0,
                          borderSide: BorderSide(
                            color: Color(0xAB313131),
                            width: 1,
                          ),
                          borderRadius: 12,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(5, 0, 10, 0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PollsWidget(),
                            ),
                          );
                        },
                        text: 'List More Polls',
                        options: FFButtonOptions(
                          width: 160,
                          height: 40,
                          color: Color(0x00FFFFFF),
                          textStyle: FlutterFlowTheme.subtitle2.override(
                            fontFamily: 'Poppins',
                            color: Color(0xFF020202),
                            fontSize: 14,
                          ),
                          elevation: 0,
                          borderSide: BorderSide(
                            color: Color(0xAB313131),
                            width: 1,
                          ),
                          borderRadius: 12,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                      child: Text(
                        'Popular Polls',
                        textAlign: TextAlign.start,
                        style: FlutterFlowTheme.title3.override(
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: StreamBuilder<List<PollsRecord>>(
                stream: queryPollsRecord(
                  queryBuilder: (pollsRecord) =>
                      pollsRecord.orderBy('totalvotes', descending: true),
                  limit: 10,
                ),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Center(child: CircularProgressIndicator());
                  }
                  List<PollsRecord> listViewPollsRecordList = snapshot.data;
                  // Customize what your widget looks like with no query results.
                  if (snapshot.data.isEmpty) {
                    // return Container();
                    // For now, we'll just include some dummy data.
                    listViewPollsRecordList = createDummyPollsRecord(count: 10);
                  }
                  return Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.vertical,
                      itemCount: listViewPollsRecordList.length,
                      itemBuilder: (context, listViewIndex) {
                        final listViewPollsRecord =
                            listViewPollsRecordList[listViewIndex];
                        return Container(
                          width: 100,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Color(0xFFEEEEEE),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Text(
                                  listViewPollsRecord.pollname,
                                  textAlign: TextAlign.start,
                                  style: FlutterFlowTheme.subtitle2.override(
                                    fontFamily: 'Poppins',
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  listViewPollsRecord.totalvotes.toString(),
                                  textAlign: TextAlign.end,
                                  style: FlutterFlowTheme.bodyText1.override(
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
