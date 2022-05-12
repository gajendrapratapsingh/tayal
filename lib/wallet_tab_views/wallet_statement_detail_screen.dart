import 'package:flutter/material.dart';
import 'package:tayal/components/filterStatement.dart';

class WalletStatementTabScrren extends StatefulWidget {
  const WalletStatementTabScrren({Key key}) : super(key: key);

  @override
  _WalletStatementTabScrrenState createState() => _WalletStatementTabScrrenState();
}

class _WalletStatementTabScrrenState extends State<WalletStatementTabScrren> {

  String startDate = "From Date";
  String endDate = "To Date";

  DateTime selectedDate = DateTime.now();
  DateTime selectedStartDate = DateTime.now();
  DateTime selectedEndDate = DateTime.now();

  String radioItem = 'Mango';

  // Group Value for Radio Button.
  int id = 1;

  List<FilterStatement> fList = [
    FilterStatement(
      index: 1,
      name: "Yesterday",
    ),
    FilterStatement(
      index: 2,
      name: "Today",
    ),
    FilterStatement(
      index: 3,
      name: "Month Till Data",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        _selectStartDate(context);
                      },
                      child: Card(
                        elevation: 4.0,
                        child: Container(
                            height: size.height * 0.06,
                            color: Colors.indigo.shade50,
                            width: size.width * 0.44,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding:
                                  const EdgeInsets
                                      .only(
                                      left:
                                      10.0),
                                  child: Text(
                                    startDate,
                                    style: TextStyle(
                                        color: Colors
                                            .grey
                                            .shade700,
                                        fontSize:
                                        16.0),
                                  ),
                                ),
                                /*Padding(
                                    padding:
                                    const EdgeInsets
                                        .only(
                                        right:
                                        10.0),
                                    child:
                                    GestureDetector(
                                      onTap: () {
                                        _selectStartDate(
                                            context);
                                      },
                                      child: Image
                                          .asset(
                                          'assets/icons/calendar.png'),
                                    )),*/
                              ],
                            )),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        _selectedEndDate(context);
                      },
                      child: Card(
                        elevation: 4.0,
                        child: Container(
                            height: size.height * 0.06,
                            color: Colors.indigo.shade50,
                            width: size.width * 0.44,
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment
                                  .spaceBetween,
                              children: [
                                Padding(
                                  padding:
                                  const EdgeInsets
                                      .only(
                                      left:
                                      10.0),
                                  child: Text(
                                    endDate,
                                    style: TextStyle(
                                        color: Colors
                                            .grey
                                            .shade700,
                                        fontSize:
                                        16.0),
                                  ),
                                ),
                                /*Padding(
                                    padding:
                                    const EdgeInsets
                                        .only(
                                        right:
                                        10.0),
                                    child:
                                    GestureDetector(
                                      onTap: () {
                                        _selectedEndDate(context);
                                      },
                                      child: Image.asset('assets/icons/calendar.png'),
                                    )),*/
                              ],
                            )),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                  padding: EdgeInsets.all(0.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Radio(value: 1, groupValue: 'null', onChanged: (index) {}),
                                Text('Yesterday')
                              ],
                            ),
                            Row(
                              children: [
                                Radio(
                                    value: 1, groupValue: 'null', onChanged: (index) {}),
                                Text('Today')
                              ],
                            ),
                            Row(
                              children: [
                                Radio(
                                    value: 1, groupValue: 'null', onChanged: (index) {}),
                                Text('Till Date')
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
              )
            ],
          ),
          Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                height: 55,
                width: double.infinity,
                color: Colors.indigo,
                alignment: Alignment.center,
                child: Text("GET STATEMENT", style: TextStyle(color: Colors.white, fontSize: 16)),
              )
          )
        ],
      )
    );
  }

  Future<void> _selectStartDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedStartDate,
      firstDate: DateTime.now().subtract(Duration(days: 0)),
      //firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
      builder: (BuildContext context, Widget child) {
        return Theme(
          data: ThemeData(
              primaryColor: Colors.indigo,
              accentColor: Colors.indigo,
              primarySwatch: const MaterialColor(0xFF3949AB,
                <int, Color>{
                  50:  Colors.indigo,
                  100: Colors.indigo,
                  200: Colors.indigo,
                  300: Colors.indigo,
                  400: Colors.indigo,
                  500: Colors.indigo,
                  600: Colors.indigo,
                  700: Colors.indigo,
                  800: Colors.indigo,
                  900: Colors.indigo,
                },
              )),
          child: child,
        );
      },
    );

    if (picked != null && picked != selectedStartDate)
      setState(() {
        selectedStartDate = picked;
        startDate = selectedStartDate.year.toString() +
            "-" +
            selectedStartDate.month.toString() +
            "-" +
            selectedStartDate.day.toString();
      });
  }

  Future<void> _selectedEndDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedEndDate,
        firstDate: DateTime.now().subtract(Duration(days: 0)),
        //firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101),
        builder: (BuildContext context, Widget child) {
          return Theme(
            data: ThemeData(
                primaryColor: Colors.indigo,
                accentColor: Colors.indigo,
                primarySwatch: const MaterialColor(0xFF3949AB,
                  <int, Color>{
                    50:  Colors.indigo,
                    100: Colors.indigo,
                    200: Colors.indigo,
                    300: Colors.indigo,
                    400: Colors.indigo,
                    500: Colors.indigo,
                    600: Colors.indigo,
                    700: Colors.indigo,
                    800: Colors.indigo,
                    900: Colors.indigo,
                  },
                )),
            child: child,
          );}
    );

    if (picked != null && picked != selectedEndDate)
      setState(() {
        selectedEndDate = picked;
        endDate = selectedEndDate.year.toString() +
            "-" +
            selectedEndDate.month.toString() +
            "-" +
            selectedEndDate.day.toString();
      });
  }
}
