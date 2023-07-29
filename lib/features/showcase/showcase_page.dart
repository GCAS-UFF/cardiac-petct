import 'package:cardiac_petct/src/ui/petct_allowed_food_card.dart';
import 'package:cardiac_petct/src/ui/petct_date_picker.dart';
import 'package:cardiac_petct/src/ui/petct_dropdown_button.dart';
import 'package:cardiac_petct/src/ui/petct_elevated_button.dart';
import 'package:cardiac_petct/src/ui/petct_food_group_card.dart';
import 'package:cardiac_petct/src/ui/petct_forbidden_food_card.dart';
import 'package:cardiac_petct/src/ui/petct_notification_card.dart';
import 'package:cardiac_petct/src/ui/petct_outlined_button.dart';
import 'package:cardiac_petct/src/ui/petct_percent_indicator.dart';
import 'package:cardiac_petct/src/ui/petct_progress_card.dart';
import 'package:cardiac_petct/src/ui/petct_radio_button.dart';
import 'package:cardiac_petct/src/ui/petct_switch_theme_mode.dart';
import 'package:cardiac_petct/src/ui/petct_text_button.dart';
import 'package:cardiac_petct/src/ui/petct_text_form_field.dart';
import 'package:cardiac_petct/src/ui/petct_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class ShowcasePage extends StatefulWidget {
  const ShowcasePage({super.key});

  @override
  State<ShowcasePage> createState() => _ShowcasePageState();
}

class _ShowcasePageState extends State<ShowcasePage> {
  final TextEditingController textEditingController = TextEditingController();
  final TextEditingController emailEditingController = TextEditingController();
  final TextEditingController passwordEditingController =
      TextEditingController();
  final TextEditingController dateEditingController = TextEditingController();
  final TextEditingController hourEditingController = TextEditingController();
  bool obscurePassword = true;
  String? radioValue;
  String? selectedDropdownItem;
  bool itemSelected = false;
  List<DropdownMenuItem<String>> dropdownItems = [
    const DropdownMenuItem<String>(
      value: '1',
      child: Text('Opção 1'),
    ),
    const DropdownMenuItem<String>(
      value: '2',
      child: Text('Opção 2'),
    ),
    const DropdownMenuItem<String>(
      value: '3',
      child: Text('Opção 3'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Showcase',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(22, 22, 22, 0),
        width: double.infinity,
        color: Theme.of(context).colorScheme.background,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Switch theme mode Button
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Switch theme mode',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const PetctSwitchThemeMode(),
                  const SizedBox(
                    height: 12,
                  ),
                ],
              ),
              //Elevated Button
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Elevated Button',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: PetctElevatedButton(
                          onPressed: () {},
                          child: const Text(
                            'Botão',
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              //Elevated Button
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Elevated Button With Icon',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: PetctElevatedButton(
                          onPressed: () {},
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Icon(
                                Icons.arrow_forward,
                                color: Colors.transparent,
                              ),
                              Text(
                                'Botão',
                              ),
                              Icon(
                                FeatherIcons.arrowRight,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              //Outlined Button
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Outlined Button',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: PetctOutlinedButton(
                          onPressed: () {},
                          child: const Text(
                            'Botão',
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              //Outlined With Icon Button
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Outlined With Icon Button',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: PetctOutlinedButton(
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Icon(
                                FeatherIcons.shoppingCart,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                              const Text(
                                'Botão',
                              ),
                              const Icon(
                                Icons.arrow_forward,
                                color: Colors.transparent,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              //Text Button
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Text Button',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: PetctTextButton(
                          child: const Text('Botão'),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              //Text form field - Name
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Text Form Field - Text',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: PetctTextFormField(
                          controller: textEditingController,
                          hintText: 'Nome',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 12,
              ), //Text form field - Email
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Text Form Field - Email',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: PetctTextFormField(
                          controller: emailEditingController,
                          textInputType: TextInputType.emailAddress,
                          hintText: 'Email',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 12,
              ), //Text form field - Password
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Text Form Field - Password',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: PetctTextFormField(
                          controller: passwordEditingController,
                          obscureText: obscurePassword,
                          textInputType: TextInputType.emailAddress,
                          hintText: 'Password',
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                obscurePassword = !obscurePassword;
                              });
                            },
                            icon: Icon(
                              obscurePassword
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 12,
              ), //Radio Button
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Radio Button',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Row(
                    children: [
                      PetctRadioButton(
                        title: 'Sim',
                        value: 'Sim',
                        groupValue: radioValue,
                        onChanged: (value) {
                          setState(() {
                            radioValue = 'Sim';
                          });
                        },
                      ),
                      PetctRadioButton(
                        title: 'Não',
                        value: 'Não',
                        groupValue: radioValue,
                        onChanged: (value) {
                          setState(() {
                            radioValue = 'Não';
                          });
                        },
                      ),
                      PetctRadioButton(
                        title: 'Talvez',
                        value: 'Talvez',
                        groupValue: radioValue,
                        onChanged: (value) {
                          setState(() {
                            radioValue = 'Talvez';
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 12,
              ), //Dropdown
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Dropdown',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: PetcetDropdownButton(
                          items: dropdownItems,
                          seletedItem: selectedDropdownItem,
                          onChanged: (value) {
                            setState(() {
                              selectedDropdownItem = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  //Date and hour
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Date and hour',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: PetctDatePicker(
                              onValue: (date) {
                                if (date != null) {
                                  dateEditingController.text =
                                      '${date.day < 10 ? 0 : ''}${date.day}/${date.month < 10 ? 0 : ''}${date.month}/${date.year}';
                                }
                              },
                              controller: dateEditingController,
                              validator: (value) {
                                if (value != null && value.isNotEmpty) {
                                  return null;
                                } else {
                                  return 'campo obrigatório';
                                }
                              },
                            ),
                          ),
                          const SizedBox(
                            width: 22,
                          ),
                          Expanded(
                            child: PetctTimePicker(
                              controller: hourEditingController,
                              onValue: (time) {
                                if (time != null) {
                                  hourEditingController.text = ''
                                      '${time.hour}:${time.minute}';
                                }
                              },
                              validator: (value) {
                                if (value != null && value.isNotEmpty) {
                                  return null;
                                } else {
                                  return 'campo obrigatório';
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 22,
              ),
              //Done Meal card
              // Column(
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   children: [
              //     Text(
              //       'Done Meal card',
              //       style: Theme.of(context).textTheme.titleLarge,
              //     ),
              //     const PetctDoneMealCard(meal: 'Café da manhã - 09:00'),
              //   ],
              // ),
              // const SizedBox(
              //   height: 22,
              // ), //Late Meal card
              // Column(
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   children: [
              //     Text(
              //       'Late Meal card',
              //       style: Theme.of(context).textTheme.titleLarge,
              //     ),
              //     const PetctLateMealCard(title: 'Lanche da manhã - 10:30'),
              //   ],
              // ),
              // const SizedBox(
              //   height: 22,
              // ),
              //Waiting Meal card
              // Column(
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   children: [
              //     Text(
              //       'Waiting Meal card',
              //       style: Theme.of(context).textTheme.titleLarge,
              //     ),
              //     const PetctWaitingMealCard(title: 'Almoço - 12:30'),
              //   ],
              // ),
              const SizedBox(
                height: 22,
              ),
              //Select Item Quantity
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Select Item Quantity',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  // PetCtSelectItemQuantity(
                  //   isSelected: itemSelected,
                  //   onSelection: (isSelected) {
                  //     setState(() {
                  //       itemSelected = !itemSelected;
                  //     });
                  //   },
                  // ),
                ],
              ),
              const SizedBox(
                height: 22,
              ),
              //Food Group Card
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Food Group Card',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  PetctFoodGroupCard(
                    image: Image.network(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRwwpy4ml2mExLMjdggW3OYaaKOeVDU0679JQ&usqp=CAU',
                      width: 60,
                    ),
                    title: 'Grupo: Proteínas',
                    subtitle: 'Carne, frango, ovos, etc',
                    onPressed: () {},
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  //Allowed and Forbidden Food Cards
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Allowed Food Card',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                          ),
                          PetctAllowedFoodCard(
                            image: Image.network(
                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRwwpy4ml2mExLMjdggW3OYaaKOeVDU0679JQ&usqp=CAU',
                              width: 60,
                            ),
                            title: 'Carne bovina',
                            quantity: '200g',
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Forbidden Food Card',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                          ),
                          PetctForbiddenFoodCard(
                            image: Image.network(
                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRwwpy4ml2mExLMjdggW3OYaaKOeVDU0679JQ&usqp=CAU',
                              width: 60,
                            ),
                            title: 'Carne bovina',
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  //Notification card
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Notification Meal card',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      PetctNotificationCard(
                        title: 'Atenção! Você está de jejum',
                        subtitle: 'Não esqueça de registrar sua refeição',
                        timeOfDay: '07:00',
                        icon: Icons.restaurant,
                        color: Theme.of(context).colorScheme.primary,
                        button: PetctOutlinedButton(
                          onPressed: () {},
                          child: const Text('Registrar'),
                        ),
                      ),
                      PetctNotificationCard(
                        title: 'Atenção! Você está de jejum',
                        subtitle: 'Não esqueça de registrar sua refeição',
                        timeOfDay: '20:00',
                        icon: Icons.warning_amber_rounded,
                        color: Theme.of(context).colorScheme.error,
                        button: PetctOutlinedButton(
                          onPressed: () {},
                          child: const Text('Ok'),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  //Circular Progress Indicator
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Circular Progress Indicator',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const PetctPercentIndicator(percent: .765, title: '12'),
                    ],
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  //Progress Card
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Progress Card',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      PetctProgressCard(
                        title: 'Prepare-se para a dieta',
                        contentText:
                            'Sua dieta vai começar logo. Nessa etapa você deve conferir quais refeições você irá fazer e separar os alimentos para conseguir realizar o exame!',
                        iconData: FeatherIcons.calendar,
                        actions: TextButton(
                          onPressed: () {},
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'Ver dieta',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                    ),
                              ),
                              Icon(
                                FeatherIcons.arrowRight,
                                color: Theme.of(context).colorScheme.primary,
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
