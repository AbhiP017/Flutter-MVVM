import 'package:flutter/material.dart';
import 'package:flutter_mvvm_provider/models/users_list_model.dart';
import 'package:flutter_mvvm_provider/utilities/constants.dart';

//import '../utilities/constants.dart';

class UsersListCard extends StatefulWidget {
  final List<User> usersList;
  final int index;

  const UsersListCard({Key? key, required this.usersList, required this.index}) : super(key: key);

  @override
  _UsersListCardState createState() => _UsersListCardState();
}

class _UsersListCardState extends State<UsersListCard> {
  @override
  Widget build(BuildContext context) {

    User userInfo = widget.usersList.elementAt(widget.index);

    return Container(
      margin: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

            //  Name
            Row(children: [
              Text("Name:",style: TextStyle(fontSize: 16),),
              SizedBox(width: 10,),
              Text(userInfo.name.toString(), style: kNormalTextStyle(18.0,kPrimaryTextColor,"Inter",true)),
            ],),
            // Email
            Row(children: [
              Text("Email:",style: TextStyle(fontSize: 16),),
              SizedBox(width: 10,),
              Text(userInfo.email.toString(), style: kNormalTextStyle(18.0,kPrimaryTextColor,"Inter",false)),
            ],),
            // Phone
            Row(children: [
              Text("Phone:",style: TextStyle(fontSize: 16),),
              SizedBox(width: 10,),
              Text(userInfo.phone.toString(), style: kNormalTextStyle(18.0,kPrimaryTextColor,"Inter",false)),
            ],),
            // Company
            Row(children: [
              Text("Website:",style: TextStyle(fontSize: 16),),
              SizedBox(width: 10,),
              Text(userInfo.website.toString(), style: kNormalTextStyle(18.0,kPrimaryTextColor,"Inter",false)),
            ],),
            // Website
            Row(children: [
              Text("Company:",style: TextStyle(fontSize: 16),),
              SizedBox(width: 10,),
              Text(userInfo.company.toString(), style: kNormalTextStyle(18.0,kPrimaryTextColor,"Inter",false)),
            ],),
        ],
      ),
    );
  }
}
