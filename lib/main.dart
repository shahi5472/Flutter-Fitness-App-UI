import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_borders/gradient_borders.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fitness App',
      debugShowCheckedModeBanner: kDebugMode,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: false,
        textTheme: GoogleFonts.latoTextTheme(),
        appBarTheme: AppBarTheme(
          elevation: 0,
          centerTitle: true,
          titleTextStyle: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF192126),
            disabledBackgroundColor: const Color(0xFF192126).withOpacity(0.4),
            disabledForegroundColor: const Color(0xFF192126).withOpacity(0.4),
            maximumSize: Size(double.infinity, 56),
            minimumSize: Size(double.infinity, 56),
            textStyle: GoogleFonts.lato(
              fontSize: 16,
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
          ),
        ),
      ),
      home: const GetStartedScreen(),
    );
  }
}

///================================ [ Get Started Screen ] ================================
class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(),
          GetStartedImageSection(),
          PositionedDirectional(
            start: 20,
            end: 20,
            bottom: 0,
            child: GetStartedBottomView(),
          ),
        ],
      ),
    );
  }
}

class GetStartedImageSection extends StatelessWidget {
  const GetStartedImageSection({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Stack(
      children: [
        Image.network(
          "https://images.pexels.com/photos/936075/pexels-photo-936075.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
          height: size.height * 0.7,
          width: size.width,
          fit: BoxFit.cover,
        ),
        PositionedDirectional(
          start: 0,
          end: 0,
          bottom: 0,
          child: Container(
            height: 193,
            width: size.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: AlignmentDirectional.topCenter,
                end: AlignmentDirectional.bottomCenter,
                colors: [
                  Colors.white.withOpacity(0.0),
                  Colors.white,
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class GetStartedBottomView extends StatelessWidget {
  const GetStartedBottomView({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyle = GoogleFonts.lato(
      fontSize: 24,
      color: const Color(0xFF192126),
      fontWeight: FontWeight.w800,
    );
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "Wherever You Are",
          style: textStyle,
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                PositionedDirectional(
                  bottom: 0,
                  start: 0,
                  end: 0,
                  child: Container(
                    height: 14,
                    color: Color(0xFFBBF246),
                  ),
                ),
                Text("Health", style: textStyle),
              ],
            ),
            Text(" Is Number One", style: textStyle)
          ],
        ),
        SizedBox(height: 30),
        Text(
          "There is no instant way to a health life",
          style: TextStyle(
            fontSize: 15,
            color: Color(0xFF192126).withOpacity(0.5),
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(height: 80),
        ElevatedButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
          },
          child: Text("Get Started"),
        ),
        SizedBox(height: 30),
      ],
    );
  }
}

///================================ [ Get Started Screen ] ================================

///================================ [ Home Screen ] ================================
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void onIndexChange(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<Widget> widgets = [
    DashboardView(),
    ExploreScreen(),
    SizedBox(),
    SizedBox(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF7F6FA),
      body: Stack(
        children: [
          PositionedDirectional(
            bottom: 0,
            start: 0,
            end: 0,
            top: 0,
            child: SafeArea(
              bottom: false,
              child: widgets[_selectedIndex],
            ),
          ),
          PositionedDirectional(
            bottom: 20,
            start: 30,
            end: 30,
            child: CustomBottomNavBarView(onIndexChange: onIndexChange),
          ),
        ],
      ),
    );
  }
}

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GoodMorningSection(),
          SizedBox(height: 20),
          PopularSectionView(),
          SizedBox(height: 20),
          TodayPlanSectionView(),
          SizedBox(height: 100),
        ],
      ),
    );
  }
}

///================================ [ Today Plan ] ================================
class TodayPlanModel {
  final String imageUrl;
  final String title;
  final String subtitle;
  final double width;
  final String percentage;
  final String status;

  TodayPlanModel({
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    required this.width,
    required this.percentage,
    required this.status,
  });
}

List<TodayPlanModel> planItems = [
  TodayPlanModel(
    imageUrl: "https://images.pexels.com/photos/4162487/pexels-photo-4162487.jpeg?auto=compress&cs=tinysrgb&w=600",
    title: "Push Up",
    subtitle: "100 Push up a day",
    width: 65,
    percentage: "45%",
    status: "Intermediate",
  ),
  TodayPlanModel(
    imageUrl: "https://images.pexels.com/photos/2475875/pexels-photo-2475875.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    title: "Sit Up",
    subtitle: "20 Sit up a day",
    width: 113,
    percentage: "75%",
    status: "Beginner",
  ),
  TodayPlanModel(
    imageUrl: "https://images.pexels.com/photos/7894601/pexels-photo-7894601.jpeg?auto=compress&cs=tinysrgb&w=600",
    title: "Knee Push Up",
    subtitle: "20 Sit up a day",
    width: 65,
    percentage: "45%",
    status: "Beginner",
  ),
  TodayPlanModel(
    imageUrl: "https://images.pexels.com/photos/4162487/pexels-photo-4162487.jpeg?auto=compress&cs=tinysrgb&w=600",
    title: "Push Up",
    subtitle: "100 Push up a day",
    width: 65,
    percentage: "45%",
    status: "Intermediate",
  ),
  TodayPlanModel(
    imageUrl: "https://images.pexels.com/photos/2475875/pexels-photo-2475875.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    title: "Sit Up",
    subtitle: "20 Sit up a day",
    width: 113,
    percentage: "75%",
    status: "Beginner",
  ),
  TodayPlanModel(
    imageUrl: "https://images.pexels.com/photos/7894601/pexels-photo-7894601.jpeg?auto=compress&cs=tinysrgb&w=600",
    title: "Knee Push Up",
    subtitle: "20 Sit up a day",
    width: 65,
    percentage: "45%",
    status: "Beginner",
  ),
];

class TodayPlanItemView extends StatelessWidget {
  const TodayPlanItemView({super.key, required this.item});

  final TodayPlanModel item;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(23),
      ),
      margin: EdgeInsetsDirectional.only(start: 20, end: 20, bottom: 20),
      padding: EdgeInsetsDirectional.symmetric(horizontal: 14, vertical: 14),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  item.imageUrl,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.title,
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF192126),
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      item.subtitle,
                      style: GoogleFonts.poppins(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF192126).withOpacity(0.50),
                      ),
                    ),
                    SizedBox(height: 8),
                    Stack(
                      children: [
                        Container(
                          height: 16,
                          margin: EdgeInsetsDirectional.only(end: 6),
                          decoration: BoxDecoration(
                            color: Color(0xFFF2F2F2),
                            borderRadius: BorderRadius.circular(3),
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              height: 16,
                              width: item.width,
                              margin: EdgeInsetsDirectional.only(end: 6),
                              decoration: BoxDecoration(
                                color: Color(0xFFBBF246),
                                borderRadius: BorderRadius.circular(3),
                              ),
                              child: Center(
                                child: Text(
                                  item.percentage,
                                  style: GoogleFonts.poppins(
                                    fontSize: 8,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF192126),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          PositionedDirectional(
            end: 8,
            top: -14,
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFF192126),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(6),
                  bottomRight: Radius.circular(6),
                ),
              ),
              padding: EdgeInsetsDirectional.symmetric(horizontal: 8, vertical: 2),
              child: Text(
                item.status,
                style: GoogleFonts.poppins(
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TodayPlanSectionView extends StatelessWidget {
  const TodayPlanSectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return TitleSectionView(
      title: "Today Plan",
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          planItems.length,
          (index) {
            final item = planItems[index];
            return TodayPlanItemView(item: item);
          },
        ),
      ),
    );
  }
}

///================================ [ Today Plan ] ================================

///================================ [ Popular workouts ] ================================
class PopularWorkoutModel {
  final String imageUrl;
  final String title;
  final String burnKCal;
  final String time;

  PopularWorkoutModel({
    required this.imageUrl,
    required this.title,
    required this.burnKCal,
    required this.time,
  });
}

List<PopularWorkoutModel> popularItems = [
  PopularWorkoutModel(
    imageUrl: "https://images.pexels.com/photos/416778/pexels-photo-416778.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    title: "Lower Body Training",
    burnKCal: '500 KCal',
    time: '50 Min',
  ),
  PopularWorkoutModel(
    imageUrl: "https://images.pexels.com/photos/2247179/pexels-photo-2247179.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    title: "Hand\nTraining",
    burnKCal: '600 KCal',
    time: '40 Min',
  ),
  PopularWorkoutModel(
    imageUrl: "https://images.pexels.com/photos/176782/pexels-photo-176782.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    title: "Lower Body Training",
    burnKCal: '300 KCal',
    time: '90 Min',
  ),
  PopularWorkoutModel(
    imageUrl: "https://images.pexels.com/photos/1153367/pexels-photo-1153367.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    title: "Hand\nTraining",
    burnKCal: '200 KCal',
    time: '40 Min',
  ),
  PopularWorkoutModel(
    imageUrl: "https://images.pexels.com/photos/416778/pexels-photo-416778.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    title: "Lower Body Training",
    burnKCal: '600 KCal',
    time: '50 Min',
  ),
  PopularWorkoutModel(
    imageUrl: "https://images.pexels.com/photos/2247179/pexels-photo-2247179.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    title: "Hand\nTraining",
    burnKCal: '800 KCal',
    time: '10 Min',
  ),
];

class PopularSectionView extends StatelessWidget {
  const PopularSectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return TitleSectionView(
      title: "Popular Workouts",
      child: SizedBox(
        height: 174,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: popularItems.length,
          padding: EdgeInsetsDirectional.symmetric(horizontal: 20),
          separatorBuilder: (_, __) => SizedBox(width: 20),
          itemBuilder: (context, index) {
            final item = popularItems[index];
            return PopularItemView(item: item);
          },
        ),
      ),
    );
  }
}

class PopularItemView extends StatelessWidget {
  const PopularItemView({super.key, required this.item});

  final PopularWorkoutModel item;

  @override
  Widget build(BuildContext context) {
    const double width = 280;
    const double height = 174;
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => WorkoutScreenView()));
      },
      child: SizedBox(
        width: width,
        height: height,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(23),
          child: Stack(
            children: [
              Image.network(
                item.imageUrl,
                width: width,
                height: height,
                fit: BoxFit.cover,
              ),
              Container(
                width: width,
                height: height,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: AlignmentDirectional.topCenter,
                    end: AlignmentDirectional.bottomCenter,
                    colors: [
                      Color(0xFF000000).withOpacity(0.51),
                      Color(0xFF000000).withOpacity(0),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 2,
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: AlignmentDirectional.centerStart,
                              end: AlignmentDirectional.centerEnd,
                              colors: [
                                Color(0xFF353535).withOpacity(0.8),
                                Color(0xFF4B4B4B).withOpacity(0.0),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.only(start: 20, bottom: 20, top: 20),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.title,
                                maxLines: 2,
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 12),
                              CustomChipView(
                                iconData: Icons.fireplace_outlined,
                                title: item.burnKCal,
                              ),
                              SizedBox(height: 10),
                              CustomChipView(
                                iconData: Icons.timer_outlined,
                                title: item.time,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: AlignmentDirectional.centerEnd,
                      child: Container(
                        height: 38,
                        width: 38,
                        margin: EdgeInsetsDirectional.only(end: 20),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFFBBF246),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.play_arrow_rounded,
                            color: Color(0xFF191D1A),
                            size: 18,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

///================================ [ Popular workouts ] ================================

///================================ [ Custom Chip View ] ================================
class CustomChipView extends StatelessWidget {
  const CustomChipView({super.key, this.color, this.textColor, this.iconData, required this.title});

  final IconData? iconData;
  final String title;
  final Color? color;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color ?? Colors.white.withOpacity(0.80),
      ),
      padding: EdgeInsetsDirectional.symmetric(horizontal: 10, vertical: 6),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (iconData != null) ...[
            Icon(
              iconData,
              color: Colors.black,
              size: 14,
            ),
            SizedBox(width: 8),
          ],
          Flexible(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: textColor ?? Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

///================================ [ Custom Chip View ] ================================

///================================ [ Good Morning Section ] ================================
class GoodMorningSection extends StatelessWidget {
  const GoodMorningSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.symmetric(horizontal: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Good Morning 🔥",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFF192126),
            ),
          ),
          SizedBox(height: 6),
          Text(
            "Pramuditya Uzumaki",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w800,
              color: Color(0xFF192126),
            ),
          ),
          SizedBox(height: 20),
          CustomSearchView(),
        ],
      ),
    );
  }
}

///================================ [ Good Morning Section ] ================================

///================================ [ CustomSearchView ] ================================
class CustomSearchView extends StatelessWidget {
  const CustomSearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: EdgeInsetsDirectional.symmetric(horizontal: 16, vertical: 16),
      child: Row(
        children: [
          Icon(
            Icons.search_rounded,
            color: Color(0xFF8C9093),
            size: 18,
          ),
          SizedBox(width: 8),
          Expanded(
            child: Text(
              "Search",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color(0xFF192126).withOpacity(0.50),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

///================================ [ CustomSearchView ] ================================

///================================ [ CustomBottomNavBarView ] ================================
class CustomBottomNavBarView extends StatefulWidget {
  const CustomBottomNavBarView({super.key, required this.onIndexChange});

  final Function(int index) onIndexChange;

  @override
  State<CustomBottomNavBarView> createState() => _CustomBottomNavBarViewState();
}

class _CustomBottomNavBarViewState extends State<CustomBottomNavBarView> {
  int _selectedIndex = 0;

  void onIndexChange(int index) {
    setState(() {
      _selectedIndex = index;
      widget.onIndexChange.call(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      decoration: BoxDecoration(
        color: Color(0xFF192126),
        borderRadius: BorderRadiusDirectional.circular(32),
      ),
      padding: EdgeInsetsDirectional.symmetric(horizontal: 16),
      child: Row(
        children: List.generate(items.length, (index) {
          final item = items[index];
          return Expanded(
            child: InkWell(
              onTap: () => onIndexChange(index),
              child: Container(
                height: 36,
                decoration: index == _selectedIndex
                    ? BoxDecoration(
                        color: Color(0xFFBBF246),
                        borderRadius: BorderRadiusDirectional.circular(32),
                      )
                    : null,
                padding: EdgeInsetsDirectional.symmetric(horizontal: 6),
                child: Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(item.icon, size: 24, color: index == _selectedIndex ? const Color(0xFF192126) : Colors.white),
                      if (index == _selectedIndex) ...[
                        SizedBox(width: 3),
                        Flexible(
                          child: Text(
                            item.title,
                            style: GoogleFonts.lato(
                              fontSize: 13,
                              color: const Color(0xFF192126),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}

class BottomModel {
  final String title;
  final IconData icon;

  BottomModel(this.title, this.icon);
}

List<BottomModel> items = [
  BottomModel("Home", Icons.home),
  BottomModel("Explore", Icons.rocket_launch_outlined),
  BottomModel("", Icons.bar_chart),
  BottomModel("Profile", Icons.person),
];

///================================ [ CustomBottomNavBarView ] ================================

///================================ [ Title Section View ] ================================
class TitleSectionView extends StatelessWidget {
  const TitleSectionView({super.key, required this.title, this.child});

  final String title;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.symmetric(horizontal: 20),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Color(0xFF192126),
            ),
          ),
        ),
        SizedBox(height: 20),
        if (child != null) child!,
      ],
    );
  }
}

///================================ [ Title Section View ] ================================

///================================ [ Explore] ================================
class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF7F6FA),
      body: SingleChildScrollView(
        padding: EdgeInsetsDirectional.only(bottom: 100),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SafeArea(
              bottom: false,
              child: Padding(
                padding: const EdgeInsetsDirectional.symmetric(horizontal: 20),
                child: QuarantineSectionView(),
              ),
            ),
            SizedBox(height: 30),
            BestForSectionView(),
            SizedBox(height: 10),
            ChallengeSectionView(),
            SizedBox(height: 20),
            TitleSectionView(
              title: "Fast Warmup",
              child: SizedBox(
                height: 106,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsetsDirectional.symmetric(horizontal: 20),
                  separatorBuilder: (_, __) => SizedBox(width: 20),
                  itemCount: 10,
                  itemBuilder: (context, index) => BestForYouItemView(
                    width: 260,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ChallengeSectionView extends StatelessWidget {
  const ChallengeSectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return TitleSectionView(
      title: "Challenge",
      child: Padding(
        padding: const EdgeInsetsDirectional.symmetric(horizontal: 20),
        child: Row(
          children: [
            Expanded(
              child: ChallengeItemView(
                backgroundColor: Color(0xFFBBF246),
                textColor: Color(0xFF192126),
                iconColor: Colors.white.withOpacity(0.5),
                title: "Plank\nChallenge",
                icon: Icons.local_fire_department_outlined,
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: ChallengeItemView(
                backgroundColor: Color(0xFF192126),
                textColor: Colors.white,
                iconColor: Colors.white.withOpacity(0.5),
                title: "Sprint\nChallenge",
                icon: Icons.directions_run_rounded,
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: ChallengeItemView(
                backgroundColor: Colors.white,
                textColor: Color(0xFF192126),
                iconColor: Color(0xFFBBF246).withOpacity(0.5),
                title: "Squat\nChallenge",
                icon: Icons.bolt,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ChallengeItemView extends StatelessWidget {
  const ChallengeItemView({
    super.key,
    required this.backgroundColor,
    required this.textColor,
    required this.iconColor,
    required this.title,
    required this.icon,
  });

  final Color backgroundColor;
  final Color textColor;
  final Color iconColor;
  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadiusDirectional.circular(9),
      ),
      child: Stack(
        children: [
          PositionedDirectional(
            bottom: 0,
            end: 0,
            child: Icon(
              icon,
              color: iconColor,
              size: 80,
            ),
          ),
          PositionedDirectional(
            bottom: 10,
            start: 10,
            child: Text(
              title,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: textColor,
                height: 1.6,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BestForSectionView extends StatelessWidget {
  const BestForSectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return TitleSectionView(
      title: "Best for you",
      child: SizedBox(
        height: 220,
        child: GridView.builder(
          scrollDirection: Axis.horizontal,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
            childAspectRatio: 0.38,
          ),
          itemCount: 10,
          padding: EdgeInsetsDirectional.symmetric(horizontal: 20),
          itemBuilder: (context, index) => BestForYouItemView(),
        ),
      ),
    );
  }
}

class BestForYouItemView extends StatelessWidget {
  const BestForYouItemView({super.key, this.height, this.width});

  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(9),
      ),
      padding: EdgeInsetsDirectional.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Image.network(
              "https://images.pexels.com/photos/3822583/pexels-photo-3822583.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Belly fat burner",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF192126),
                  ),
                ),
                SizedBox(height: 10),
                CustomChipView(
                  title: '10 min',
                  color: Color(0xFFF1F1F1),
                  textColor: Color(0xFF192126).withOpacity(0.70),
                ),
                SizedBox(height: 4),
                CustomChipView(
                  title: 'Beginner',
                  color: Color(0xFFF1F1F1),
                  textColor: Color(0xFF192126).withOpacity(0.70),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

///================================ [ Explore] ================================

class QuarantineSectionView extends StatelessWidget {
  const QuarantineSectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadiusDirectional.circular(23),
      child: Stack(
        children: [
          Image.network(
            "https://images.pexels.com/photos/917732/pexels-photo-917732.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
            width: double.infinity,
            height: 200,
            fit: BoxFit.cover,
          ),
          Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: AlignmentDirectional.centerStart,
                end: AlignmentDirectional.centerEnd,
                colors: [
                  Colors.black.withOpacity(0.50),
                  Colors.black.withOpacity(0.0),
                ],
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  height: 200,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: AlignmentDirectional.centerStart,
                      end: AlignmentDirectional.centerEnd,
                      colors: [
                        Color(0xFF3C3C3C),
                        Colors.black.withOpacity(0.0),
                      ],
                    ),
                  ),
                  padding: EdgeInsetsDirectional.only(top: 30, bottom: 30, start: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Best Quarantine\nWorkout",
                        style: GoogleFonts.lato(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Spacer(),
                      TextButton(
                        onPressed: () {},
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "See more",
                              style: GoogleFonts.lato(
                                fontSize: 14,
                                color: const Color(0xFFBBF246),
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(width: 6),
                            Icon(
                              Icons.arrow_forward_ios_sharp,
                              color: const Color(0xFFBBF246),
                              size: 12,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(child: SizedBox()),
            ],
          ),
        ],
      ),
    );
  }
}

///================================ [ Workout] ================================
class WorkoutScreenView extends StatelessWidget {
  const WorkoutScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF192126),
      appBar: AppBar(
        backgroundColor: Color(0xFF192126),
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back_ios_new_sharp),
        ),
        title: Text("Workout"),
      ),
      body: Stack(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsetsDirectional.only(start: 20, end: 20, bottom: 100, top: 30),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TopImageSectionView(),
                  SizedBox(height: 60),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Lower Body Training",
                      style: GoogleFonts.lato(
                        fontSize: 24,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "The lower abdomen and hips are the most difficult areas of the body to reduce when we are on a diet. Even so, in this area, especially the legs as a whole, you can reduce weight even if you don't use tools.",
                    textAlign: TextAlign.justify,
                    style: GoogleFonts.lato(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      height: 1.6,
                      color: Colors.white.withOpacity(0.50),
                    ),
                  ),
                  SizedBox(height: 40),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Text(
                          "Rounds",
                          style: GoogleFonts.lato(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Text(
                        "1",
                        style: GoogleFonts.lato(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "/8",
                        style: GoogleFonts.lato(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  ...List.generate(5, (index) {
                    return RoundItemView();
                  }),
                ],
              ),
            ),
          ),
          PositionedDirectional(
            start: 20,
            end: 20,
            bottom: 40,
            child: ElevatedButton(
              onPressed: () {},
              style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
                    backgroundColor: WidgetStateProperty.all(Color(0xFFBBF246)),
                  ),
              child: Text(
                "Lets Workout",
                style: GoogleFonts.lato(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF192126),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RoundItemView extends StatelessWidget {
  const RoundItemView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF384046),
        borderRadius: BorderRadius.circular(15),
      ),
      margin: EdgeInsetsDirectional.only(bottom: 14),
      padding: EdgeInsetsDirectional.symmetric(horizontal: 12, vertical: 10),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(13),
            child: Image.network(
              "https://images.pexels.com/photos/6703092/pexels-photo-6703092.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
              height: 58,
              width: 58,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Jumping Jacks",
                  style: GoogleFonts.lato(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "00:30",
                  style: GoogleFonts.lato(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: Colors.white.withOpacity(0.50),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 28,
            width: 28,
            margin: EdgeInsetsDirectional.only(end: 12),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFF192126),
            ),
            child: Icon(
              Icons.play_arrow_rounded,
              size: 13,
              color: Color(0xFFBBF246),
            ),
          ),
        ],
      ),
    );
  }
}

class TopImageSectionView extends StatelessWidget {
  const TopImageSectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(23),
          child: Image.network(
            "https://images.pexels.com/photos/4534578/pexels-photo-4534578.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
            height: 250,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        PositionedDirectional(
          bottom: 0,
          start: 0,
          end: 0,
          child: Container(
            height: 134,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.horizontal(
                left: Radius.circular(15),
                right: Radius.circular(15),
              ),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF1D1D1D).withOpacity(0.0),
                  Color(0xFF686868).withOpacity(1),
                ],
              ),
            ),
          ),
        ),
        PositionedDirectional(
          bottom: -30,
          start: 40,
          end: 40,
          child: CustomOverlayView(),
        ),
      ],
    );
  }
}

class CustomOverlayView extends StatelessWidget {
  const CustomOverlayView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0x4D192126),
        borderRadius: BorderRadius.circular(15),
        border: GradientBoxBorder(
          width: 0.6,
          gradient: LinearGradient(
            begin: Alignment(-1.0, -1.0),
            end: Alignment(1.0, 1.0),
            stops: [-0.7983, 0.3359, 0.4923, 0.6695, 1.9414],
            colors: [
              Color(0xFFBBF246),
              Color.fromRGBO(187, 242, 70, 0.01),
              Color.fromRGBO(187, 242, 70, 0),
              Color.fromRGBO(187, 242, 70, 0.01),
              Color(0xFFBBF246),
            ],
          ),
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
          child: Row(
            children: [
              Expanded(
                child: DetailsTimerView(
                  icon: Icons.timer_outlined,
                  title: "Time",
                  value: "20 min",
                ),
              ),
              Container(
                height: 38,
                width: 1,
                color: Colors.white.withOpacity(0.25),
                margin: EdgeInsetsDirectional.only(end: 14),
              ),
              Expanded(
                child: DetailsTimerView(
                  icon: Icons.local_fire_department_outlined,
                  title: "Burn",
                  value: "95 kcal",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DetailsTimerView extends StatelessWidget {
  const DetailsTimerView({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
  });

  final String title;
  final String value;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 32,
          width: 32,
          alignment: Alignment.center,
          margin: EdgeInsetsDirectional.only(end: 6, start: 20),
          decoration: BoxDecoration(
            color: const Color(0xFFBBF246),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Icon(
            size: 24,
            icon,
            color: Color(0xFF191D1A),
          ),
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: GoogleFonts.poppins(
                fontSize: 10,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
            Text(
              value,
              style: GoogleFonts.poppins(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Color(0xFFBBF246),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

///================================ [ Workout] ================================
