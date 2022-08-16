

import 'package:flutter/material.dart';

class LeavesAndLoans extends StatefulWidget {
  const LeavesAndLoans({Key? key}) : super(key: key);

  @override
  State<LeavesAndLoans> createState() => _LeavesAndLoansState();
}

class _LeavesAndLoansState extends State<LeavesAndLoans> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Leaves & Loans"),
      ),
    );
  }
}
