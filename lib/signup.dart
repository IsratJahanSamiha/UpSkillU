import 'package:flutter/material.dart';
import 'login.dart';


class SignUp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp>{
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white ,

      body: Container(
        child: SingleChildScrollView(
          //reverse: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start ,
            mainAxisAlignment: MainAxisAlignment.start ,
            children: [
              Container(
                width: w,
                margin: EdgeInsets.only(left:10,top: 30),
                child: Stack(
                  fit: StackFit.loose ,
                  children: [
                    Center(
                      child: Container(
                        margin: EdgeInsets.fromLTRB(0.00, 70.0,0.0, 0.0),
                        width: 30,
                        height: 40,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                  "assets/logo.PNG",
                                ),
                                fit: BoxFit.cover
                            )
                        ),
                      ),
                    ),


                    Container(
                      width: w,
                      margin: const EdgeInsets.only(left: 20,top: 150 ,right: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Welcome",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Color(0xFF008080)
                            ),
                          ),
                          Text(
                            "Create Account",
                            style: TextStyle(
                                fontSize: 15,
                                color: Color(0xFF008080)
                            ),
                          ),
                          SizedBox(height: 10,),
                          Container(
                            //margin: EdgeInsets.only(left: 10,top: 10,right: 10 ),
                            decoration: BoxDecoration(
                                color: Color(0xFF008080),
                                borderRadius: BorderRadius.circular(5),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0x14000000),
                                    offset: Offset(0,10),
                                    blurRadius: 15,
                                    spreadRadius: 7,

                                  )
                                ]
                            ) ,
                            height: 40 ,
                            width: w ,
                            child: Expanded(
                              flex : 10,
                              child: Container(
                                margin: EdgeInsets.only(left: 10 ,right: 10, top: 8),
                                child: TextField(
                                  maxLines: 1,
                                  autofocus: false ,
                                  style: TextStyle(
                                    color: Color(0xFF3F7F43),
                                    fontSize: 15,
                                  ) ,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Full Name"
                                  ),
                                ) ,
                              ),
                            ) ,
                          ),
                          SizedBox(height: 15,),
                          Container(
                            //margin: EdgeInsets.only(left: 10,top: 10,right: 10 ),
                            decoration: BoxDecoration(
                                color: Color(0xFF008080),
                                borderRadius: BorderRadius.circular(5),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0x14000000),
                                    offset: Offset(0,10),
                                    blurRadius: 15,
                                    spreadRadius: 7,

                                  )
                                ]
                            ) ,
                            height: 40 ,
                            width: w ,
                            child: Expanded(
                              flex : 10,
                              child: Container(
                                margin: EdgeInsets.only(left: 10 ,right: 10, top: 8),
                                child: TextField(
                                  // maxLines: 1,
                                  //autofocus: false ,
                                  style: TextStyle(
                                    color: Color(0xFF3F7F43),
                                    fontSize: 15,
                                  ) ,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "User Name"
                                  ),
                                ) ,
                              ),
                            ) ,
                          ),
                          SizedBox(height: 15,),
                          Container(
                            //margin: EdgeInsets.only(left: 10,top: 10,right: 10 ),
                            decoration: BoxDecoration(
                                color: Color(0xFF008080),
                                borderRadius: BorderRadius.circular(5),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0x14000000),
                                    offset: Offset(0,10),
                                    blurRadius: 15,
                                    spreadRadius: 7,

                                  )
                                ]
                            ) ,
                            height: 40 ,
                            width: w ,
                            child: Expanded(
                              flex : 10,
                              child: Container(
                                margin: EdgeInsets.only(left: 10 ,right: 10, top: 8),
                                child: TextField(
                                  // maxLines: 1,
                                  //autofocus: false ,
                                  style: TextStyle(
                                    color: Color(0xFF3F7F43),
                                    fontSize: 15,
                                  ) ,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Id/mail"
                                  ),
                                ) ,
                              ),
                            ) ,
                          ),
                          SizedBox(height: 15,),
                          Container(
                            //margin: EdgeInsets.only(left: 10,top: 10,right: 10 ),
                            decoration: BoxDecoration(
                                color: Color(0xFF008080),
                                borderRadius: BorderRadius.circular(5),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0x14000000),
                                    offset: Offset(0,10),
                                    blurRadius: 15,
                                    spreadRadius: 7,

                                  )
                                ]
                            ) ,
                            height: 40 ,
                            width: w ,
                            child: Expanded(
                              flex : 10,
                              child: Container(
                                margin: EdgeInsets.only(left: 10 ,right: 10, top: 8),
                                child: TextField(
                                  // maxLines: 1,
                                  //autofocus: false ,
                                  style: TextStyle(
                                    color: Color(0xFF3F7F43),
                                    fontSize: 15,
                                  ) ,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Contact Number"
                                  ),
                                ) ,
                              ),
                            ) ,
                          ),
                          SizedBox(height: 15,),
                          Container(
                            //margin: EdgeInsets.only(left: 10,top: 10,right: 10 ),
                            decoration: BoxDecoration(
                                color: Color(0xFF008080),
                                borderRadius: BorderRadius.circular(5),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0x14000000),
                                    offset: Offset(0,10),
                                    blurRadius: 15,
                                    spreadRadius: 7,

                                  )
                                ]
                            ) ,
                            height: 40 ,
                            width: w ,
                            child: Expanded(
                              flex : 10,
                              child: Container(
                                margin: EdgeInsets.only(left: 10 ,right: 10, top: 8),
                                child: TextField(
                                  // maxLines: 1,
                                  //autofocus: false ,
                                  style: TextStyle(
                                    color: Color(0xFF3F7F43),
                                    fontSize: 15,
                                  ) ,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Age"
                                  ),
                                ) ,
                              ),
                            ) ,
                          ),
                          SizedBox(height: 15,),
                          Container(
                            //margin: EdgeInsets.only(left: 10,right: 10 ),
                            decoration: BoxDecoration(
                                color: Color(0xFF008080),
                                borderRadius: BorderRadius.circular(5),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0x14000000),
                                    offset: Offset(0,10),
                                    blurRadius: 15,
                                    spreadRadius: 7,

                                  )
                                ]
                            ) ,
                            height: 40 ,
                            width: w ,
                            child: Expanded(
                              flex : 10,
                              child: Container(
                                margin: EdgeInsets.only(left: 10 ,right: 10, top: 8),
                                child: TextField(
                                  // maxLines: 1,
                                  //autofocus: false ,
                                  style: TextStyle(
                                    color: Color(0xFF3F7F43),
                                    fontSize: 15,
                                  ) ,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Password"
                                  ),
                                ) ,
                              ),
                            ) ,
                          ),
                          SizedBox(height: 15,),
                          Container(
                            //margin: EdgeInsets.only(left: 10,right: 10 ),
                            decoration: BoxDecoration(
                                color: Color(0xFF008080),
                                borderRadius: BorderRadius.circular(5),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0x14000000),
                                    offset: Offset(0,10),
                                    blurRadius: 15,
                                    spreadRadius: 7,

                                  )
                                ]
                            ) ,
                            height: 40 ,
                            width: w ,
                            child: Expanded(
                              flex : 10,
                              child: Container(
                                margin: EdgeInsets.only(left: 10 ,right: 10, top: 8),
                                child: TextField(
                                  // maxLines: 1,
                                  //autofocus: false ,
                                  style: TextStyle(
                                    color: Color(0xFF3F7F43),
                                    fontSize: 15,
                                  ) ,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Confirm Password"
                                  ),
                                ) ,
                              ),
                            ) ,
                          ),
                          SizedBox(height: 25,),
                        ],
                      ),
                    ),
                    //singup image
                    Center(
                      child: Container(
                        margin: const EdgeInsets.only(top: 630 ),
                        child: GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => LogIn()));
                          },
                          child: Container(
                            // margin: EdgeInsets.fromLTRB(0.00, 100.0,0.0, 0.0),
                            width: w*.2,
                            height: h*.035,
                            child: Text(
                              "SignUp",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.blue
                              ),
                             ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }

}