import 'package:cardiac_petct/src/input_validators/validations_mixin.dart';
import 'package:cardiac_petct/src/ui/petct_date_picker.dart';
import 'package:cardiac_petct/src/ui/petct_dropdown_button.dart';
import 'package:cardiac_petct/src/ui/petct_elevated_button.dart';
import 'package:cardiac_petct/src/ui/petct_radio_button.dart';
import 'package:cardiac_petct/src/ui/petct_switch_theme_mode.dart';
import 'package:cardiac_petct/src/ui/petct_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage>
    with ValidationsMixin {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController birthDateController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController repeatPasswordController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool obscurePassword = true;
  String? genderText;
  String diabetes = 'Não';
  String kidneyDesease = 'Não';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                FeatherIcons.arrowLeft,
              ),
            ),
            const PetctSwitchThemeMode(),
          ],
        ),
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.fromLTRB(22, 36, 22, 0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Cadastro',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(
                  height: 22,
                ),
                // Name
                PetctTextFormField(
                  controller: nameController,
                  hintText: 'Nome',
                  validator: (val) => combine(
                    [
                      () => isNotEmpty(val),
                      () => hasMinLength(val, 4),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 22,
                ),
                // BirthDate
                PetctDatePicker(
                  onValue: (date) {
                    if (date != null) {
                      birthDateController.text =
                          '${date.day < 10 ? 0 : ''}${date.day}/${date.month < 10 ? 0 : ''}${date.month}/${date.year}';
                    }
                  },
                  controller: birthDateController,
                  hintText: 'Data de Nascimento',
                  validator: isNotEmpty,
                ),
                const SizedBox(
                  height: 22,
                ),
                // Gender
                PetcetDropdownButton(
                  items: const ['Homem', 'Mulher', 'Prefiro não responder'],
                  seletedItem: genderText,
                  hintText: 'Gênero',
                  onChanged: (value) {
                    genderText = value;
                  },
                  validator: isNotEmpty,
                ),

                const SizedBox(
                  height: 22,
                ),
                // Email
                PetctTextFormField(
                  controller: emailController,
                  hintText: 'Email',
                  textInputType: TextInputType.emailAddress,
                  validator: (val) => combine([
                    () => isNotEmpty(val),
                    () => isEmailValid(val),
                  ]),
                ),
                const SizedBox(
                  height: 22,
                ),
                // Password
                PetctTextFormField(
                  controller: passwordController,
                  hintText: 'Senha',
                  obscureText: obscurePassword,
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
                  validator: (value) => combine([
                    () => isNotEmpty(value),
                    () => hasMinLength(value, 8),
                  ]),
                ),
                const SizedBox(
                  height: 22,
                ),
                // Repeat Password
                PetctTextFormField(
                  controller: repeatPasswordController,
                  hintText: 'Digite a senha novamente',
                  obscureText: true,
                  validator: (val) => combine([
                    () => isNotEmpty(val),
                    () => equalPassword(val, passwordController.text),
                  ]),
                ),
                const SizedBox(
                  height: 22,
                ),
                // Diabetes
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Possui diabetes?',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    Row(
                      children: [
                        PetctRadioButton(
                          title: 'Sim',
                          value: 'Sim',
                          groupValue: diabetes,
                          onChanged: (value) {
                            setState(() {
                              diabetes = 'Sim';
                            });
                          },
                        ),
                        PetctRadioButton(
                          title: 'Não',
                          value: 'Não',
                          groupValue: diabetes,
                          onChanged: (value) {
                            setState(() {
                              diabetes = 'Não';
                            });
                          },
                        ),
                        PetctRadioButton(
                          title: 'Talvez',
                          value: 'Talvez',
                          groupValue: diabetes,
                          onChanged: (value) {
                            setState(() {
                              diabetes = 'Talvez';
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 22,
                ),
                // Kidney Desease
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Possui doença renal?',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    Row(
                      children: [
                        PetctRadioButton(
                          title: 'Sim',
                          value: 'Sim',
                          groupValue: kidneyDesease,
                          onChanged: (value) {
                            setState(() {
                              kidneyDesease = 'Sim';
                            });
                          },
                        ),
                        PetctRadioButton(
                          title: 'Não',
                          value: 'Não',
                          groupValue: kidneyDesease,
                          onChanged: (value) {
                            setState(() {
                              kidneyDesease = 'Não';
                            });
                          },
                        ),
                        PetctRadioButton(
                          title: 'Talvez',
                          value: 'Talvez',
                          groupValue: kidneyDesease,
                          onChanged: (value) {
                            setState(() {
                              kidneyDesease = 'Talvez';
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 22,
                ),
                // Sign Up Button
                Row(
                  children: [
                    Expanded(
                      child: PetctElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {}
                        },
                        child: const Text(
                          'Cadastrar',
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
