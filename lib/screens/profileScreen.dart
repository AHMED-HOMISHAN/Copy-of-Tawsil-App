import 'package:flutter/material.dart';
import 'package:tawsil/components/components.dart';
import 'package:tawsil/components/consts.dart';
import 'package:tawsil/screens/myAdressesScreen.dart';
import 'package:tawsil/screens/myOrderScreen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorTheme.scaffoldColor,
      appBar: AppBar(
        backgroundColor: ColorTheme.primaryColor,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.white,
            )),
        title: defaultText(
            text: 'إدارة الحساب',
            fontSize: 24,
            textColor: Colors.white,
            context: context),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            width: width(context: context, precent: 1),
            height: height(context: context, precent: 0.05),
            decoration:
                BoxDecoration(color: ColorTheme.primaryColor.withOpacity(0.3)),
            child: Center(
                child: defaultText(
                    text: 'المنطقة الحالية: صنعاء',
                    fontWeight: FontWeight.w100,
                    textColor: Colors.black,
                    context: context)),
          ),
          Expanded(
            child: GridView.count(
              padding: const EdgeInsets.all(10),
              crossAxisCount: 3,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              childAspectRatio: 10 / 13,
              children: [
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: height(context: context, precent: 1),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(),
                        Icon(
                          Icons.person_rounded,
                          color: ColorTheme.primaryColor,
                          size: 60,
                        ),
                        Container(
                          width: width(context: context, precent: 1),
                          height: height(context: context, precent: 0.05),
                          decoration: BoxDecoration(
                              color: ColorTheme.secondaryColor,
                              borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10))),
                          child: Center(
                            child: defaultText(
                                text: 'الحساب ',
                                textColor: Colors.black87,
                                context: context),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: height(context: context, precent: 1),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(),
                        Icon(
                          Icons.attach_money_rounded,
                          color: ColorTheme.primaryColor,
                          size: 60,
                        ),
                        Container(
                          width: width(context: context, precent: 1),
                          height: height(context: context, precent: 0.05),
                          decoration: BoxDecoration(
                              color: ColorTheme.secondaryColor,
                              borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10))),
                          child: Center(
                            child: defaultText(
                                text: 'رصيدي ',
                                textColor: Colors.black87,
                                context: context),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    navigateTo(context: context, screen: MyOrdersScreen());
                  },
                  child: Container(
                    height: height(context: context, precent: 1),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(),
                        Icon(
                          Icons.menu,
                          color: ColorTheme.primaryColor,
                          size: 60,
                        ),
                        Container(
                          width: width(context: context, precent: 1),
                          height: height(context: context, precent: 0.05),
                          decoration: BoxDecoration(
                              color: ColorTheme.secondaryColor,
                              borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10))),
                          child: Center(
                            child: defaultText(
                                text: ' طلباتي ',
                                textColor: Colors.black87,
                                context: context),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    navigateTo(
                        context: context, screen: const MyAdressesScreen());
                  },
                  child: Container(
                    height: height(context: context, precent: 1),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(),
                        Icon(
                          Icons.location_on_outlined,
                          color: ColorTheme.primaryColor,
                          size: 60,
                        ),
                        Container(
                          width: width(context: context, precent: 1),
                          height: height(context: context, precent: 0.05),
                          decoration: BoxDecoration(
                              color: ColorTheme.secondaryColor,
                              borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10))),
                          child: Center(
                            child: defaultText(
                                text: 'العناوين ',
                                textColor: Colors.black87,
                                context: context),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: height(context: context, precent: 1),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(),
                        Icon(
                          Icons.location_city,
                          color: ColorTheme.primaryColor,
                          size: 60,
                        ),
                        Container(
                          width: width(context: context, precent: 1),
                          height: height(context: context, precent: 0.05),
                          decoration: BoxDecoration(
                              color: ColorTheme.secondaryColor,
                              borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10))),
                          child: Center(
                            child: defaultText(
                                text: 'تغيير المدينة ',
                                textColor: Colors.black87,
                                context: context),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: height(context: context, precent: 1),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(),
                        Icon(
                          Icons.contact_support_outlined,
                          color: ColorTheme.primaryColor,
                          size: 60,
                        ),
                        Container(
                          width: width(context: context, precent: 1),
                          height: height(context: context, precent: 0.05),
                          decoration: BoxDecoration(
                              color: ColorTheme.secondaryColor,
                              borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10))),
                          child: Center(
                            child: defaultText(
                                text: 'تواصل معنا ',
                                textColor: Colors.black87,
                                context: context),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) => Dialog(
                              elevation: 0.0,
                              backgroundColor: Colors.white,
                              child: Container(
                                padding: EdgeInsets.all(8),
                                height: height(context: context, precent: 0.23),
                                width: width(context: context, precent: 0.05),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.tag_faces_sharp,
                                      color: ColorTheme.primaryColor,
                                      size: 80,
                                    ),
                                    defaultText(
                                        text: 'هل أنت متاكد من تسجيل الخروج؟',
                                        textColor: Colors.black,
                                        context: context),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        InkWell(
                                            onTap: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: defaultText(
                                                text: 'لا', context: context)),
                                        const SizedBox(
                                          height: 20,
                                          child: VerticalDivider(
                                            width: 0.5,
                                            color: Colors.black12,
                                          ),
                                        ),
                                        InkWell(
                                            onTap: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: defaultText(
                                                text: 'نعم',
                                                textColor: Colors.green,
                                                context: context))
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ));
                  },
                  child: Container(
                    height: height(context: context, precent: 1),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(),
                        Icon(
                          Icons.logout,
                          color: ColorTheme.primaryColor,
                          size: 60,
                        ),
                        Container(
                          width: width(context: context, precent: 1),
                          height: height(context: context, precent: 0.05),
                          decoration: BoxDecoration(
                              color: ColorTheme.secondaryColor,
                              borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10))),
                          child: Center(
                            child: defaultText(
                                text: 'تسجيل الخروج',
                                textColor: Colors.black87,
                                context: context),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
