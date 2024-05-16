import 'package:admin_panel/features/dash_board/screens/subscribed_users/models/sub_user_model.dart';
import 'package:admin_panel/features/dash_board/screens/subscribed_users/repositories/sub_user_repo.dart';
import 'package:get/get.dart';
import 'package:excel/excel.dart';

class ASubUserController extends GetxController {
  static ASubUserController get instance => Get.find();

  final isLoading = false.obs;
  final _subUserRepo = Get.put(ASubUserRepo());
  final asending = false.obs;

  RxList<ASubcribedUserModel> allSubUserList = <ASubcribedUserModel>[].obs;

  RxList<ASubcribedUserModel> serchResult = <ASubcribedUserModel>[].obs;

  //on in it
  @override
  void onInit() {
    getSubscribedUserData();
    super.onInit();
  }

  //sort data
  void sortData() {
    asending.value = !asending.value;

    serchResult.isEmpty
        ? allSubUserList.sort((a, b) {
            if (asending.value) {
              return a.subscriptionEndDate.compareTo(b.subscriptionEndDate);
            } else {
              return b.subscriptionEndDate.compareTo(a.subscriptionEndDate);
            }
          })
        : serchResult.sort((a, b) {
            if (asending.value) {
              return a.subscriptionEndDate.compareTo(b.subscriptionEndDate);
            } else {
              return b.subscriptionEndDate.compareTo(a.subscriptionEndDate);
            }
          });
  }

  //get data
  Future<void> getSubscribedUserData() async {
    try {
      isLoading.value = true;

      final value = await _subUserRepo.getSubscribedUserData();
      allSubUserList.assignAll(value);
      sortData();
    } catch (e) {
      print('Failed to load data $e');
    } finally {
      isLoading.value = false;
    }
  }

//search data
  searchData(String value) {
    if (value.isEmpty) {
      return;
    }
    final searchValue = value.toLowerCase();
    final searchResult = allSubUserList.where((element) {
      return element.email.toLowerCase().contains(searchValue) ||
          element.contact.toLowerCase().contains(searchValue) ||
          element.currentPlan.toLowerCase().contains(searchValue);
    }).toList();

    serchResult.assignAll(searchResult);
  }

  //filter data using expiry date between
  //sart date
  //end date

  void filterData(DateTime? startDate, DateTime? endDate) {
    if (startDate == null || endDate == null) {
      return;
    }
    final filterData = allSubUserList.where((element) {
      return element.subscriptionEndDate.isAfter(startDate) &&
          element.subscriptionEndDate.isBefore(endDate);
    }).toList();

    allSubUserList.assignAll(filterData);
  }

  Future<void> exportToExcel() async {
    try {
      print("started Exporting to excel");

      var excel = Excel.createExcel();
      var sheet = excel['Sheet1']; // Access the first worksheet

      // 2. Add headers (column names)
      sheet.appendRow([
        const TextCellValue('Email'),
        const TextCellValue('Contact'),
        const TextCellValue('Current Plan'),
        const TextCellValue('Expiry Date'),
      ]);

      // 3. Add data rows
      for (var user in allSubUserList) {
        sheet.appendRow([
          TextCellValue(user.email),
          TextCellValue(user.contact),
          TextCellValue(user.currentPlan),
          TextCellValue(user.subscriptionEndDate.toString()),
          // DateFormat('dd/MM/yyyy').format(user.subscriptionEndDate),
        ]);
      }

      // 4. Get the temporary directory path

      String path = 'subscribed_users.xlsx';

      // 5. Save the Excel file
      excel.save(fileName: path);
      print("finsihed Exported to excel");
      // 6. (Optional) Show a success message
    } catch (e) {
      print(
          'An error occurred while exporting the data to Excel: ${e.toString()}');
    }

    // 1. Create a new Excel instance
  }

  //dispose
  // @override
  // void onClose() {
  //   allSubUserList.clear();
  //   super.onClose();
  // }
}
