class AAuthPartnerModel {
  final String about, instrgram, referalcode, userid, x, youtube, ifsc;
  final int bankAccountno, phone;

  AAuthPartnerModel(
      {required this.about,
      required this.instrgram,
      required this.referalcode,
      required this.userid,
      required this.x,
      required this.youtube,
      required this.bankAccountno,
      required this.ifsc,
      required this.phone});

  //empty
  static AAuthPartnerModel empty() => AAuthPartnerModel(
        about: '',
        instrgram: '',
        referalcode: '',
        userid: '',
        x: '',
        youtube: '',
        bankAccountno: 0,
        ifsc: '',
        phone: 0,
      );

  factory AAuthPartnerModel.fromMap(Map<String, dynamic> data) {
    if (data.isEmpty) {
      return AAuthPartnerModel.empty();
    } else {
      return AAuthPartnerModel(
        about: data['about'] ?? '',
        instrgram: data['instrgram'] ?? '',
        referalcode: data['referal_code'] ?? '',
        userid: data['user_id'] ?? '',
        x: data['x'] ?? '',
        youtube: data['youtube'] ?? '',
        bankAccountno: data['bank_account_no'] ?? 0,
        ifsc: data['ifsc'] ?? '',
        phone: data['phone'] ?? 0,
      );
    }
  }
}
