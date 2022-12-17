import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fridge/consts/consts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
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
              Center(
                child: Text(
                  "or",
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: TextField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 3,
                        color: ColorList.secondColor,
                      ), //<-- SEE HERE
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    hintText: 'Username',
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: TextField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        // width: 3,
                        color: ColorList.secondColor,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    hintText: 'Username',
                  ),
                ),
              ),
              // Radio(
              //   value: "rememberme",
              //   groupValue: "group value",
              //   onChanged: (value) {
              //     setState(
              //       () {
              //         print(value);

              //       },
              //     );
              //   },
              // ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: Row(
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
