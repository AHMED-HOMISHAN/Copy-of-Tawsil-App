import 'package:flutter/material.dart';
import 'package:tawsil/components/components.dart';
import 'package:tawsil/components/consts.dart';

class MyAdressesScreen extends StatefulWidget {
  const MyAdressesScreen({super.key});

  @override
  State<MyAdressesScreen> createState() => _MyAdressesScreenState();
}

class _MyAdressesScreenState extends State<MyAdressesScreen> {
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
            text: ' العناوين ',
            fontSize: 24,
            textColor: Colors.white,
            context: context),
        centerTitle: true,
      ),
      body: SizedBox(
        height: height(context: context, precent: 1),
        child: ListView.separated(
            itemBuilder: (context, index) => Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  height: height(context: context, precent: 0.1),
                  width: width(context: context, precent: 1),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: ColorTheme.primaryColor,
                            child: const Icon(
                              Icons.location_on,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          defaultText(
                              text: 'العنوان $index',
                              context: context,
                              textColor: Colors.black),
                        ],
                      ),
                      Row(
                        children: [
                          const Spacer(),
                          defaultText(
                              text: 'تعديل ',
                              context: context,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              textColor: Colors.blueAccent.withOpacity(0.6)),
                          const SizedBox(
                            width: 20,
                          ),
                          defaultText(
                              text: 'حذف',
                              context: context,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              textColor: ColorTheme.primaryColor),
                          const SizedBox(
                            width: 20,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
            separatorBuilder: (context, index) => const SizedBox(
                  height: 20,
                ),
            itemCount: 2),
      ),
      bottomSheet: Container(
        padding: EdgeInsets.all(5),
        width: width(context: context, precent: 1),
        height: height(context: context, precent: 0.05),
        color: ColorTheme.secondaryColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            defaultText(
                text: 'عنوان جديد؟',
                context: context,
                textColor: Colors.black87),
            defaultButton(
                width: width(context: context, precent: 0.2),
                function: () {},
                label: 'اضافة')
          ],
        ),
      ),
    );
  }
}
