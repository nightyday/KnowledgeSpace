import 'package:flutter/material.dart';
import 'package:knowledge_space3/constants/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(context),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/aboutimage.png",
                  height: 250,
                  width: 250,
                  alignment: Alignment.center,
                ),
              ],
            ),
            //Divider(),
            const SizedBox(height: 24),
            const Text.rich(TextSpan(children: [
              TextSpan(
                  text: 'Knowledge Space...\n',
                  style: TextStyle(
                      color: Colors.black,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold,
                      fontSize: 24)),
              TextSpan(
                  text:
                      ' a virtual library that features multiple different genres of books. This application is developed by students as a graduation project for their DUT cycle. This is the first version of the application, we are currently working on a new version offering new features which will be available as soon as possible.',
                  style: TextStyle(
                    color: kFont,
                    fontSize: 14,
                    height: 1.8,
                  )),
              TextSpan(
                  text: '  \n\n Rejoinez Nous : \n',
                  style: TextStyle(
                      color: Color(0xFF6c63ff),
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold,
                      fontSize: 18)),
            ])),

            //Added for icons to Social media
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 0),
              child: Row(
                children: <Widget>[
                  FlatButton(
                    onPressed: () {
                      _launchURL('https://www.instagram.com/knwldge.space/');
                    },
                    child: Image.asset('assets/icons/instagam.png'),
                    //const Text("Facebbok"),
                  ),
                  FlatButton(
                    onPressed: () {
                      _launchURL('https://Github.com');
                    },
                    child: Image.asset('assets/icons/github.png'),
                    //const Text("Facebbok"),
                  ),
                  //const Spacer(),

                  FlatButton(
                    height: 12,
                    minWidth: 14,
                    onPressed: () {
                      _launchURL('https://flutter.dev/');
                    },
                    child: Image.asset('assets/icons/flutter.png'),
                  ),

                  FlatButton(
                    height: 12,
                    minWidth: 10,
                    onPressed: () {
                      _launchURL('https://www.facebook.com/FlutterTutorial4U/');
                    },
                    child: Image.asset('assets/icons/facebook.png'),
                  ),

                  /* ElevatedButton(
                    onPressed: () {
                      _launchURL('https://facebook.com');
                    },
                    style: ButtonStyle(
                        foregroundColor: getColor(Colors.white, Colors.white),
                        backgroundColor: getColor(Colors.white, Colors.white),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0)))),
                    child: Image.asset('assets/icons/facebook.png'),
                  ),
*/
                  const SizedBox(height: 80),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      title: RichText(
        text: const TextSpan(
          text: 'About us',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
        ),
      ),
      centerTitle: true,
      backgroundColor: hexStringToColor("6c63ff"),
      elevation: 0,
      leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(
            Icons.arrow_back_ios_outlined,
            color: Colors.white70,
          )),
    );
  }

  _launchURL(String url) async {
    // url = 'https://facebook.com';
    if (await canLaunch(url)) {
      await launch(url, forceWebView: true, enableJavaScript: false);
    } else {
      throw 'Could not launch $url';
    }
  }
}
