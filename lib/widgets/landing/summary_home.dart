import 'package:athang_expense_tracker/domain/landing/summary_model.dart';
import 'package:athang_expense_tracker/domain/landing/summary_repo.dart';
import 'package:flutter/material.dart';

class SummaryHome extends StatefulWidget {
  @override
  State<SummaryHome> createState() => _SummaryHomeState();
}

class _SummaryHomeState extends State<SummaryHome> {
  SummaryModel summary = SummaryModel();

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    SummaryModel res = await loadSummaryData();
    setState(() {
      summary = res;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 260,
      child: Stack(
        children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  '../assets/images/background01.jpg',
                ), // Update with your image path
                fit: BoxFit.cover,
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              padding: EdgeInsets.all(16),
              margin: EdgeInsets.only(bottom: 16),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(8),
                    margin: EdgeInsets.only(bottom: 16),
                    child: Column(
                      children: [
                        Text(
                          'Current Balance',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                        Text(
                          'Nu.' + summary.openingBalance.toString(),
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    color: Color.fromARGB(28, 255, 255, 255),
                    margin: EdgeInsets.only(bottom: 16),
                    padding: EdgeInsets.all(8),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(4),
                            child: Row(
                              children: [
                                Container(
                                  width: 60,
                                  child: Center(
                                    child: Icon(
                                      Icons.arrow_downward,
                                      size: 36,
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Total Expense',
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.white),
                                        ),
                                        Text(
                                          'Nu. ${summary.expenses}',
                                          style: TextStyle(
                                              fontSize: 24,
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(4),
                            child: Row(
                              children: [
                                Container(
                                  width: 60,
                                  child: Center(
                                    child: Icon(
                                      Icons.arrow_upward_outlined,
                                      size: 36,
                                      color:
                                          const Color.fromARGB(255, 7, 230, 14),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Total Income',
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.white),
                                        ),
                                        Text(
                                          'Nu. ${summary.income}',
                                          style: TextStyle(
                                              fontSize: 24,
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
