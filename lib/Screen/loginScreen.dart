import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do/%D9%8Dshared/Style/color.dart';
import 'package:to_do/Layout/HomeLayOut.dart';
import 'package:to_do/Screen/signUP_Screen.dart';
import 'package:to_do/fireBase/FireBAseFuncation.dart';

class LoginSreen extends StatelessWidget {
static const String routeName="LoginSreen";
var formkey =GlobalKey<FormState>();
var emailAddress =TextEditingController();
var pasword =TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(
        key: formkey,
        child: Column(
          children: [
            SizedBox(
              height: size.height*0.2,
            ),
            Text(
              "Login",
              style: GoogleFonts.poppins(
                color: primaryColor,
                fontSize: 30,
                fontWeight: FontWeight.bold,

              ),
            ),
            SizedBox(
              height: size.height*0.1,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                controller: emailAddress,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: primaryColor,
                      style: BorderStyle.solid,

                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  disabledBorder: OutlineInputBorder(

                    borderSide: BorderSide(
                      color: primaryColor,
                      style: BorderStyle.solid,

                    ),
                    borderRadius: BorderRadius.circular(12),


                  ),
                  enabledBorder: OutlineInputBorder(

                    borderSide: BorderSide(
                      color: primaryColor,
                      style: BorderStyle.solid,

                    ),
                    borderRadius: BorderRadius.circular(12),


                  ),
                  label: Text(
                    "User Name",
                    style: TextStyle(
                      fontSize: 18,
                    ),

                  ),
                ),
                validator: (value) {
                   bool emailValid =
                  RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(value!);
                   if(value==null  ){
                     return "pleas enter UserName ";
                   }else if(!emailValid){
                     return "pleas enter Valid eamil";

                   }
                   return null;

                },

              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                controller: pasword,
                decoration: InputDecoration(

                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: primaryColor,
                      style: BorderStyle.solid,

                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  disabledBorder: OutlineInputBorder(

                    borderSide: BorderSide(
                      color: primaryColor,
                      style: BorderStyle.solid,

                    ),
                    borderRadius: BorderRadius.circular(12),


                  ),
                  enabledBorder: OutlineInputBorder(

                    borderSide: BorderSide(
                      color: primaryColor,
                      style: BorderStyle.solid,

                    ),
                    borderRadius: BorderRadius.circular(12),


                  ),

                  label: Text(
                    "passWord",
                    style: TextStyle(
                      fontSize: 18,
                    ),

                  ),
                ),
                validator: (value) {

                  if(value==null  ){
                    return "pleas enter pass ";
                  }

                  return null;

                },
              ),
            ),
            SizedBox(
              height: size.height*0.07,
            ),
            MaterialButton(onPressed: () {
              if(formkey.currentState!.validate()){
                FireBaseFuncation.userLogin(emailAddress.text,
                    pasword.text,
                    (){
                         showDialog(context: context,barrierDismissible: false,
                             builder: (context)=>
                             AlertDialog(
                               title: Text("Erorr"),
                               content: Text(
                                 "يحرامي ",
                               ),
                               actions: [
                                 ElevatedButton(onPressed: (){
                                   Navigator.pop(context);

                                 }, child: Text("ok"),),
                               ],


                         ));
                    },
                    (usermodel){
                   Navigator.pushReplacementNamed(context, Home_LayOut.routeName, arguments:  usermodel);
                    }
                );
              }

            },
              color: primaryColor,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Login",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Colors.white,
                    fontSize: 20,
                  ),

                ),
              ),
              shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: Colors.white,
                ),

              ),


            ),
            SizedBox(
              height: size.height*0.03,
            ),
            Row(
              children: [
                Text("Dont Have Account ?",
            style:GoogleFonts.poppins(
              color: Colors.grey,
              fontSize: 18,


            ) ,
            ),
                SizedBox(
                  width: 5,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, SignUp.routeName);
                  },
                  child: Text(" Creat Account>>",
                    style:GoogleFonts.poppins(
                      color: primaryColor,
                      fontSize: 18,


                    ) ,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
