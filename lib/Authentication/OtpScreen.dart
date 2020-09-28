import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        width: 375.0,
        height: 812.0,
        child: Stack(
          children: <Widget>[
            Container(
              alignment: Alignment(0.03, 0.48),
              width: 375.0,
              height: 812.0,
              decoration: BoxDecoration(
                color: const Color(0xFF3F3F3F),
              ),
              child: SizedBox(
                width: 336.0,
                height: 812.0,
                child: Column(
                  children: <Widget>[
                    Spacer(flex: 123),
                    Text(
                      'Let Us Verify Your Phone Number',
                      style: GoogleFonts.montserrat(
                        fontSize: 20.0,
                        color: const Color(0xFFD8CFCF),
                        shadows: [
                          Shadow(
                            color: Colors.black.withOpacity(0.16),
                            offset: Offset(10.0, 10.0),
                            blurRadius: 6.0,
                          ),
                        ],
                      ),
                    ),
                    Spacer(flex: 49),
                    Text(
                      'Enter your phone no',
                      style: GoogleFonts.montserrat(
                        fontSize: 20.0,
                        color: const Color(0xFFE2C277),
                      ),
                    ),
                    Spacer(flex: 8),
                    Align(
                      alignment: Alignment(0.07, 0.0),
                      child: Container(

                        width: 244.0,
                        height: 64.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(23.0),
                          color: const Color(0xFFEBE8D9),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.16),
                              offset: Offset(10.0, 10.0),
                              blurRadius: 6.0,
                            ),
                          ],
                        ),
                      )
                    ),
                    Spacer(flex: 8),
                    Container(
                      alignment: Alignment.center,
                      width: 123.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.all(Radius.elliptical(61.5, 25.0)),
                        color: const Color(0xFFE2C277),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.16),
                            offset: Offset(10.0, 10.0),
                            blurRadius: 6.0,
                          ),
                        ],
                      ),
                      child: Text(
                        'Go!',
                        style: GoogleFonts.montserrat(
                          fontSize: 20.0,
                          color: const Color(0xFFAF2E2E),
                        ),
                      ),
                    ),
                    Spacer(flex: 15),
                    Align(
                      alignment: Alignment(-0.01, 0.0),
                      child: Text(
                        'Enter the OTP',
                        style: GoogleFonts.montserrat(
                          fontSize: 20.0,
                          color: const Color(0xFFE2C277),
                        ),
                      ),
                    ),
                    Spacer(flex: 3),
                    Container(
                      width: 244.0,
                      height: 64.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(23.0),
                        color: const Color(0xFFEBE8D9),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.16),
                            offset: Offset(10.0, 10.0),
                            blurRadius: 6.0,
                          ),
                        ],
                      ),
                    ),
                    Spacer(flex: 8),
                    Container(
                      alignment: Alignment.center,
                      width: 123.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.all(Radius.elliptical(61.5, 25.0)),
                        color: const Color(0xFFE2C277),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.16),
                            offset: Offset(10.0, 10.0),
                            blurRadius: 6.0,
                          ),
                        ],
                      ),
                      child: Text(
                        'Verify!',
                        style: GoogleFonts.montserrat(
                          fontSize: 20.0,
                          color: const Color(0xFFAF2E2E),
                        ),
                      ),
                    ),
                    Spacer(flex: 231),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'We\'ll send an OTP',
                        style: GoogleFonts.montserrat(
                          fontSize: 20.0,
                          color: const Color(0xFFB93434),
                          shadows: [
                            Shadow(
                              color: Colors.black.withOpacity(0.16),
                              offset: Offset(10.0, 10.0),
                              blurRadius: 6.0,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Spacer(flex: 43),
                  ],
                ),
              ),
            ),
            Positioned(
              top: -78,
              child: Container(
                width: 375.0,
                height: 765.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(81.0),
                  color: const Color(0xFFD84242),
                  border: Border.all(
                    width: 1.0,
                    color: const Color(0xFF707070),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF090707).withOpacity(0.28),
                      offset: Offset(10.0, 10.0),
                      blurRadius: 6.0,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
