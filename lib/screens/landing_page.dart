import 'package:flutter/material.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(102, 218, 255, 1.0),
      body: SafeArea(
        child: Center(
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              if (constraints.maxWidth > 600) {
                return buildTabletLayout(context);
              } else {
                return buildMobileLayout(context);
              }
            },
          ),
        ),
      ),
    );
  }

  Widget buildTabletLayout(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                "https://firebasestorage.googleapis.com/v0/b/onvocation-81249.appspot.com/o/Group%201742.png?alt=media&token=44db1ce5-82cd-473b-b9f8-77216dcf0c0c&_gl=1*z812yx*_ga*NTYyMDIyOTE4LjE2ODQxNzY3MzU.*_ga_CW55HF8NVT*MTY4NTU1NDA1OC4yMS4xLjE2ODU1NTc5MzQuMC4wLjA.",
              ),
              SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(102, 218, 255, 1.0),
                  border: Border.all(
                      color: Color.fromRGBO(20, 0, 92, 1.0), width: 2),
                  borderRadius: BorderRadius.circular(10),
                ),
                margin: EdgeInsets.fromLTRB(40, 20, 40, 20),
                padding: EdgeInsets.fromLTRB(10, 0, 10, 25),
                height: 170,
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(20),
                      width: 250,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Color.fromRGBO(20, 0, 92, 1.0),
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/register');
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            Color.fromRGBO(20, 0, 92, 1.0),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'Create Account',
                            style: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 250,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          color: Color.fromRGBO(20, 0, 92, 1.0),
                          width: 3,
                        ),
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/login');
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            Color.fromRGBO(102, 218, 255, 1.0),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'Login',
                            style: TextStyle(
                              color: Color.fromRGBO(20, 0, 92, 1.0),
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildMobileLayout(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return ListView(
      children: [
        SizedBox(height: screenHeight * 0.15),
        Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                "https://firebasestorage.googleapis.com/v0/b/onvocation-81249.appspot.com/o/Group%201742.png?alt=media&token=44db1ce5-82cd-473b-b9f8-77216dcf0c0c&_gl=1*z812yx*_ga*NTYyMDIyOTE4LjE2ODQxNzY3MzU.*_ga_CW55HF8NVT*MTY4NTU1NDA1OC4yMS4xLjE2ODU1NTc5MzQuMC4wLjA.",
              ),
              SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(102, 218, 255, 1.0),
                  border: Border.all(
                      color: Color.fromRGBO(20, 0, 92, 1.0), width: 2),
                  borderRadius: BorderRadius.circular(10),
                ),
                margin: EdgeInsets.fromLTRB(40, 20, 40, 20),
                padding: EdgeInsets.fromLTRB(10, 0, 10, 25),
                height: 170,
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(20),
                      width: 250,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Color.fromRGBO(20, 0, 92, 1.0),
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/register');
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            Color.fromRGBO(20, 0, 92, 1.0),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'Create Account',
                            style: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 250,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          color: Color.fromRGBO(20, 0, 92, 1.0),
                          width: 3,
                        ),
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/login');
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            Color.fromRGBO(102, 218, 255, 1.0),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'Login',
                            style: TextStyle(
                              color: Color.fromRGBO(20, 0, 92, 1.0),
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
