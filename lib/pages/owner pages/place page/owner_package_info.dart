import 'package:flutter/material.dart';
import 'package:monasba/pages/user%20pages/place%20pages/package_info_page.dart';


class OwnerPackageInfoPage extends StatelessWidget {
  const OwnerPackageInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: PackageInfoPage(isFilter: true),
    );
  }
}