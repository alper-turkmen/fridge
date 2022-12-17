import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fridge/consts/consts.dart';
import 'package:fridge/widgets/logintextfield_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final myController1 = TextEditingController();
    final myController2 = TextEditingController();
    return Scaffold(
      backgroundColor: ColorList.secondGreen,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 150,
                width: 150,
                child: Placeholder(),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Login using social networks",
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 0; i < SharedList.socialMediaIcon.length; i++)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {},
                        child: CircleAvatar(
                          backgroundColor: ColorList.whiteColor,
                          child: SharedList.socialMediaIcon[i].buttonIcon,
                        ),
                      ),
                    ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: Text(
                  "or",
                ),
              ),
              SizedBox(
                height: 10,
              ),
              LoginTextFieldWidget(
                text: "Username",
                controller: myController1,
              ),
              SizedBox(
                height: 10,
              ),
              LoginTextFieldWidget(
                text: "Password",
                controller: myController2,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Checkbox(
                          value: false,
                          onChanged: (bool? value) {
                            setState(
                              () {
                                value = value!;
                              },
                            );
                          },
                        ),
                        Text("Remember Me")
                      ],
                    ),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        "Kayıt Ol",
                      ),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text(
                  "Login",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
