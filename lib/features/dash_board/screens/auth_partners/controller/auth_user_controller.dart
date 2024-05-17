import 'package:admin_panel/features/dash_board/screens/auth_partners/models/auth_partner_model.dart';
import 'package:admin_panel/features/dash_board/screens/auth_partners/repository/auth_user_repo.dart';
import 'package:admin_panel/features/dash_board/screens/subscribed_users/repositories/dash_board_repo.dart';
import 'package:admin_panel/features/dash_board/screens/subscribed_users/models/sub_user_model.dart';
import 'package:admin_panel/utils/const/api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:excel/excel.dart';
import 'package:intl/intl.dart';

class AAuthUserController extends GetxController {
  static AAuthUserController get instance => Get.find();

  final isLoading = false.obs;
  final _subUserRepo = Get.put(AAuthUserRepo());
  final asending = false.obs;

  RxList<AAuthPartnerModel> allSubUserList = <AAuthPartnerModel>[].obs;

  //on in it
  @override
  void onInit() {
    getSubscribedUserData();
    super.onInit();
  }

  RxString serachText = ''.obs;

  searchText(String value) {
    serachText.value = value;
  }

  // Rx<DateTime>? startDate = DateTime.now().obs;
  // Rx<DateTime>? endDate = DateTime.now().obs;

  Rx<DateTime>? startDate = DateTime(2020).obs;
  Rx<DateTime>? endDate = DateTime(2020).obs;

  //update
  void updateDateValues(DateTime? newStartDate, DateTime? newEndDate) {
    startDate?.value = newStartDate!;
    print('start date: ${startDate?.value.runtimeType}');

    endDate?.value = newEndDate!;

    // Explicitly refer to class-level variable using `this`
  }

  bool dateTimeIsSelected() {
    return startDate?.value != DateTime(2020) &&
        endDate?.value != DateTime(2020);
  }

//remove filter
  void removeFilter() {
    startDate?.value = DateTime(2020);
    endDate?.value = DateTime(2020);
  }

  //sort data

  //get data
  Future<void> getSubscribedUserData() async {
    try {
      isLoading.value = true;

      final value = await _subUserRepo.getUserData();
      allSubUserList.assignAll(value);
    } catch (e) {
      print('Failed to load data $e');
    } finally {
      isLoading.value = false;
    }
  }

//search data
  List<AAuthPartnerModel> searchData() {
    if (serachText.value.isEmpty) {
      return allSubUserList;
    }
    final searchValue = serachText.value.toLowerCase();
    final searchResult = allSubUserList.where((element) {
      return element.about.toLowerCase().contains(searchValue) ||
          element.x.toLowerCase().contains(searchValue) ||
          element.youtube.toLowerCase().contains(searchValue) ||
          element.referalcode.toLowerCase().contains(searchValue);
    }).toList();

    return searchResult;
  }

  //filter data using expiry date between
  //sart date
  //end date

  // List<AAuthPartnerModel> filterData() {
  //   if (startDate == null || endDate == null) {
  //     return searchData();
  //   } else if (startDate!.value == DateTime(2020) &&
  //       endDate!.value == DateTime(2020)) {
  //     return searchData();
  //   }
  //   final filterData = searchData().where((element) {
  //     return element.subscriptionEndDate.isAfter(startDate!.value) &&
  //         element.subscriptionEndDate.isBefore(endDate!.value);
  //   }).toList();

  //   return filterData;
  // }

  // Future<void> exportToExcel() async {
  //   try {
  //     print("started Exporting to excel");

  //     var excel = Excel.createExcel();
  //     var sheet = excel['Sheet1']; // Access the first worksheet

  //     // 2. Add headers (column names)
  //     sheet.appendRow([
  //       const TextCellValue('Email'),
  //       const TextCellValue('Contact'),
  //       const TextCellValue('Current Plan'),
  //       const TextCellValue('Expiry Date'),
  //     ]);

  //     // 3. Add data rows
  //     for (var user in filterData()) {
  //       sheet.appendRow([
  //         TextCellValue(user.email),
  //         TextCellValue(user.contact),
  //         TextCellValue(user.currentPlan),
  //         TextCellValue(user.subscriptionEndDate.toString()),
  //         // DateFormat('dd/MM/yyyy').format(user.subscriptionEndDate),
  //       ]);
  //     }

  //     // 4. Get the temporary directory path

  //     String path = 'subscribed_users.xlsx';

  //     // 5. Save the Excel file
  //     excel.save(fileName: path);
  //     print("finsihed Exported to excel");
  //     // 6. (Optional) Show a success message
  //   } catch (e) {
  //     print(
  //         'An error occurred while exporting the data to Excel: ${e.toString()}');
  //   }

  //   // 1. Create a new Excel instance
  // }
}
