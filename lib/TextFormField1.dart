import 'package:flutter/material.dart';

class TextFormFiedl1 extends StatefulWidget {
  const TextFormFiedl1({Key? key}) : super(key: key);

  @override
  State<TextFormFiedl1> createState() => _TextFormFiedl1State();
}

enum AuthMode { LogIn, SignUp }

class _TextFormFiedl1State extends State<TextFormFiedl1> {
  final _PassWordController=TextEditingController();
  AuthMode _authMode = AuthMode.LogIn;
 final  GlobalKey<FormState> _formKey = GlobalKey();
 final  Map<String, String> _authData = {'Email': '', 'Password': ''};

  void SwitchAuthMode() {
    if (_authMode == AuthMode.LogIn) {
      setState(() {
        _authMode = AuthMode.SignUp;
      });
    } else {
      setState(() {
        _authMode = AuthMode.LogIn;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Text Form Field Number 1 '),
      ),
      body: SafeArea(
        child: Center(
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Email'),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value!.isEmpty || value.contains('@')) {
                        return 'InVaild Email';
                      }
                      return null;
                    },
                    onSaved: (val) {
                      val = _authData['Email'];
                    },
                  ),
                  const SizedBox(height: 25,),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Password'),
                    obscureText: true,
                    keyboardType: TextInputType.emailAddress,
                    controller: _PassWordController,
                    validator: (value) {
                      if (value!.isEmpty || value.length<=5) {
                        return 'Pssword Is To Short';
                      }
                      return null;
                    },
                    onSaved: (val) {
                      val = _authData['Pssword'];
                    },
                  ),
                  const SizedBox(height: 25,),
                  if(_authMode==AuthMode.SignUp)
                    TextFormField(
                      decoration: const InputDecoration(
                            labelText:  'ConFirm Password'
                      ),
                      enabled: _authMode==AuthMode.SignUp,
                      validator:_authMode==AuthMode.SignUp?(value){
                        if(value !=_PassWordController.text){
                          return'PassWord Does Not Match';
                        }return null;
                      }
                      :null
                    ),
                   const SizedBox(height: 25,),
                  ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(borderRadius:BorderRadius.circular(30)
                        )
                      )
                    )
                      ,onPressed: onSubmit,
                      child: Text(
                          _authMode == AuthMode.LogIn ? 'LogIn' : 'SignUp')),
                  TextButton(
                      onPressed: SwitchAuthMode,
                      child: Text(
                          '${_authMode == AuthMode.LogIn ? 'SignUp' : 'LogIn'} InStead'))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void onSubmit() {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    _formKey.currentState!.save();
  }
}
