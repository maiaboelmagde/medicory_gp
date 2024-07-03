import 'package:flutter/material.dart';
import 'package:medicory_gp/common/constants.dart';
import 'package:medicory_gp/owner/services/owner_tests.dart';
import 'package:medicory_gp/owner/widgets/owner_tests_widget.dart';

class LabTestsResultsPage extends StatelessWidget {
  const LabTestsResultsPage({super.key, required this.userCode});
  final String userCode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tests Results'),
        backgroundColor: kColor,
      ),
      body: FutureBuilder(
          future: OwnerTests()
              .getAllTests(userCode: userCode),
          builder: (context, snap) {
            if (snap.hasData) {
              return ListView.builder(
                  itemCount: snap.data!.length,
                  itemBuilder: (context, indx) {
                    return OwnerTestsWidget( testInfo: snap.data![indx],);
                  });
            } else if (snap.hasError) {
              print(snap.error);
                  return Center(child: Text("This owner doesn't have current medication schedule!"));
            }else{
              return Center(child: CircularProgressIndicator(),);
            }
          }),
      
    );
  }
}
