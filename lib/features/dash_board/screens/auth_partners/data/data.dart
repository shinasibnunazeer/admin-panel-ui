import 'package:admin_panel/features/dash_board/screens/auth_partners/models/auth_partner_model.dart';
import 'package:admin_panel/features/dash_board/screens/subscribed_users/controllers/sub_user_controller.dart';
import 'package:admin_panel/features/dash_board/screens/subscribed_users/models/sub_user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import shadwon
import 'package:intl/intl.dart';

class AuthData extends DataTableSource {
  AuthData({required this.data});
  final List<AAuthPartnerModel> data;
  // ASubUserController.instance.searchData();

  @override
  DataRow? getRow(int index) {
    return DataRow(cells: [
      DataCell(InkWell(
          onTap: () {
            Get.defaultDialog(
                title: 'Add Ticket',
                // if you want to do anything on confirm button press
                content: SizedBox(
                  width: 300,
                  child: Column(
                    children: [
                      TextField(
                        decoration: InputDecoration(labelText: 'Ticket Title'),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                        maxLines: 5,
                        decoration:
                            InputDecoration(labelText: 'Ticket Description'),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      //SUBMIT
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text('Submit'),
                      )
                    ],
                  ),
                ));
          },
          child: Text(data[index].x))),
      DataCell(Text(data[index].about)),
      DataCell(Text(data[index].phone.toString())),
      DataCell(
        Text(data[index].phone.toString()),
      ),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => data.length;

  @override
  int get selectedRowCount => 0;
}
