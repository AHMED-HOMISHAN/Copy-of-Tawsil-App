import 'package:flutter/material.dart';
import 'package:tawsil/components/components.dart';
import 'package:tawsil/components/consts.dart';
import 'package:tawsil/components/functions.dart';

class BasketScreen extends StatefulWidget {
  const BasketScreen({super.key});

  @override
  State<BasketScreen> createState() => _BasketScreenState();
}

class _BasketScreenState extends State<BasketScreen> {
  BalanceType balanceType = BalanceType.arrived;
  double total = 0.00;
  bool isCupon = false;
  bool isNote = false;
  TextEditingController cuponController = TextEditingController();
  TextEditingController noteController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    if (cartItems.isNotEmpty) {
      total = 0.00;
      for (var item in cartItems) {
        total += (double.parse(item['price'].toString().split("ريال")[0]) *
            item['qty']);
      }
    }

    return Scaffold(
        backgroundColor: ColorTheme.containerColor,
        appBar: AppBar(
          backgroundColor: ColorTheme.primaryColor,
          leading: InkWell(
            onTap: () {
              Navigator.of(context).pop(true);
            },
            child: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
          title: const Text(
            'تاكيد الطلب',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          actions: [
            if ((cartItems.isNotEmpty)) ...{
              IconButton(
                icon: const Icon(
                  Icons.delete_rounded,
                  color: Colors.white,
                ),
                onPressed: () {
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
                                      text: 'سوف يتم تفريغ السلة !',
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
                                              text: 'إغلاق', context: context)),
                                      const SizedBox(
                                        height: 20,
                                        child: VerticalDivider(
                                          width: 0.5,
                                          color: Colors.black12,
                                        ),
                                      ),
                                      InkWell(
                                          onTap: () {
                                            setState(() {
                                              cartItems = [];
                                              cart = [];
                                            });
                                            Navigator.of(context).pop();
                                          },
                                          child: defaultText(
                                              text: 'تأكيد',
                                              textColor: Colors.green,
                                              context: context))
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ));
                },
              )
            }
          ],
        ),
        body: (cartItems.isNotEmpty)
            ? SingleChildScrollView(
                child: SizedBox(
                  height: height(context: context, precent: 1),
                  width: width(context: context, precent: 1),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        color: Colors.transparent,
                        height: height(context: context, precent: 0.1),
                        width: width(context: context, precent: 1),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CircleAvatar(
                              backgroundColor: ColorTheme.primaryColor,
                              child: const Icon(
                                Icons.card_giftcard_rounded,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              width: width(context: context, precent: 0.6),
                              height: height(context: context, precent: 0.8),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  isCupon
                                      ? defaultForm(
                                          controller: cuponController,
                                          context: context,
                                          hint: 'كود الخصم',
                                          type: TextInputType.name)
                                      : defaultText(
                                          text: 'هل لديك قسيمة تخفيض؟',
                                          context: context,
                                          fontWeight: FontWeight.bold,
                                          textColor: Colors.black),
                                ],
                              ),
                            ),
                            InkWell(
                                onTap: () {
                                  if (!isCupon) {
                                    setState(() {
                                      isCupon = true;
                                    });
                                  }
                                },
                                child: SizedBox(
                                  width: width(context: context, precent: 0.2),
                                  child: defaultText(
                                      text: isCupon ? 'احتساب الخصم' : 'اضافة',
                                      context: context,
                                      fontSize: 15,
                                      textColor: ColorTheme.textButtonColor,
                                      fontWeight: FontWeight.w600),
                                )),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        color: Colors.white,
                        height: height(context: context, precent: 0.1),
                        width: width(context: context, precent: 1),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CircleAvatar(
                              backgroundColor: ColorTheme.primaryColor,
                              child: const Icon(
                                Icons.card_giftcard_rounded,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              width: width(context: context, precent: 0.6),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  defaultText(
                                      text: 'عنوان التوصيل:',
                                      context: context,
                                      fontWeight: FontWeight.bold,
                                      textColor: Colors.black),
                                  defaultText(
                                      text: 'شركة توصيل',
                                      context: context,
                                      fontWeight: FontWeight.normal,
                                      textColor: Colors.black),
                                ],
                              ),
                            ),
                            InkWell(
                                onTap: () {},
                                child: SizedBox(
                                  width: width(context: context, precent: 0.2),
                                  child: defaultText(
                                      text: 'تغيير',
                                      context: context,
                                      fontSize: 15,
                                      textColor: ColorTheme.textButtonColor,
                                      fontWeight: FontWeight.w600),
                                )),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        color: Colors.transparent,
                        height: height(context: context, precent: 0.1),
                        width: width(context: context, precent: 1),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CircleAvatar(
                              backgroundColor: ColorTheme.primaryColor,
                              child: const Icon(
                                Icons.calendar_today_outlined,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              width: width(context: context, precent: 0.6),
                              child: !isNote
                                  ? Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        defaultText(
                                            text: ' ملاحظات الطلب ',
                                            context: context,
                                            fontWeight: FontWeight.bold,
                                            textColor: Colors.black),
                                        defaultText(
                                            text: ' لا يوجد ملاحظة ',
                                            context: context,
                                            fontWeight: FontWeight.normal,
                                            textColor: Colors.black),
                                      ],
                                    )
                                  : defaultForm(
                                      controller: cuponController,
                                      context: context,
                                      hint: ' ملاحظة ',
                                      minLines: 2,
                                      maxLines: 5,
                                      type: TextInputType.name),
                            ),
                            InkWell(
                                onTap: () {
                                  if (!isNote) {
                                    setState(() {
                                      isNote = true;
                                    });
                                  }
                                },
                                child: SizedBox(
                                  width: width(context: context, precent: 0.2),
                                  child: defaultText(
                                      text: 'اضافة',
                                      context: context,
                                      fontSize: 15,
                                      textColor: ColorTheme.textButtonColor,
                                      fontWeight: FontWeight.w600),
                                )),
                          ],
                        ),
                      ),
                      Expanded(
                          child: Container(
                        width: width(context: context, precent: 1),
                        color: Colors.white,
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CircleAvatar(
                                  backgroundColor: ColorTheme.primaryColor,
                                  child: const Icon(
                                    Icons.attach_money_rounded,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  width: width(context: context, precent: 0.75),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      defaultText(
                                          text: 'الدفع  (الدفع عند الاستلام)',
                                          context: context,
                                          fontWeight: FontWeight.bold,
                                          textColor: Colors.black),
                                    ],
                                  ),
                                ),
                                const SizedBox(),
                              ],
                            ),
                            SizedBox(
                              width: width(context: context, precent: 1),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Radio(
                                          value: BalanceType.arrived,
                                          groupValue: balanceType,
                                          onChanged: (value) {
                                            setState(() {
                                              balanceType = value!;
                                            });
                                          }),
                                      defaultText(
                                        text: 'الدفع عند الاستلام',
                                        textColor: Colors.black,
                                        context: context,
                                        fontWeight: FontWeight.normal,
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Radio(
                                          value: BalanceType.pay,
                                          groupValue: balanceType,
                                          onChanged: (value) {
                                            setState(() {
                                              balanceType = value!;
                                            });
                                          }),
                                      defaultText(
                                        text: 'الدفع من رصيدي ( 0 ) ',
                                        textColor: Colors.black,
                                        context: context,
                                        fontWeight: FontWeight.normal,
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 10),
                              width: width(context: context, precent: 1),
                              child: defaultText(
                                  fontSize: 20,
                                  align: TextAlign.start,
                                  text: 'أنقر لعرض بقية وسائل الدفع ',
                                  context: context),
                            ),
                            const Divider(
                              color: Colors.black12,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                defaultText(
                                    text: 'الإجمالي',
                                    fontSize: 20,
                                    fontWeight: FontWeight.normal,
                                    context: context,
                                    textColor: Colors.black),
                                defaultText(
                                    text: '$total ريال',
                                    fontSize: 20,
                                    fontWeight: FontWeight.normal,
                                    context: context,
                                    textColor: Colors.black),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                defaultText(
                                    fontSize: 13,
                                    text: 'التوصيل',
                                    fontWeight: FontWeight.w800,
                                    context: context,
                                    textColor: Colors.black),
                                defaultText(
                                    text: '500 ريال',
                                    fontWeight: FontWeight.w800,
                                    context: context,
                                    textColor: Colors.black),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 3, horizontal: 10),
                              width: width(context: context, precent: 1),
                              height: 50,
                              decoration: BoxDecoration(
                                  color: ColorTheme.containerColor,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  defaultText(
                                      text: 'الإجمالي الكلي',
                                      fontWeight: FontWeight.normal,
                                      fontSize: 20,
                                      context: context,
                                      textColor: Colors.black),
                                  defaultText(
                                      text: '${(total + 500)} ريال',
                                      fontWeight: FontWeight.w800,
                                      context: context,
                                      fontSize: 20,
                                      textColor: Colors.black),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            DataTable(
                                headingRowHeight:
                                    height(context: context, precent: 0.04),
                                columnSpacing:
                                    width(context: context, precent: 0.17),
                                showBottomBorder: true,
                                dataRowColor: MaterialStatePropertyAll(
                                    ColorTheme.containerColor),
                                border: TableBorder.all(color: Colors.black26),
                                columns: const [
                                  DataColumn(label: Text('المنتج')),
                                  DataColumn(label: Text('السعر')),
                                  DataColumn(label: Text('الكمية')),
                                  DataColumn(label: Text('الإجمالي')),
                                ],
                                rows: [
                                  for (var item in cartItems) ...{
                                    DataRow(cells: [
                                      DataCell(Text(item['name'])),
                                      DataCell(Text(item['price'])),
                                      DataCell(Text(item['qty'].toString())),
                                      DataCell(Text((double.parse(item['price']
                                                  .toString()
                                                  .split("ريال")[0]) *
                                              item['qty'])
                                          .toStringAsFixed(2))),
                                    ])
                                  }
                                ])
                          ],
                        ),
                      ))
                    ],
                  ),
                ),
              )
            : SizedBox(
                width: width(context: context, precent: 1),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    defaultText(
                        text: 'لا يوجد منتجات في السلة',
                        fontSize: 18,
                        textColor: Colors.black38,
                        context: context),
                    const SizedBox(
                      height: 20,
                    ),
                    defaultButton(
                        width: width(context: context, precent: 0.3),
                        function: () {
                          Navigator.of(context).pop();
                        },
                        label: 'متابعة التسوق'),
                  ],
                ),
              ),
        bottomSheet: (cartItems.isNotEmpty)
            ? Container(
                color: ColorTheme.secondaryColor,
                height: height(context: context, precent: 0.06),
                width: width(context: context, precent: 1),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          child: defaultText(
                              text: ' تعديل السلة ',
                              context: context,
                              textColor: ColorTheme.primaryColor),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                      InkWell(
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          child: defaultText(
                              text: 'تنفيذ الطلب',
                              context: context,
                              textColor: Colors.white),
                          decoration: BoxDecoration(
                              color: ColorTheme.primaryColor,
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      )
                    ],
                  ),
                ),
              )
            : SizedBox.shrink());
  }
}
