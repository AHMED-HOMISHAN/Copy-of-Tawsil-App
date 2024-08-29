import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tawsil/components/components.dart';
import 'package:tawsil/components/consts.dart';

class MyOrdersScreen extends StatefulWidget {
  const MyOrdersScreen({super.key});

  @override
  State<MyOrdersScreen> createState() => _MyOrdersScreenState();
}

class _MyOrdersScreenState extends State<MyOrdersScreen> {
  int selectdcategoryIndex = 0;
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
          SizedBox(
            height: height(context: context, precent: 0.05),
            child: ListView.separated(
                padding: const EdgeInsets.all(5),
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        selectdcategoryIndex = index;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.only(left: 10),
                      decoration: BoxDecoration(
                          color: index == selectdcategoryIndex
                              ? ColorTheme.secondaryColor
                              : Colors.white,
                          borderRadius: BorderRadius.circular(50),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.white,
                                blurRadius: 2,
                                offset: Offset(0, 2))
                          ]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                border: Border.all(
                                    width: 1.2, color: ColorTheme.dangerColor)),
                            width: 30,
                            height: 50,
                            child: CircleAvatar(
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(50),
                                  child: SizedBox()),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          defaultText(
                              text: 'الكل',
                              fontWeight: FontWeight.normal,
                              context: context,
                              textColor: Colors.black)
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    width: 10,
                  );
                },
                itemCount: 1),
          ),
          Expanded(
            child: Center(
              child: defaultText(
                  text: 'لا يوجد طلبات',
                  context: context,
                  textColor: Colors.black54),
            ),
          )
        ],
      ),
    );
  }
}
