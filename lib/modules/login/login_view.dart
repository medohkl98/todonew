import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

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
          TextField(
            cursorColor: theme.primaryColor,
            cursorHeight: 25,
            style:  TextStyle(
              fontFamily: "Poppins",
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Colors.grey,
            ),


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
            ),

                   )

                  ],
                ),
        ),
      ),
          );



  }
}
