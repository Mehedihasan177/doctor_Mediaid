import 'dart:io';

import 'package:care_plus_doctor/constents/constant.dart';
import 'package:care_plus_doctor/controller/doctor/user_edit_img_ctrl.dart';
import 'package:care_plus_doctor/helper/alertDialogue.dart';
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

  bool visibleUpload = false;

  late File img;
  late File imageFile;

  // TextEditingController presTypeC = new TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          ListView(
                children: [
                  SizedBox(height: 80),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () => Navigator.pop(context),
                          child: Container(
                            height: 24,
                            width: 24,
                            child: Image(
                              image: AssetImage("assets/images/Back Button.png"),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        Text("upload image"),
                        Container(),
                      ],
                    ),
                  ),
                  // SizedBox(height: 30),
                  // Padding(
                  //     padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  //     child: StandardTextField(
                  //       text: "Title",
                  //       controller: presNameC,
                  //     )),
                  // SizedBox(height: 20),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  //   child: StandardTextField(
                  //     text: "Type",
                  //     controller: presTypeC,
                  //   ),
                  // ),
                  SizedBox(height: 20),
                  _setImageView(),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      OutlineButton(
                        padding: EdgeInsets.all(10),
                        onPressed: () {
                          setState(() {
                            _showSelectionDialog(context);
                            // visibleUpload = true;
                          });
                        },
                        color: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(20), bottomRight: Radius.circular(5)),
                        ),
                        borderSide: BorderSide(color: Colors.blue),
                        child: Text(
                          "Select image",
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                      Visibility(
                        visible: visibleUpload,
                        child: ElevatedButton(
                          // text: "Upload",
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
                                  AlertDialogueHelper().showAlertDialog(context, 'Warning', "Image Uploaded Successfully");

                                }
                              });
                            } else {
                              // BasicFunctions.showAlertDialogTOView(context, 'Warning', 'Select an image to upload');
                              BasicFunctions.showAlertDialogTOView(context,
                                  "uploadImageSelectTitle",
                                  "uploadImageSelectMessage");
                            }
                          }, child: null,
                        ),
                      )
                    ],
                  ),
                ],
              ),


        ],
      ),
    );
  }

  Widget _setImageView() {
    if (imageFile != null) {
      return Image.file(imageFile, width: 250, height: 250);
    } else {
      return Center(
        child: Text( "pleaseSelectAnImage"),
      );
    }
  }

  Future<void> _showSelectionDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: Text("fromWhereDoYouWantToTakePhoto"),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    GestureDetector(
                      child: Text("gallery"),
                      onTap: () {
                        _openGallery(context);
                      },
                    ),
                    Padding(padding: EdgeInsets.all(8.0)),
                    GestureDetector(
                      child: Text("camera"),
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
    var picture = await ImagePicker.platform;
    this.setState(() {
      imageFile = picture as File;
      visibleUpload = true;
    });
    Navigator.of(context).pop();
  }

  void _openCamera(BuildContext context) async {
    var picture = await ImagePicker.platform;
    this.setState(() {
      imageFile = picture as File;
      visibleUpload = true;
    });
    Navigator.of(context).pop();
  }
}
