import 'package:flutter/material.dart';
import 'package:medicory_gp/common/constants.dart';
import 'package:medicory_gp/owner/services/owner_tests.dart';
import 'package:medicory_gp/owner/widgets/owner_imaging_widget.dart';

class ImagingTestsPage extends StatelessWidget {
  const ImagingTestsPage({super.key, required this.userCode});
  final String userCode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Imaging Results'),
        backgroundColor: kColor,
      ),
       body: FutureBuilder(
          future: OwnerTests()
              .getAllImages(userCode: userCode),
          builder: (context, snap) {
            if (snap.hasData) {
              return ListView.builder(
                  itemCount: snap.data!.length,
                  itemBuilder: (context, indx) {
                    return OwnerImagingWidget( testInfo: snap.data![indx],);
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
