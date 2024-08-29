// import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
// import 'package:dctorappoitmentye/components/components.dart';
// import 'package:dctorappoitmentye/components/consts.dart';
// import 'package:dctorappoitmentye/cubit/cubit.dart';
// import 'package:dctorappoitmentye/screens/auth/login.dart';
// import 'package:dctorappoitmentye/states/states.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:animate_do/animate_do.dart';
// import 'package:iconly/iconly.dart';
// import 'package:url_launcher/url_launcher.dart';

// class RegisterScreen extends StatefulWidget {
//   const RegisterScreen({super.key});

//   @override
//   State<RegisterScreen> createState() => _RegisterScreenState();
// }

// class _RegisterScreenState extends State<RegisterScreen> {
//   var phoneController = TextEditingController();
//   var nameController = TextEditingController();
//   var passwordController = TextEditingController();
//   var confirmPasswordController = TextEditingController();
//   var formKey = GlobalKey<FormState>();
//   bool isChecked = false;
//   @override
//   void initState() {
//     super.initState();
//     phoneController.addListener(_restrictInput);
//     nameController.addListener(_restrictInput);
//   }

//   void _restrictInput() {
//     String value = phoneController.text;
//     String name = nameController.text;

//     if (value.isNotEmpty) {
//       if (value.length > 1) {
//         if (!RegExp(r'^[7]([13780])').hasMatch(value)) {
//           phoneController.text = value.substring(0, value.length - 1);
//           phoneController.selection = TextSelection.fromPosition(
//             TextPosition(offset: phoneController.text.length),
//           );
//         }
//       } else if (!RegExp(r'^[7]').hasMatch(value)) {
//         phoneController.text = value.substring(0, value.length - 1);
//         phoneController.selection = TextSelection.fromPosition(
//           TextPosition(offset: phoneController.text.length),
//         );
//       }
//     }
//     if (name.isNotEmpty) {
//       if (!RegExp(r'^[\u0600-\u06FF\s]*$').hasMatch(name)) {
//         // Remove the last character if it's not a character
//         if (name.length > 1) {
//           nameController.text = name.substring(0, name.length - 1);
//           nameController.selection = TextSelection.fromPosition(
//             TextPosition(offset: nameController.text.length),
//           );
//         } else {
//           // If the length is 1, clear the text
//           nameController.clear();
//         }
//       }
//     }
//   }

//   @override
//   void dispose() {
//     phoneController.dispose();
//     nameController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => AppCubit(),
//       child: BlocConsumer<AppCubit, AppStates>(
//         builder: (context, state) {
//           AppCubit cubit = AppCubit.get(context);

//           return Scaffold(
//               backgroundColor: Colors.white,
//               body: SingleChildScrollView(
//                 child: Form(
//                   key: formKey,
//                   child: Column(
//                     children: <Widget>[
//                       Container(
//                         height: 400,
//                         decoration: const BoxDecoration(
//                             image: DecorationImage(
//                                 image:
//                                     AssetImage('assets/icons/background.png'),
//                                 fit: BoxFit.fill)),
//                         child: Stack(
//                           children: <Widget>[
//                             Positioned(
//                               left: 30,
//                               width: 80,
//                               height: 200,
//                               child: FadeInUp(
//                                   duration: const Duration(seconds: 1),
//                                   child: Container(
//                                     decoration: const BoxDecoration(
//                                         image: DecorationImage(
//                                             image: AssetImage(
//                                                 'assets/icons/light-1.png'))),
//                                   )),
//                             ),
//                             Positioned(
//                               left: 140,
//                               width: 80,
//                               height: 150,
//                               child: FadeInUp(
//                                   duration: const Duration(milliseconds: 1200),
//                                   child: Container(
//                                     decoration: const BoxDecoration(
//                                         image: DecorationImage(
//                                             image: AssetImage(
//                                                 'assets/icons/light-2.png'))),
//                                   )),
//                             ),
//                             Positioned(
//                               right: 40,
//                               top: 40,
//                               width: 80,
//                               height: 150,
//                               child: FadeInUp(
//                                   duration: const Duration(milliseconds: 1300),
//                                   child: Container(
//                                     decoration: const BoxDecoration(
//                                         image: DecorationImage(
//                                             image: AssetImage(
//                                                 'assets/icons/clock.png'))),
//                                   )),
//                             ),
//                             Positioned(
//                               child: FadeInUp(
//                                   duration: const Duration(milliseconds: 1600),
//                                   child: Container(
//                                     margin: const EdgeInsets.only(top: 50),
//                                     child: const Center(
//                                       child: Text(
//                                         "انشاء حساب جديد",
//                                         style: TextStyle(
//                                             color: Colors.white,
//                                             fontSize: 30,
//                                             fontWeight: FontWeight.w800),
//                                       ),
//                                     ),
//                                   )),
//                             )
//                           ],
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(30.0),
//                         child: Column(
//                           children: <Widget>[
//                             FadeInUp(
//                                 duration: const Duration(milliseconds: 1800),
//                                 child: Column(
//                                   children: <Widget>[
//                                     SizedBox(
//                                       height: 75,
//                                       child: defaultForm(
//                                           controller: nameController,
//                                           context: context,
//                                           validate: true,
//                                           isWordRestricted: true,
//                                           validationMessage:
//                                               'يجب  ادخال اسم المستخدم',
//                                           type: TextInputType.name,
//                                           prefixIcon: IconlyBroken.profile,
//                                           label: ' الاسم كامل '),
//                                     ),
//                                     const SizedBox(
//                                       height: 20,
//                                     ),
//                                     SizedBox(
//                                       height: 75,
//                                       child: TextFormField(
//                                         controller: phoneController,
//                                         keyboardType: TextInputType.number,
//                                         maxLength: 9,
//                                         validator: (value) {
//                                           if (value!.isEmpty) {
//                                             return "يجب ادخال رقم الهاتف";
//                                           }
//                                           if (value.length < 9 ||
//                                               value.length > 10) {
//                                             return 'الرقم غير صحيح';
//                                           }
//                                           return null;
//                                         },
//                                         decoration: InputDecoration(
//                                           contentPadding:
//                                               const EdgeInsets.symmetric(
//                                                   horizontal: 15, vertical: 7),
//                                           labelStyle:
//                                               const TextStyle(fontSize: 13),
//                                           hintStyle: TextStyle(
//                                               color: Colors.grey[700],
//                                               fontSize: 13),
//                                           label: const Text('رقم الهاتف'),
//                                           border: OutlineInputBorder(
//                                               borderRadius:
//                                                   BorderRadius.circular(10),
//                                               borderSide: const BorderSide(
//                                                 style: BorderStyle.solid,
//                                                 color: Color.fromRGBO(
//                                                     143, 148, 251, 1),
//                                               )),
//                                           hintText: "7xxxxxxxx",
//                                           prefixIcon: Icon(
//                                             IconlyBroken.call,
//                                             color: primaryColor,
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                     const SizedBox(
//                                       height: 20,
//                                     ),
//                                     SizedBox(
//                                       height: 75,
//                                       child: TextFormField(
//                                         controller: passwordController,
//                                         obscureText: cubit.isPassword,
//                                         validator: (value) {
//                                           if (value!.isEmpty) {
//                                             return "يجب ادخال كلمة السر ";
//                                           }
//                                           if (value.length < 9) {
//                                             return 'كلمة السر قصيرة جدا';
//                                           }
//                                           if (value.length < 9 ||
//                                               value == "123456789") {
//                                             return 'كلمة السر ضعيفة جدا';
//                                           }
//                                           return null;
//                                         },
//                                         decoration: InputDecoration(
//                                           contentPadding:
//                                               const EdgeInsets.symmetric(
//                                                   horizontal: 15, vertical: 7),
//                                           labelStyle:
//                                               const TextStyle(fontSize: 13),
//                                           hintStyle: TextStyle(
//                                               color: Colors.grey[700],
//                                               fontSize: 13),
//                                           label: const Text("كلمة السر"),
//                                           border: OutlineInputBorder(
//                                               borderRadius:
//                                                   BorderRadius.circular(10),
//                                               borderSide: const BorderSide(
//                                                 style: BorderStyle.solid,
//                                                 color: Color.fromRGBO(
//                                                     143, 148, 251, 1),
//                                               )),
//                                           hintText: "كلمة السر",
//                                           prefixIcon: Icon(
//                                             IconlyBroken.lock,
//                                             color: primaryColor,
//                                           ),
//                                           suffix: Padding(
//                                             padding: const EdgeInsets.symmetric(
//                                                 horizontal: 10, vertical: 10),
//                                             child: InkWell(
//                                               onTap: () {
//                                                 cubit.showOrhideSuffixIcon();
//                                               },
//                                               child: Icon(
//                                                 cubit.suffixIcon,
//                                                 size: 20,
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                     const SizedBox(
//                                       height: 20,
//                                     ),
//                                     SizedBox(
//                                       height: 75,
//                                       child: TextFormField(
//                                         controller: confirmPasswordController,
//                                         obscureText: cubit.isPassword,
//                                         validator: (value) {
//                                           if (value!.isEmpty) {
//                                             return "يجب ادخال كلمة السر ";
//                                           }
//                                           if (value.length < 9) {
//                                             return 'كلمة السر قصيرة جدا';
//                                           }
//                                           if (value.length < 9 ||
//                                               value == "123456789") {
//                                             return 'كلمة السر ضعيفة جدا';
//                                           }
//                                           return null;
//                                         },
//                                         decoration: InputDecoration(
//                                           contentPadding:
//                                               const EdgeInsets.symmetric(
//                                                   horizontal: 15, vertical: 7),
//                                           labelStyle:
//                                               const TextStyle(fontSize: 13),
//                                           hintStyle: TextStyle(
//                                               color: Colors.grey[700],
//                                               fontSize: 13),
//                                           label: const Text("تاكيد كلمة السر"),
//                                           border: OutlineInputBorder(
//                                               borderRadius:
//                                                   BorderRadius.circular(10),
//                                               borderSide: const BorderSide(
//                                                 style: BorderStyle.solid,
//                                                 color: Color.fromRGBO(
//                                                     143, 148, 251, 1),
//                                               )),
//                                           hintText: "تاكيد كلمة السر",
//                                           prefixIcon: Icon(
//                                             IconlyBroken.lock,
//                                             color: primaryColor,
//                                           ),
//                                           suffix: Padding(
//                                             padding: const EdgeInsets.symmetric(
//                                                 horizontal: 10, vertical: 10),
//                                             child: InkWell(
//                                               onTap: () {
//                                                 cubit.showOrhideSuffixIcon();
//                                               },
//                                               child: Icon(
//                                                 cubit.suffixIcon,
//                                                 size: 20,
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 )),
//                             const SizedBox(
//                               height: 20,
//                             ),
//                             FadeInUp(
//                               duration: const Duration(milliseconds: 1900),
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   Checkbox(
//                                       onChanged: (value) {
//                                         setState(() {
//                                           isChecked = value ?? false;
//                                         });
//                                       },
//                                       value: isChecked,
//                                       side: BorderSide(
//                                           color: isChecked
//                                               ? primaryColor
//                                               : Colors.red)),
//                                   const Text(
//                                     'بانشاء حساب فإنك توافق على ',
//                                     style: TextStyle(
//                                       fontSize: 13,
//                                     ),
//                                   ),
//                                   InkWell(
//                                     onTap: () async {
//                                       if (!await launchUrl(Uri.parse(
//                                           'https://sites.google.com/view/doctor-appoitement-ye/%D8%A7%D9%84%D8%B5%D9%81%D8%AD%D8%A9-%D8%A7%D9%84%D8%B1%D8%A6%D9%8A%D8%B3%D9%8A%D8%A9'))) {
//                                         throw Exception('Could not launch url');
//                                       }
//                                     },
//                                     child: Text(
//                                       'الشروط والاحكام',
//                                       style: TextStyle(
//                                           color: primaryColor,
//                                           fontSize: 13,
//                                           fontWeight: FontWeight.w700),
//                                     ),
//                                   )
//                                 ],
//                               ),
//                             ),
//                             FadeInUp(
//                                 duration: const Duration(milliseconds: 1900),
//                                 child: InkWell(
//                                     onTap: () {
//                                       if (formKey.currentState!.validate()) {
//                                         if (isChecked) {
//                                           if (confirmPasswordController.text ==
//                                               passwordController.text) {
//                                             cubit.addAdmin(
//                                                 name: nameController.text,
//                                                 phoneNumber:
//                                                     phoneController.text,
//                                                 pass: passwordController.text,
//                                                 isSuper: false,
//                                                 context: context);
//                                           } else {
//                                             Messanger(
//                                                 context: context,
//                                                 message:
//                                                     'كلمة السر غير متطابقة',
//                                                 status: false);
//                                           }
//                                         }
//                                       }
//                                     },
//                                     child: ConditionalBuilder(
//                                       condition:
//                                           state is! AppAddAdminLoadingState,
//                                       builder: (context) => Container(
//                                         height: 50,
//                                         decoration: BoxDecoration(
//                                             borderRadius:
//                                                 BorderRadius.circular(10),
//                                             gradient: isChecked
//                                                 ? const LinearGradient(colors: [
//                                                     Color.fromRGBO(
//                                                         136, 141, 250, 1),
//                                                     Color.fromRGBO(
//                                                         143, 148, 251, 0.772),
//                                                   ])
//                                                 : const LinearGradient(colors: [
//                                                     Colors.grey,
//                                                     Colors.grey,
//                                                   ])),
//                                         child: const Center(
//                                           child: Text(
//                                             " انشاء حساب",
//                                             style: TextStyle(
//                                                 color: Colors.white,
//                                                 fontWeight: FontWeight.bold),
//                                           ),
//                                         ),
//                                       ),
//                                       fallback: (context) => CircleLoading(
//                                           backgroundColor: primaryColor),
//                                     ))),
//                             const SizedBox(
//                               height: 70,
//                             ),
//                             FadeInUp(
//                                 duration: const Duration(milliseconds: 2000),
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     const Text(
//                                       " لديك حساب  ",
//                                       style: TextStyle(color: Colors.black),
//                                     ),
//                                     const SizedBox(
//                                       width: 5,
//                                     ),
//                                     InkWell(
//                                       onTap: () {
//                                         navigateReplacementTo(
//                                             context: context,
//                                             screen: const LoginScreen());
//                                       },
//                                       child: const Text(
//                                         "  تسجيل دخول ",
//                                         style: TextStyle(
//                                             fontWeight: FontWeight.w700,
//                                             color: Color.fromRGBO(
//                                                 143, 148, 251, 1)),
//                                       ),
//                                     ),
//                                   ],
//                                 )),
//                           ],
//                         ),
//                       ),
//                       verticalSpacing,
//                     ],
//                   ),
//                 ),
//               ));
//         },
//         listener: (context, state) {},
//       ),
//     );
//   }
// }
