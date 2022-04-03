import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:getinforme/Model/Home.dart';
import 'package:getinforme/core/bundle.dart';
import 'package:getinforme/feature/home/home_page_screen.dart';
import 'package:getinforme/utility/colors.dart';

import '../../core/routes.dart';

class PhoneAuthForm extends StatefulWidget {

  @override
  _PhoneAuthFormState createState() => _PhoneAuthFormState();
}

class _PhoneAuthFormState extends State<PhoneAuthForm> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController otpCode = TextEditingController();

  OutlineInputBorder border = OutlineInputBorder(
      borderSide: BorderSide(color: Colors.yellow, width: 3.0));

  bool isLoading = false;

  String? verificationId;

  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
        appBar: AppBar(title: Text("Verify OTP"),
          backwardsCompatibility: false,
),
        backgroundColor: AppColors.letsStartBackground,
        body: Center(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: size.width * 0.8,
                  child: TextFormField(
                      keyboardType: TextInputType.phone,
                      controller: phoneNumber,
                      decoration: InputDecoration(
                        labelText: "Enter Phone",
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 15.0, horizontal: 10.0),
                        border: border,
                      )),
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                SizedBox(
                  width: size.width * 0.8,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: otpCode,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: "Enter Otp",
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 10.0),
                      border: border,
                      suffixIcon: Padding(
                        child: Icon(
                          Icons.remove_red_eye,
                          size: 15,
                        ),
                        padding: EdgeInsets.only(top: 15, left: 15),
                      ),
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.only(bottom: size.height * 0.05)),
                !isLoading
                    ? SizedBox(
                  width: size.width * 0.8,
                  child: OutlinedButton(
                    onPressed: () async {
                     // FirebaseService service = new FirebaseService();
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          isLoading = true;
                        });
                        await phoneSignIn(phoneNumber: phoneNumber.text);
                      }
                    },
                    child: Text('SignIn'),
                    style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all<Color>(
                           Colors.yellow),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.yellow),
                        side: MaterialStateProperty.all<BorderSide>(
                            BorderSide.none)),
                  ),
                )
                    : CircularProgressIndicator(),
              ],
            ),
          ),
        ));
  }
  Future<void> phoneSignIn({required String phoneNumber}) async {
    await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: _onVerificationCompleted,
        verificationFailed: _onVerificationFailed,
        codeSent: _onCodeSent,
        codeAutoRetrievalTimeout: _onCodeTimeout);
  }

  _onVerificationCompleted(PhoneAuthCredential authCredential) async {
    print("verification completed ${authCredential.smsCode}");
    User? user = FirebaseAuth.instance.currentUser;
    setState(() {
      this.otpCode.text = authCredential.smsCode!;
    });
    if (authCredential.smsCode != null) {
 /*     try{
        UserCredential credential =
        await user!.linkWithCredential(authCredential);
      }on FirebaseAuthException catch(e){
        if(e.code == 'provider-already-linked'){
          await _auth.signInWithCredential(authCredential);
        }
      }*/
      setState(() {
        isLoading = false;
      });

      navigateToScreenAndReplace(Screen.Home);
    }
  }
  Future navigateToScreenAndReplace(Screen screen) async {
    await Navigator.pushReplacementNamed(context, screen.toString());
  }

  _onVerificationFailed(FirebaseAuthException exception) {
    if (exception.code == 'invalid-phone-number') {
      showMessage("The phone number entered is invalid!");
    }
  }

  _onCodeSent(String verificationId, int? forceResendingToken) {
    this.verificationId = verificationId;
    print(forceResendingToken);
    print("code sent");
  }

  _onCodeTimeout(String timeout) {
    return null;
  }

  void showMessage(String errorMessage) {
    showDialog(
        context: context,
        builder: (BuildContext builderContext) {
          return AlertDialog(
            title: Text("Error"),
            content: Text(errorMessage),
            actions: [
              TextButton(
                child: Text("Ok"),
                onPressed: () async {
                  Navigator.of(builderContext).pop();
                },
              )
            ],
          );
        }).then((value) {
      setState(() {
        isLoading = false;
      });
    });
  }
  void _navigateToNextScreen(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage()));
  }
}