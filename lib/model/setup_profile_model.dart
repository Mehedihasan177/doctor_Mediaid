
class SetUpProfile{
  late String gender;
  // late String name;
  late String specialization;
  late String designation;
  late String hospitalName;
  late String fee;
  late String chambers;
  late String introduction;
  late String experience;
  late String department;
  late String degree;
  late String address;



  // Map data1 = {
  //   'experience': "${_experience.text}",
  //   'fee': "${_fee.text}",
  //   'hospital_name': "${_serviceAt.text}",
  //   'designation': "${_designation.text}",
  //   'department': "${_department.text}",
  //   'degree': "${_degree.text}",
  //   'address': "${_address.text}",
  //   //'introduction': "${_introduction.text}",
  //   'chambers': "${_chember.text}",
  //   'gender': "${gender}",
  // };

  SetUpProfile({
    // required this.name,
    required this.specialization,
    required this.hospitalName,
    required this.designation,
    required this.fee,
    required this.chambers,
    required this.introduction,
    required this.gender,
    required this.address,
    required this.degree,
    required this.department,
    required this.experience,
});

}