import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iti_project/shared/cubit/profile_cubit/profile_cubit.dart';
import 'package:iti_project/shared/cubit/profile_cubit/profile_state.dart';
import 'package:sizer/sizer.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ProfileCubit()..getUserData(),
      child: BlocConsumer<ProfileCubit, ProfileStates>(
        listener: (context, state) {},
        builder: (context, state) {
          ProfileCubit cubit = ProfileCubit.get(context);
          return SafeArea(
            child: Scaffold(
              body: state is ProfileLoadingState
              ? Center(child: CircularProgressIndicator())
                  : Column(
                children: [
                  Container(
                    height: 28.h,
                    child: Stack(
                      alignment: AlignmentDirectional.bottomCenter,
                      children: [
                        Align(
                          alignment: AlignmentDirectional.topCenter,
                          child: Container(
                            width: double.infinity,
                            height: 23.h,
                            decoration: const BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(100),
                                    bottomRight: Radius.circular(100))),
                          ),
                        ),
                        CircleAvatar(
                          radius: 50.sp,
                          backgroundColor: Colors.white,
                          child: CircleAvatar(
                            radius: 45.sp,
                            backgroundImage: AssetImage('assets/profile.png'),
                          ),
                        ),
                      ],
                    ),
                  ),
                   SizedBox(
                    height: 3.h,
                  ),
                  Text(
                    '${cubit.name}',
                    style: GoogleFonts.lato(
                        fontWeight: FontWeight.bold,
                        fontSize: 15.sp,
                        color: Colors.black),
                  ),
                   SizedBox(
                    height: 10.h,
                  ),

                  Container(
                    padding: EdgeInsets.only(right: 2.w, left: 4.w),
                    height: 8.h,
                    width: 85.w,
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10)),
                    child: Expanded(
                      child: Row(
                        children: [
                          Icon(
                            Icons.email,
                            color: Colors.black,
                          ),
                          SizedBox(
                            width: 3.w,
                          ),
                          Text(
                            '${cubit.email}',
                            style: GoogleFonts.lato(
                                fontSize: 15.sp, color: Colors.black),
                          )
                        ],
                      ),
                    ),
                  ),
                   SizedBox(
                    height: 2.h,
                  ),
                  Container(
                    padding: EdgeInsets.only(right: 2.w, left: 4.w),
                    height: 8.h,
                    width: 85.w,
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      children: [
                        Icon(
                          Icons.map,
                          color: Colors.black,
                        ),
                        SizedBox(
                          width: 3.w,
                        ),
                        Text(
                          'Egypt',
                          style: GoogleFonts.lato(
                              fontSize: 15.sp, color: Colors.black),
                        )
                      ],
                    ),
                  ),
                   SizedBox(
                     height: 2.h,
                  ),
                  Container(
                    padding: EdgeInsets.only(right: 2.w, left: 4.w),
                    height: 8.h,
                    width: 85.w,
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      children: [
                        Icon(
                          Icons.phone,
                          color: Colors.black,
                        ),
                        SizedBox(
                          width: 3.w,
                        ),
                        Text(
                          '${cubit.phone}',
                          style: GoogleFonts.lato(
                              fontSize: 15.sp, color: Colors.black),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
