import 'package:flutter/material.dart';
import 'package:todonew/core/page_routes_name.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool isObscurd=false;
  TextEditingController emailController =TextEditingController();
  TextEditingController passController =TextEditingController();
  var formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery =MediaQuery.of(context);
    ThemeData theme =Theme.of(context);
    return Container(
      decoration:   const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/imgs/login_background.png"),
          fit: BoxFit.cover,

        ),
        color: Color(0xffDFECDB),

      ),



      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Login",
          // textAlign: TextAlign.center,
          // style: theme.textTheme.bodySmall ,

        ),

        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: formKey,
            child: Column(
                   // crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
            
                      SizedBox(
                        height: mediaQuery.size.height*0.25,
                      ),
                      Text("Welcome Back!",
                        textAlign:TextAlign.start ,
                        style: theme.textTheme.bodyLarge?.copyWith(
                            color:  Colors.black,
                        fontWeight: FontWeight.w800,
                        ),
            
            
                      ),
            TextFormField(
              controller: emailController,
              cursorColor: theme.primaryColor,
              cursorHeight: 25,
              style:  const TextStyle(
                fontFamily: "Poppins",
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
              // validator: (value) {
              //   if(value==null||value.trim().isEmpty)
              //     {
              //       return "please Enter your Email ";
              //     }
              //   var regex =RegExp(
              //       r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"
              //   );
              //   if (!regex.hasMatch(value)){
              //     return "invalid email";
              //   }
              //   return null;
              // },
            
            
            
              decoration: InputDecoration(
                hintText: "Enter Your Email Address",
                label: Text(
                    "Email",
                  style: theme.textTheme.displaySmall,
            
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: theme.primaryColor,
                    width: 2,
            
                  ),
                ),
                suffixIcon: Icon(Icons.email
                ),
                errorStyle: const TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                 // color: Colors.white,
                ),
              ),
            
                     ),
            TextFormField(
              controller: passController,
              cursorColor: theme.primaryColor,
              cursorHeight: 25,
              style:  const TextStyle(
                fontFamily: "Poppins",
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
              // validator: (value) {
              //   if(value==null||value.trim().isEmpty)
              //     {
              //       return "please Enter your Email ";
              //     }
              //   var regex =RegExp(
              //       r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"
              //   );
              //   if (!regex.hasMatch(value)){
              //     return "invalid email";
              //   }
              //   return null;
              // },
              obscureText: isObscurd,
              obscuringCharacter: "*",



              decoration: InputDecoration(
                hintText: "Enter  Password ",
                label: Text(
                    "Password",
                  style: theme.textTheme.displaySmall,

                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: theme.primaryColor,
                    width: 2,

                  ),
                ),
                suffixIcon: InkWell(
                  onTap: (){
                    setState(() {
                      isObscurd=!isObscurd;
                    });

                  },
                  child:  Icon(
                    isObscurd? Icons.visibility : Icons.visibility_off,
                  ),
                ),
                errorStyle: const TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                 // color: Colors.white,
                ),
              ),

                     ),
                      const SizedBox(
                        height: 20,
                      ),
            InkWell(
              child: Text(
                  "Forget Password !",
              textAlign:TextAlign.start ,
                style: theme.textTheme.bodyLarge?.copyWith(
                  color:  Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  decoration: TextDecoration.underline,
                ) //copywith
              ),
            ),
                      const SizedBox(
                        height: 50,
                      ),
                      FilledButton(
                          style: FilledButton.styleFrom(
                            backgroundColor: theme.primaryColor,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 25,
                              vertical: 12
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8
                              ),
                            ),
            
                          ),
                          onPressed: ()
                          {
                            Navigator.pushReplacementNamed(context, PageRoutesName.layout);
                           // print(emailController.text);
                           //  if (formKey.currentState!.validate()){
                           //    print("object");
                           //
                           //  }
                          }
                          , child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                            children: [
                              Text(
                                "Login",
                                                    style: theme.textTheme.displaySmall?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 16
                                                    ),
                              
                              
                              ),
                              const Icon(Icons.arrow_forward,
                              )
                            ],
                          )
            
                      ),
            const SizedBox(height: 20,),
                      InkWell(
                        onTap:
                            ()
                          {
                            Navigator.pushNamed(
                                context, PageRoutesName.registr
                            );//NAVIGATOR
                            },//ontap
                        child: Text(
                            "Or Create My Account",
                            textAlign:TextAlign.start ,
                            style: theme.textTheme.bodyLarge?.copyWith(
                              color:  Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              decoration: TextDecoration.underline,
                            ) //copywith
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      ),
          );



  }
}
