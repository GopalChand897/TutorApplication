import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:testproject/Models/OnboardingModel.dart';
import 'package:testproject/Pages/LoginPage.dart';
import 'package:testproject/screen/login_signup.dart';
class OnBoarding extends StatefulWidget{
  @override
  State <StatefulWidget> createState () => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding>{

   String urlImage = '';
   String title = '';
   String subtitle = '';
  final controller = PageController();
  bool isLastPage = false;

  @override
  Widget build(BuildContext context) {
     return Scaffold(
       body: Container(
         padding: const EdgeInsets.only(bottom: 80),
         child: PageView(
           controller: controller,
           onPageChanged: (index){
             setState(() => isLastPage = index == 2);
           },
           children: const [

             BuildPage(
               urlImage: 'assets/SmartHomeTutoring.jpeg',
               title: 'Ready to Teach or to be Taught', //Create Your Tutor OR Student Profile
               subtitle: 'Choose your Teacher if your Student,\nChoose your Student if your Teacher',
             ),

             BuildPage(
               urlImage: 'assets/SmartHomeTutoring.jpeg',
               title: 'Find Student OR Teacher',
               subtitle: 'Select the location and find someone near you.',
             ),

             BuildPage(

               urlImage: 'assets/SmartHomeTutoring.jpeg',
               title: 'Start Tutoring OR Studying',
               subtitle: '“Success doesn’t come to you, you go to it.”',
             ),

           ],
         ),
       ),

       bottomSheet: isLastPage
         ? TextButton(
           style: TextButton.styleFrom(
             primary: Colors.white,
             backgroundColor: Colors.teal.shade700,
             minimumSize: const Size.fromHeight(60),
           ),
           onPressed: () async{
             //navigate to choose page
             final prefs = await SharedPreferences.getInstance();
             prefs.setBool('showChoose', true);
             Navigator.of(context).pushReplacement(
               MaterialPageRoute(builder: (context) => 
              //  LoginSignupScreen()

              LoginPage()
               
               ),
             );
           },
           child: const Text(
             'Get Started',
             textAlign: TextAlign.center,
             style: TextStyle(
               fontSize: 20,
               fontWeight: FontWeight.bold,
             ),
           ),
         )
           :Container(
         padding: const EdgeInsets.symmetric(horizontal: 20),
         height: 80,
         child: Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [

             //skip
             TextButton(
                 onPressed: () => controller.jumpToPage(2),
                 child: const Text('SKIP', style: TextStyle(fontSize: 17,),)),
             //dots
             Center(
               child: SmoothPageIndicator(
                 controller: controller,
                 count: 3,
                 effect:const WormEffect(
                   spacing: 20,
                   dotColor: Colors.black26,
                   activeDotColor: Colors.teal,
                 ),
                 //to click on dots and move
                 onDotClicked: (index) => controller.animateToPage(
                   index,
                   duration: const Duration(milliseconds: 500),
                   curve: Curves.ease,
                 ),
               ),
             ),
             //next
             TextButton(
                 onPressed: () => controller.nextPage(
                   duration: const Duration(milliseconds: 500),
                   curve: Curves.ease,),
                 child: const Text('NEXT', style: TextStyle(fontSize: 17,),)),
           ],
         ),
       ),
     );
  }
}
