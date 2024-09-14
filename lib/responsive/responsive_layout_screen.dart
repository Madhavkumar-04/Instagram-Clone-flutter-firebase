import "package:flutter/material.dart";
import "package:instagram_flutter/utils/global_variables.dart";
import "package:provider/provider.dart";

import "../providers/user_provider.dart";

class ResponsiveLayout extends StatefulWidget {
  final Widget mobileScreenLayout;
  final Widget webScreenLayout;
  const ResponsiveLayout({super.key, required this.mobileScreenLayout, required this.webScreenLayout });

  @override
  State<ResponsiveLayout> createState() => _ResponsiveLayoutState();
}

class _ResponsiveLayoutState extends State<ResponsiveLayout> {

  @override
  void initState(){
    super.initState();
    addData();
  }

  addData()async{
    UserProvider _userProvider = Provider.of(context, listen:false);
    await _userProvider.refreshUser();
  }
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context, constraints) {
          if(constraints.maxWidth > webScreenSize){
          //   web Screen layout
            return widget.webScreenLayout;
          }
        //   mobile screen layout
          return widget.mobileScreenLayout;
        }
    );
  }
}
