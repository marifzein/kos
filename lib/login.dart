//import 'dart:ffi';

import 'dart:developer';

import 'package:flutter/material.dart';
//import 'package:flutter/widgets.dart';
import 'package:kos/dashboard.dart';
import 'package:kos/libclass.dart';
//import 'package:go_router/go_router.dart';
import 'package:kos/user_register.dart';
import 'package:kos/objectbox.g.dart';
import 'package:kos/entities/kos.dart';
import 'package:kos/entities/objectbox.dart';
import 'package:kos/main.dart';

//late Store store;

void main() async {
  //WidgetsFlutterBinding.ensureInitialized();
  //store = (await ObjectBox.create()).store;
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late Color myColor;
  late Size mediaSize;
  final Box<Pemilik> pemilikBox = store.box<Pemilik>();
  TextEditingController emailController =
      TextEditingController(text: 'marifzein@gmail.com');
  TextEditingController passwordController =
      TextEditingController(text: 'katanyakosong1');
  bool rememberuser = false;

  bool _isHidden = true;
  int idUser = 0;
//==========================================
  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  //================
  @override
  Widget build(BuildContext context) {
    myColor = Theme.of(context).primaryColor;
    mediaSize = MediaQuery.of(context).size;

    // return Container(
    return Container(
        decoration: BoxDecoration(
          color: myColor,
          /*image: DecorationImage(
            image: AssetImage("assets/img/kos.jpg"),
            fit: BoxFit.cover,
            colorFilter:
                ColorFilter.mode(myColor.withOpacity(0.2), BlendMode.dstATop),
          ),*/
        ),
        child: PopScope(
          canPop: false,
          child: Scaffold(
            //backgroundColor: Colors.transparent,
            //``backgroundColor: Colors.deepPurple,

            backgroundColor: Color(0xffc94b4b),

            body: Stack(
              children: [
                Positioned(top: 50, child: _buildTop()),
                Positioned(
                  bottom: 0,
                  child: _buildBottom(),
                )
              ],
            ),
          ),
        ));
  }

  Widget _buildTop() {
    return SizedBox(
      width: mediaSize.width,
      child: const Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.home,
            size: 40,
            color: Colors.white,
          ),
          Text(
            "KosKu",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 40,
                letterSpacing: 2),
          ),
        ],
      ),
    );
  }

  Widget _buildBottom() {
    return SizedBox(
      width: mediaSize.width,
      child: Card(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        )),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: _buildForm(),
        ),
      ),
    );
  }

  Widget _buildForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Selamat Datang di KosKu",
          style: TextStyle(
              color: myColor, fontSize: 28, fontWeight: FontWeight.w500),
        ),
        //_buildGreyText("Login dengan akun anda"),
        const SizedBox(height: 25),
        _buildGreyTextLink("Pengguna Baru"),
        const SizedBox(height: 25),
        _buildGreyText("Email Address"),
        _buildInputField(emailController),
        const SizedBox(height: 15),
        _buildGreyText("Password"),
        //_buildInputField(passwordController, isPassword: true),
        _buildInputPassword(passwordController),
        const SizedBox(
          height: 10,
        ),
        buildRememberForgot(),
        const SizedBox(height: 10),
        _buildLoginButton(),
        const SizedBox(height: 10),
        _buildOtherLogin(),
      ],
    );
  }

  Widget _buildGreyText(String text) {
    return Text(
      text,
      style: const TextStyle(color: Colors.black87),
    );
  }

  Widget _buildGreyTextLink(String text) {
    return GestureDetector(
      onTap: () {
        //Navigator.pushReplacement(
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return usrRegister(
              namausr: '',
            );
          }),
        );
      },
      child: Row(
        children: [
          Text(
            "Pengguna baru? ",
            style: const TextStyle(
              color: Colors.black87,
            ),
          ),
          Text(
            "Register",
            style: const TextStyle(
                color: Colors.black87, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  bool chkLogin() {
    QueryBuilder<Pemilik> builder = pemilikBox.query(Pemilik_.email
        .equals(emailController.text)
        .and(Pemilik_.password.equals(passwordController.text)));
    Query<Pemilik> query = builder.build();

    var hsl = query.find();
    /* log(emailController.text);
    log(passwordController.text);
    log((hsl.length).toString()); */
    if (hsl.length > 0) {
      //==============email dan password cocok
      //log(hsl.toString());
      int idUser = hsl[0].id;
      MyGlobalVariables.userId = hsl[0].id;
      MyGlobalVariables.userName = hsl[0].namapemilik;
      log(hsl[0].namapemilik);
      MyGlobalVariables.userEmail = hsl[0].email;
      MyGlobalVariables.userHp = hsl[0].hp;
      MyGlobalVariables.alamat = hsl[0].alamat;
      MyGlobalVariables.kota = hsl[0].kota;
      MyGlobalVariables.propinsi = hsl[0].propinsi;

      return true;
    } else {
      log('tidak ada di dtbase email ${emailController.text} dan ${passwordController.text}');
      return false;
    }
  }

  Widget _buildInputPassword(paramcontroller) {
    return TextFormField(
      obscureText: _isHidden,
      controller: paramcontroller,
      //validator: validatePwd,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      style: TextStyle(fontSize: 15),
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
        hintStyle: TextStyle(fontSize: 15),
        /* border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ), */
        hintText: "",
        prefixIcon: Icon(Icons.lock_rounded),
        suffix: InkWell(
            //onTap: _togglePasswordView,
            onTap: () {
              setState(() {
                _isHidden = !_isHidden;
              });
            },
            child: Icon(
              _isHidden
                  ?

                  /// CHeck Show & Hide.
                  Icons.visibility
                  : Icons.visibility_off,
            )),
      ),
    );
  }

  Widget _buildInputField(TextEditingController controller,
      {isPassword = false}) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
          suffixIcon:
              isPassword ? Icon(Icons.remove_red_eye) : Icon(Icons.done)),
      obscureText: isPassword,
    );
  }

  Widget buildRememberForgot() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Checkbox(
                value: rememberuser,
                onChanged: (value) {
                  setState(() {
                    rememberuser = value!;
                  });
                }),
            _buildGreyText("Ingat saya"),
          ],
        ),
        TextButton(
            onPressed: () {}, child: _buildGreyText("Saya Lupa Password")),
      ],
    );
  }

  Widget _buildLoginButton() {
    return ElevatedButton(
        onPressed: () {
          /* debugPrint("Email : ${emailController.text}");
          debugPrint("Password : ${passwordController.text}"); */
          //chkLogin();
          if (chkLogin() == true) {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) {
              return Dashboard();
              //name: state.pathParameters['name']
            }));
          } else {
            LibClass.popAlert(
                context, "L O G I N", "Email atau password salah");
            //dbase kosongan
            /* Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) {
              return Dashboard();
            })); */
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xff3b7b7a),
          foregroundColor: Colors.white,
          shape: const StadiumBorder(),
          elevation: 20,
          fixedSize: Size(200, 50),
          shadowColor: myColor,
          minimumSize: const Size.fromHeight(40),
        ),
        child: const Text("LOGIN"));
  }

  Widget _buildOtherLogin() {
    return Center(
      child: Column(
        children: [
          _buildGreyText("Atau login dengan"),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //Tab(icon: Image.asset("assets/img/facebook.png")),
              //Tab(icon: Image.asset("assets/img/twitter.png")),
              Tab(icon: Image.asset("assets/img/google.png")),
            ],
          )
        ],
      ),
    );
  }
}
