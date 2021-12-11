// 'name': "${doctorRegReqModel.name}",
// 'email': "${doctorRegReqModel.specialization}",
// 'password': "${doctorRegReqModel.bmdcReg}",
// 'mobile': "${doctorRegReqModel.designation}",
// 'bmdc_reg': "${doctorRegReqModel.fee}",
// 'password_confirmation': "${doctorRegReqModel.chambers}",
// 'password_confirmation': "${doctorRegReqModel.introduction}",

class SetUpProfile{
  late String name;
  late String specialization;
  late String bmdcReg;
  late String designation;
  late String fee;
  late String chambers;
  late String introduction;

  SetUpProfile({
    required this.name,
    required this.specialization,
    required this.bmdcReg,
    required this.designation,
    required this.fee,
    required this.chambers,
    required this.introduction,
});

}