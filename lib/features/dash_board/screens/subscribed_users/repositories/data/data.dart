import 'package:admin_panel/features/dash_board/screens/subscribed_users/controllers/sub_user_controller.dart';
import 'package:admin_panel/features/dash_board/screens/subscribed_users/models/sub_user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import shadwon
import 'package:intl/intl.dart';

class Data extends DataTableSource {
  Data({required this.data});
  final List<ASubcribedUserModel> data;
  // ASubUserController.instance.searchData();

  @override
  DataRow? getRow(int index) {
    return DataRow(cells: [
      DataCell(InkWell(
          onTap: () {
            showDialog(
                context: Get.context!,
                builder: (context) => AlertDialog(
                    title: Title(color: Colors.red, child: Text("Add Ticket")),
                    // if you want to do anything on confirm button press
                    content: SizedBox(
                      width: 300,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const TextField(
                            decoration:
                                InputDecoration(labelText: 'Ticket Title'),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const TextField(
                            maxLines: 5,
                            decoration: InputDecoration(
                                labelText: 'Ticket Description'),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {},
                                  child: const Text('Submit'),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: OutlinedButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('Cancel'),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    )));
          },
          child: Text(data[index].email))),
      DataCell(Text(data[index].contact)),
      DataCell(Text(data[index].currentPlan)),
      DataCell(
        Text(
          DateFormat('dd/MM/yyyy').format(
            data[index].subscriptionEndDate,
          ),
        ),
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
