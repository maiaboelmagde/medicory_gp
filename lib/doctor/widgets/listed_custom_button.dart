import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:medicory_gp/common/constants.dart';
import 'package:medicory_gp/doctor/widgets/custom_button.dart';

class ListedCustomButton extends StatefulWidget {
  const ListedCustomButton(
      {super.key, required this.title, required this.myList});
  final String title;
  final List<Map<String, dynamic>> myList;

  @override
  State<ListedCustomButton> createState() =>
      _ListedCustomButtonState(title: title, myList: myList);
}

class _ListedCustomButtonState extends State<ListedCustomButton> {
  _ListedCustomButtonState({required this.title, required this.myList});
  final String title;
  final List<Map<String, dynamic>> myList;
  bool flag = false;
  @override
  Widget build(BuildContext context) {
    return (flag)
        ? Container(
            height: 380,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: FadeInUp(
                      duration: const Duration(milliseconds: 1600),
                      child: MaterialButton(
                        onPressed: () {
                          flag = false;
                          setState(() {});
                        },
                        height: 50,
                        // margin: EdgeInsets.symmetric(horizontal: 50),
                        color: kColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        // decoration: BoxDecoration(
                        // ),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                title,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              Icon(
                                Icons.arrow_drop_down,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ),
                      )),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                  height: 330,
                  child: ListView.builder(
                      itemCount: myList.length,
                      itemBuilder: (context, indx) {
                        return CustomButton(
                            title: myList[indx]['title'],
                            onPressed: () {
                               if(myList[indx]['method'] == 'named'){
                              Navigator.pushNamed(
                                  context, myList[indx]['onPressed']);
                              }else{
                                Navigator.push(context, MaterialPageRoute(builder: (context){
                                  return myList[indx]['onPressed'];
                                }));
                              }
                            });
                      }),
                )
              ],
            ))
        : Padding(
            padding: const EdgeInsets.all(10.0),
            child: FadeInUp(
                duration: Duration(milliseconds: 1600),
                child: MaterialButton(
                  onPressed: () {
                    flag = true;
                    setState(() {});
                  },
                  height: 50,
                  // margin: EdgeInsets.symmetric(horizontal: 50),
                  color:kColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  // decoration: BoxDecoration(
                  // ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      Icon(
                        Icons.arrow_drop_up,
                        color: Colors.white,
                      )
                    ],
                  ),
                )),
          );
  }
}
