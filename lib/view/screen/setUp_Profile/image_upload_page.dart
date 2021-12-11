import 'dart:io';

import 'package:care_plus_doctor/constents/constant.dart';
import 'package:care_plus_doctor/controller/doctor/user_edit_img_ctrl.dart';
import 'package:care_plus_doctor/helper/alertDialogue.dart';
import 'package:care_plus_doctor/helper/snackbarDialouge.dart';
import 'package:care_plus_doctor/view/screen/setUp_Profile/setUp_Profile.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../basic_functions.dart';


class NewImageUploadPage extends StatefulWidget {



  const NewImageUploadPage({Key? key}) : super(key: key);

  @override
  _NewImageUploadPageState createState() => _NewImageUploadPageState();
}

class _NewImageUploadPageState extends State<NewImageUploadPage> {

  final navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(

      onWillPop: () async {
        Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => SetupProfile()));
        return true;
      },
      child: Scaffold(

          body: imageUploadSection()
      ),
    );
  }



  bool visibleUpload = false;
  late File img;
  File? imageFile;
  Widget _setImageView() {
    if (imageFile != null) {
      return Image.file(imageFile!, width: 250, height: 250);
    } else {
      return Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Text( "Please Select an Image",
          style: TextStyle(
            fontSize: 16
          ),
          ),
        ),
      );
    }
  }
  Future<void> _showSelectionDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            // title: Text("fromWhereDoYouWantToTakePhoto"),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    GestureDetector(
                      child: ListTile(
                        title: Text('Gallery'),
                        isThreeLine: true,
                        subtitle: Text('From Gallery'),
                        leading: Icon(Icons.slideshow),
                        trailing: Text('Select'),
                      ),


                      onTap: () {
                        _openGallery(context);
                      },
                    ),
                    Padding(padding: EdgeInsets.all(8.0)),
                    GestureDetector(
                      child: ListTile(
                        title: Text('Camera'),
                        isThreeLine: true,
                        subtitle: Text('From Camera'),
                        leading: Icon(Icons.camera_alt_outlined),
                        trailing: Text('Select'),
                      ),
                      onTap: () {
                        _openCamera(context);
                      },
                    )
                  ],
                ),
              ));
        });
  }
  void _openGallery(BuildContext context) async {
    var picture = await ImagePicker().pickImage(source: ImageSource.gallery,imageQuality: 50, maxWidth: 400,maxHeight: 700);
    this.setState(() {
      imageFile = File(picture!.path);
      visibleUpload = true;
    });
    Navigator.of(context).pop();
  }
  void _openCamera(BuildContext context) async {
    var picture = await ImagePicker().pickImage(source: ImageSource.camera,imageQuality: 50);
    this.setState(() {
      imageFile = File(picture!.path);
      visibleUpload = true;
    });
    Navigator.of(context).pop();
  }







  imageUploadSection() {
    return Container(
      child: ListView(
        children: [



          _setImageView(),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Center(
                child: RaisedButton(
                  color: Colors.green,
                  onPressed: () {
                    setState(() {
                      _showSelectionDialog(context);
                      // visibleUpload = true;
                    });
                  },
                  child: Text(
                    "Select Image",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),

              Visibility(
                visible: visibleUpload,
                child: RaisedButton(
                  color: Colors.green,
                  child: Text("Upload Image", style: TextStyle(
                    color: Colors.white
                  ),),
                  onPressed: () async {
                    // String presName = presNameC.text;
                    // String presType = presTypeC.text;
                    if ((imageFile != null)) {
                      await UserRegisterControllerExtraImg.postRequestRegistrationExtra(context, imageFile, USERTOKEN)
                          .then((value) {
                        print(value.statusCode);
                        print(value.statusMessage);
                        print(value);
                        if (value.statusCode == 200) {
                          // Navigator.pop(context,"Bar");
                          Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => SetupProfile()),);

                        }
                      });
                    } else {
                      // BasicFunctions.showAlertDialogTOView(context, 'Warning', 'Select an image to upload');
                      BasicFunctions.showAlertDialogTOView(context,
                          "Warning",
                          "Please Select an Image to Upload");
                    }
                  },
                ),
              )
            ],
          ),



        ],
      ),
    );
  }
}
