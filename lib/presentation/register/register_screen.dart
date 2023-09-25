import 'package:dicoding_project/presentation/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:get_storage/get_storage.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();

  void register() {
    final box = GetStorage();

    box.write('username', usernameController.value.text);
    box.write('email', emailController.value.text);
    box.write('password', passwordController.value.text);

    var username = usernameController.value.text;
    var email = emailController.value.text;
    var password = passwordController.value.text;
    var confirmPass = confirmPassController.value.text;

    if ((username.isNotEmpty ||
            email.isNotEmpty ||
            password.isNotEmpty ||
            confirmPass.isNotEmpty) &&
        (password == confirmPass)) {
          Navigator.push(context, MaterialPageRoute(builder: (builder) {
        return const LoginScreen();
      }));
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Color.fromARGB(255, 0, 255, 8),
          content: Text("Register Successfully",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12, color: Colors.white)),
          duration: Duration(seconds: 2),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Color.fromARGB(255, 255, 0, 0),
          content: Text(
            "Register Failed",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12, color: Colors.white),
          ),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPassController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 57, left: 20, bottom: 2),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Text(
                      "Registrasi",
                      style: TextStyle(
                          fontFamily: "Outfit",
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Colors.black),
                    ),
                  ),
                  Image(
                    image: Svg("assets/icons/User.svg"),
                    height: 17,
                    width: 18,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, bottom: 31),
              child: Text(
                "Selamat bergabung bersama kami",
                style: TextStyle(
                    color: Color(0xFF5B5A5A),
                    fontSize: 14,
                    fontFamily: "Outfit",
                    fontWeight: FontWeight.w400),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 31, left: 18, right: 18),
              child: TextField(
                  controller: usernameController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      hintStyle: const TextStyle(
                          fontFamily: "Poppins", color: Color(0xFF535050)),
                      hintText: "Nama Panjang",
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: Color(0xFF959191))),
                      border: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Color(0xFF959191)),
                          borderRadius: BorderRadius.circular(10)),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 17))),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
              child: TextField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      hintStyle: const TextStyle(
                          fontFamily: "Poppins", color: Color(0xFF535050)),
                      hintText: "Email",
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: Color(0xFF959191))),
                      border: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Color(0xFF959191)),
                          borderRadius: BorderRadius.circular(10)),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 17))),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: TextField(
                  controller: passwordController,
                  obscureText: true,
                  obscuringCharacter: "*",
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      hintStyle: const TextStyle(
                          fontFamily: "Poppins", color: Color(0xFF535050)),
                      hintText: "Kata Sandi",
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: Color(0xFF959191))),
                      border: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Color(0xFF959191)),
                          borderRadius: BorderRadius.circular(10)),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 17))),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 10, left: 18, right: 18, bottom: 43),
              child: TextField(
                  controller: confirmPassController,
                  obscureText: true,
                  obscuringCharacter: "*",
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      hintStyle: const TextStyle(
                          fontFamily: "Poppins", color: Color(0xFF535050)),
                      hintText: "Konfirmasi Kata Sandi",
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: Color(0xFF959191))),
                      border: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Color(0xFF959191)),
                          borderRadius: BorderRadius.circular(10)),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 17))),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: SizedBox(
                height: 54,
                width: double.infinity,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 227, 227, 3),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    onPressed: () {
                      register();
                    },
                    child: Text(
                      "Daftar",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Sans Jakarta Plus",
                        // letterSpacing: -0.40
                      ),
                    )),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 42, left: 44, right: 44),
              child: Row(children: [
                Expanded(
                    child: Divider(
                  color: Color(0xFFA39797),
                  thickness: 1,
                )),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Text(
                    " atau login dengan ",
                    style: TextStyle(
                        color: Color(0xFF747070),
                        fontSize: 12,
                        fontFamily: "Outfit",
                        fontWeight: FontWeight.w400),
                  ),
                ),
                Expanded(
                    child: Divider(
                  color: Color(0xFFA39797),
                  thickness: 1,
                )),
              ]),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 35),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: Image(
                      image: AssetImage("assets/imgs/icon.png"),
                      width: 19,
                      height: 20,
                    ),
                  ),
                  Text(
                    "Google",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 38, bottom: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Sudah punya akun ? ",
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.6000000238418579),
                        fontSize: 12,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w300),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (builder) {
                        return const LoginScreen();
                      }));
                    },
                    child: Text(
                      "Masuk",
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.6000000238418579),
                          fontSize: 12,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w700),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
