class ASubcribedUserModel {
  final String contact, email, currentPlan, userUid;
  final DateTime subscriptionEndDate;

  // Add other user details you need

  ASubcribedUserModel({
    required this.subscriptionEndDate,
    required this.currentPlan,
    required this.userUid,
    required this.contact,
    required this.email,
  });

  static ASubcribedUserModel empty() => ASubcribedUserModel(
        subscriptionEndDate: DateTime.now(),
        currentPlan: '',
        userUid: '',
        contact: '',
        email: '',
      );

//to json
  Map<String, dynamic> toJson() {
    return {
      'expiry_date': subscriptionEndDate,
      'description': currentPlan,
      'user_id': userUid,
      'contact': contact,
      'email': email,
    };
  }

  factory ASubcribedUserModel.fromMap(Map<String, dynamic> data) {
    if (data.isEmpty) {
      return ASubcribedUserModel.empty();
    } else {
      return ASubcribedUserModel(
        subscriptionEndDate: DateTime.fromMillisecondsSinceEpoch(
          data['expiry_date']['_seconds'] * 1000 +
              (data['expiry_date']['_nanoseconds'] / 1000000).round(),
        ),
        contact: data['contact'] ?? '',
        currentPlan: data['description'] ?? '',
        userUid: data['user_id'] ?? '',
        email: data['email'] ?? '',
      );
    }
  }
}
