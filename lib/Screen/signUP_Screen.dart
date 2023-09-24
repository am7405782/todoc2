import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do/%D9%8Dshared/Style/color.dart';
import 'package:to_do/Layout/HomeLayOut.dart';
import 'package:to_do/fireBase/FireBAseFuncation.dart';

class SignUp extends StatelessWidget {
  static const String routeName="SignUp";
  var nameController=TextEditingController();
  var ageController=TextEditingController();

  var emailController=TextEditingController();

  var passController=TextEditingController();
  var formKey =GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;

    return  Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              SizedBox(
                height: size.height*0.09,
              ),
              Text(
                "SignUp",
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
                  controller: nameController,
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
                      "Name",
                      style: TextStyle(
                        fontSize: 22,
                      ),

                    ),
                  ),
                  validator: (value) {

                    if(value==null || value.isEmpty  ){
                      return "pleas enter Name ";
                    }
                    return null;

                  },

                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: ageController,
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
                      "Age",
                      style: TextStyle(
                        fontSize: 22,
                      ),

                    ),
                  ),
                  validator: (value) {

                    if (value == null || value.isEmpty) {
                      return 'Please enter Age';
                    }
                    return null;
                  },

                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  controller: emailController,
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

                    if(value==null || value.isEmpty ){
                      return "pleas enter UserName ";
                    }
                    return null;

                  },

                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  controller: passController,
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
                        fontSize: 22,
                      ),

                    ),
                  ),
                  validator: (value) {

                    if(value==null || value.isEmpty ){
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
                print(emailController.text);
                if(formKey.currentState!.validate()){
                  FireBaseFuncation.CreatAuthAccount(
                      emailController.text,
                      passController.text,
                    nameController.text,
                    ageController.text,
                      (){
                        Navigator.pushNamed(context, Home_LayOut.routeName);
                      },


                  );
                }

              },
                color: primaryColor,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Sign up ",
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
                  Text("Have Account ?",
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
                    child: Text(" login>>",
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
      ),
    );
  }
}
