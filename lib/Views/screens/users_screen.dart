import 'package:flutter/material.dart';
import 'package:flutter_mvvm_provider/models/users_list_model.dart';
//import 'package:flutter_mvvm_provider/list_items/users_list_card.dart';
import 'package:flutter_mvvm_provider/network_service/response/status.dart';
import 'package:flutter_mvvm_provider/Views/screens/list_items/users_list_card.dart';
import 'package:flutter_mvvm_provider/utilities/common_utilities.dart';
import 'package:flutter_mvvm_provider/utilities/constants.dart';
import 'package:flutter_mvvm_provider/view_models/users_list_view_model.dart';
import 'package:flutter_mvvm_provider/widgets/loading.dart';
import 'package:provider/provider.dart';

/*import '../models/users_list_model.dart';
import '../utilities/constants.dart';
import '../widgets/loading.dart';*/

class UsersScreen extends StatefulWidget {
  const UsersScreen({Key? key}) : super(key: key);

  @override
  _UsersScreenState createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  UsersListViewModel _usersListViewModel = UsersListViewModel();
  List<User> _usersList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _usersListViewModel.wsUsersData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("MVVM Demo App"),
      centerTitle: true,
        backgroundColor: Colors.cyan,
      ),

      body: SafeArea(
        child: ChangeNotifierProvider<UsersListViewModel>(
          create: (BuildContext context) => _usersListViewModel,
          child: Consumer<UsersListViewModel>(
            builder: (context, viewModel, widget) {
              switch (viewModel.usersData.status) {
                case Status.LOADING:
                  CommonUtilities.printMsg("UsersList :: LOADING");
                  return const Loading();
                case Status.ERROR:
                  CommonUtilities.printMsg("UsersList :: ERROR"+ viewModel.usersData.message.toString());
                  return Center(
                      child: Text("No Users found!", style: kNormalTextStyle(18.0,kPrimaryTextColor,"Inter",false)));
                case Status.SUCCESS:
                  CommonUtilities.printMsg("UsersList :: COMPLETED");
                  if(viewModel.usersData.data!.isEmpty){
                    return Center(
                        child: Text("No Users found!", style: kNormalTextStyle(18.0,kPrimaryTextColor,"Inter",false)));
                  }else{
                    CommonUtilities.printMsg("UsersList" + viewModel.usersData.data!.length.toString());
                    _usersList.clear();
                    _usersList.addAll(viewModel.usersData.data!);
                    return usersListing(_usersList);
                  }
                default:
              }
              return const Loading();
            },
          ),
        ),
      ),
    );
  }

  Widget usersListing(List<User> _usersList) {
    return ListView.separated(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: _usersList.length,

        itemBuilder: (context, index) {
          return UsersListCard(usersList: _usersList,index: index);
        },

      separatorBuilder: (context, index) {
        return const Divider(color: kDividerColor,);
      },
    );
  }

}
