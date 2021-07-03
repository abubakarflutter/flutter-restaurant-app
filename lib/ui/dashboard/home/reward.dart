import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterrestaurant/ui/common/dialog/share_app_dialog.dart';

class RewardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(builder: () => StartingRewardScreen());
  }
}


class StartingRewardScreen extends StatelessWidget {
  const StartingRewardScreen({ Key key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
              
            title: Text('Get Reward', style: TextStyle(color: Colors.black87),),
            centerTitle: true,
            leading: IconButton(onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new, color: Colors.black87,),
          ),),
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  Text('R E W A R D S',
                      style: TextStyle(
                          fontFamily: 'ProductSans',
                          fontSize: 25.sp,
                          fontWeight: FontWeight.w900)),
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
                      height: 135.w,
                      width: 350.h,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.amber, width: 2.w),
                          borderRadius: BorderRadius.circular(20.r)),
                      child: RewardsBuilder()),
              
                  SvgPicture.asset(
                    "assets/images/winning.svg",
                    width: 200.w,
                    height: 200.h,
                  ),
                  Text('Refer your friends and earn',
                      style: TextStyle(
                          fontFamily: 'ProductSans',
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w700)),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 10.h,
                      left: 16.w,
                      right: 16.w,
                    ),
                    child: Text(
                        'Invite your friends and you both will get 100 reward points on successful sign up.',
                        style: TextStyle(
                          fontFamily: 'ProductSans',
                          fontSize: 13.sp,
                          // fontWeight: FontWeight.w700
                        )),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  SizedBox(
                    child: TextButton(
                        onPressed: () {
                          
                      showDialog<dynamic>(
                          context: context,
                          builder: (BuildContext context) {
                            return ShareAppDialog(
                              onPressed: () {
                                Navigator.pop(context, true);
                              },
                            );
                          });

                        },
                        style: ButtonStyle(
                            elevation: MaterialStateProperty.all(5.0),
                            backgroundColor: MaterialStateProperty.all(Color(0xFFFFBC00)),
                            foregroundColor:
                                MaterialStateProperty.all(Colors.white),
                            padding: MaterialStateProperty.all(
                                EdgeInsets.symmetric(vertical: 14, horizontal: 40)),
                            textStyle: MaterialStateProperty.all(TextStyle(
                                fontSize: 14.sp, fontWeight: FontWeight.w700))),
                        child: Text('Send Invite')),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class RewardsBuilder extends StatefulWidget {
  const RewardsBuilder({Key key}) : super(key: key);

  @override
  _RewardsBuilderState createState() => _RewardsBuilderState();
}

class _RewardsBuilderState extends State<RewardsBuilder> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20.h, left: 20.w, right: 20.w, bottom: 10.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('You have',
                  style: TextStyle(
                    fontFamily: 'ProductSans',
                    fontSize: 15.sp,
                    // fontWeight: FontWeight.w700
                  )),
                  SizedBox(
                    height: 5.h,
                  ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text('560',
                      style: TextStyle(
                          fontFamily: 'ProductSans',
                          fontSize: 25.sp,
                          fontWeight: FontWeight.w700
                          // fontWeight: FontWeight.w700
                          )),
                  SizedBox(
                    width: 5.w,
                  ),
                  Text('Reward Coins',
                      style: TextStyle(
                        fontFamily: 'ProductSans',
                        fontSize: 10.sp,
                        // fontWeight: FontWeight.w700
                      )),
                ],
              ),
                                SizedBox(
                    height: 5.h,
                  ),
                            Text('*Get 25 reward coins on each order',
                  style: TextStyle(
                    fontFamily: 'ProductSans',
                    fontSize: 8.sp,
                    // fontWeight: FontWeight.w700
                  )),
              Text('*Get 1 order free on hitting 1000 reward coins',
                  style: TextStyle(
                    fontFamily: 'ProductSans',
                    fontSize: 8.sp,
                    // fontWeight: FontWeight.w700
                  )),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                "assets/images/giftbox.svg",
                width:80.w,
                height: 80.h,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
