import 'package:cortwatch/components/dateTime.dart';
import 'package:cortwatch/components/ourtext.dart';
import 'package:cortwatch/components/ring.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../components/animatedFootIndicator.dart';

// Data class for stats
class StatsData {
  final String value;
  final String unit;
  final IconData icon;

  StatsData({
    required this.value,
    required this.unit,
    required this.icon,
  });
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  // Activity scores data
  final Map<String, int> activityScores = {
    'daily': 210,
    'weekly': 3417,
    'monthly': 13526,
  };

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width >= 600;
    final theme = Theme.of(context);

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.grey[900],
      drawer: _buildDrawer(isDesktop),
      body: SafeArea(
        child: _buildBody(isDesktop),
      ),
    );
  }

  Widget _buildDrawer(bool isDesktop) {
    final drawerWidth = isDesktop ? 350.0 : MediaQuery.of(context).size.width * 0.85;

    return Drawer(
      width: drawerWidth,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.grey[850]!,
              Colors.grey[900]!,
            ],
          ),
        ),
        child: _buildDrawerContent(isDesktop),
      ),
    );
  }

  Widget _buildDrawerContent(bool isDesktop) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: EdgeInsets.all(isDesktop ? 24.0 : 16.0),
            child: Column(
              children: [
                _buildDrawerHeader(isDesktop),
                const SizedBox(height: 32),
                _buildActivityScores(isDesktop),
                const Spacer(),
                _buildDrawerFooter(isDesktop),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDrawerHeader(bool isDesktop) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.orange.shade700, Colors.deepOrange.shade600],
        ),
        borderRadius: BorderRadius.circular(isDesktop ? 20 : 16),
        boxShadow: [
          BoxShadow(
            color: Colors.orange.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Text(
        "Activity Dashboard",
        style: TextStyle(
          color: Colors.white,
          fontSize: isDesktop ? 28 : 24.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildActivityScores(bool isDesktop) {
    return Column(
      children: [
        _buildScoreCard(
          "Daily Progress",
          activityScores['daily'].toString(),
          Colors.blue,
          isDesktop: isDesktop,
        ),
        const SizedBox(height: 20),
        _buildScoreCard(
          "Weekly Achievement",
          activityScores['weekly'].toString(),
          Colors.green,
          isDesktop: isDesktop,
        ),
        const SizedBox(height: 20),
        _buildScoreCard(
          "Monthly Record",
          activityScores['monthly'].toString(),
          Colors.purple,
          isDesktop: isDesktop,
        ),
      ],
    );
  }

  Widget _buildScoreCard(
      String title,
      String score,
      Color color, {
        required bool isDesktop,
      }) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(isDesktop ? 24 : 20),
      decoration: BoxDecoration(
        color: Colors.grey[850],
        borderRadius: BorderRadius.circular(isDesktop ? 24 : 20),
        border: Border.all(color: color.withOpacity(0.3), width: 2),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.grey[400],
              fontSize: isDesktop ? 18 : 16.sp,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Text(
                score,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: isDesktop ? 36 : 32.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                "steps",
                style: TextStyle(
                  color: Colors.grey[400],
                  fontSize: isDesktop ? 16 : 14.sp,
                ),
              ),
              const Spacer(),
              Icon(
                Icons.trending_up,
                color: color,
                size: isDesktop ? 32 : 28,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerFooter(bool isDesktop) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.favorite,
            color: Colors.red[400],
            size: isDesktop ? 24 : 20,
          ),
          const SizedBox(width: 8),
          Text(
            "Keep moving forward!",
            style: TextStyle(
              color: Colors.grey[400],
              fontSize: isDesktop ? 16 : 14.sp,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBody(bool isDesktop) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: EdgeInsets.all(isDesktop ? 24.0 : 16.0),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                _buildMainCard(isDesktop),
                SizedBox(height: isDesktop ? 32 : 24),
                _buildStatsGrid(isDesktop),
                SizedBox(height: isDesktop ? 32 : 24),
                _buildDateTimeSection(isDesktop),
                SizedBox(height: isDesktop ? 32 : 24),
                _buildRingSection(isDesktop),
              ]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMainCard(bool isDesktop) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(isDesktop ? 24 : 20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.deepOrange.shade600, Colors.orange.shade700],
        ),
        borderRadius: BorderRadius.circular(isDesktop ? 28 : 24),
        boxShadow: [
          BoxShadow(
            color: Colors.deepOrange.withOpacity(0.3),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () => _scaffoldKey.currentState?.openDrawer(),
                icon: Icon(
                  Icons.menu,
                  color: Colors.white,
                  size: isDesktop ? 28 : 24,
                ),
              ),
              const Spacer(),
              AnimatedFootIndicator(percentage: 75),
            ],
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                activityScores['daily'].toString(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: isDesktop ? 48 : 40.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                "steps",
                style: TextStyle(
                  color: Colors.white.withOpacity(0.8),
                  fontSize: isDesktop ? 24 : 20.sp,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            "Great progress today!",
            style: TextStyle(
              color: Colors.white,
              fontSize: isDesktop ? 20 : 18.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatsGrid(bool isDesktop) {
    final List<StatsData> stats = [
      StatsData(value: "390", unit: "Cal", icon: Icons.local_fire_department),
      StatsData(value: "0.8", unit: "Km", icon: Icons.directions_walk),
      StatsData(value: "160", unit: "min", icon: Icons.timer),
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: isDesktop ? 3 : 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: isDesktop ? 1.5 : 1.3,
      ),
      itemCount: stats.length,
      itemBuilder: (context, index) {
        final stat = stats[index];
        return _buildStatCard(
          stat.value,
          stat.unit,
          stat.icon,
          isDesktop,
        );
      },
    );
  }

  Widget _buildStatCard(String value, String unit, IconData icon, bool isDesktop) {
    return Container(
      padding: EdgeInsets.all(isDesktop ? 20 : 16),
      decoration: BoxDecoration(
        color: Colors.grey[850],
        borderRadius: BorderRadius.circular(isDesktop ? 24 : 20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: Colors.orange[400],
            size: isDesktop ? 32 : 28,
          ),
          const SizedBox(height: 9),
          Text(
            value,
            style: TextStyle(
              color: Colors.white,
              fontSize: isDesktop ? 24 : 20.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            unit,
            style: TextStyle(
              color: Colors.grey[400],
              fontSize: isDesktop ? 16 : 14.sp,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDateTimeSection(bool isDesktop) {
    return Container(
      height: isDesktop ? 200 : 150.h,
      decoration: BoxDecoration(
        color: Colors.grey[850],
        borderRadius: BorderRadius.circular(isDesktop ? 24 : 20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child:  DateTimeWidget(),
    );
  }

  Widget _buildRingSection(bool isDesktop) {
    return Container(
      height: isDesktop ? 240 : 200.h,
      decoration: BoxDecoration(
        color: Colors.grey[850],
        borderRadius: BorderRadius.circular(isDesktop ? 24 : 20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child:  GlowingRing(),
    );
  }
}
//
// import 'package:cortwatch/components/dateTime.dart';
// import 'package:cortwatch/components/ourtext.dart';
// import 'package:cortwatch/components/ring.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// import '../components/animatedFootIndicator.dart';
//
// class HomeScreen extends StatelessWidget {
//    HomeScreen({super.key});
//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: _scaffoldKey,
//           backgroundColor: Colors.grey,
//        drawer: Drawer(
//
//          backgroundColor: Colors.grey,
//          child: Container(
//            width: MediaQuery.of(context).size.width,
//            height:MediaQuery.of(context).size.height,
//            child: Column(
//              crossAxisAlignment: CrossAxisAlignment.start,
//              children: [
//                SizedBox(height: 30.h,),
//                Center(child: Container(width: 160.w,height: 32.h,color: Colors.orange,child: Text(" Your Activity! ",style: TextStyle(color: Colors.black,fontWeight: FontWeight.normal,fontSize: 25),))),
//                SizedBox(height: 40.h,),
//                Container(
//                    width: 170.w,
//                    height: 90.h,
//                    decoration: BoxDecoration(
//                      color: Colors.blueGrey,
//                      border: Border.all(color: Colors.white30),
//                      borderRadius: BorderRadius.circular(20.r),
//                    ),
//                    child: Column(
//                      crossAxisAlignment: CrossAxisAlignment.start,
//                      children: [
//                        Text("  Daily Score",style: TextStyle(color: Colors.black,fontWeight: FontWeight.normal,fontSize: 25.sp),),
//                        SizedBox(height:10.h ,),
//                        Row(
//                          children: [
//                            Text("  210",style: TextStyle(color:Colors.orange.shade700,fontWeight: FontWeight.bold,fontSize: 30.sp ),),
//                            Icon(Icons.local_fire_department,color: Colors.red.shade700,size: 50,),
//                          ],
//                        )
//                      ],
//                    ),
//                ),
//                SizedBox(height: 40.h,),
//                Row(
//                  mainAxisAlignment: MainAxisAlignment.end,
//                  children: [
//                    Container(
//                        width: 180.w,
//                        height: 100.h,
//                        decoration: BoxDecoration(
//                          color: Colors.blueGrey,
//                          border: Border.all(color: Colors.white30),
//                          borderRadius: BorderRadius.circular(20.r),
//                        ),
//                        child: Column(
//                          children: [
//                            Text("Weekly Score",style: TextStyle(color: Colors.black,fontWeight: FontWeight.normal,fontSize: 25.sp),),
//                            SizedBox(height:10.h ,),
//                            Row(
//                              children: [
//                                Text("  3417",style: TextStyle(color:Colors.orange.shade700,fontWeight: FontWeight.bold,fontSize: 40 ),),
//                                Icon(Icons.local_fire_department,color: Colors.red.shade700,size: 50,),
//                              ],
//                            )
//                          ],
//                        )
//                    ),
//                  ],
//                ),
//                SizedBox(height: 40.h,),
//                Container(
//                    width: 180.w,
//                    height: 100.h,
//                    decoration: BoxDecoration(
//                      color: Colors.blueGrey,
//                      border: Border.all(color: Colors.white30),
//                      borderRadius: BorderRadius.circular(20.r),
//                    ),
//                    child: Column(
//                      children: [
//                        Text("Monthly Score",style: TextStyle(color: Colors.black,fontWeight: FontWeight.normal,fontSize: 25.sp),),
//                        SizedBox(height:10.h ,),
//                        Row(
//                          children: [
//                            Text(" 13526",style: TextStyle(color:Colors.orange.shade700,fontWeight: FontWeight.bold,fontSize: 40 ),),
//                            Icon(Icons.local_fire_department,color: Colors.red.shade700,size: 50,),
//                          ],
//                        )
//                      ],
//                    )
//                ),
//              ],
//            ),
//          )
//        ),
//        body: Container(
//          width: MediaQuery.of(context).size.width,
//          height: MediaQuery.of(context).size.height,
//          child: Column(
//            children: [
//               SizedBox(height: 30.h,),
//              Container(
//                width: MediaQuery.of(context).size.width,
//                height: 250.h,
//                margin: EdgeInsets.all(10),
//                decoration: BoxDecoration(
//                  border: Border.all(color: Colors.deepOrange),
//                  color: Colors.deepOrange,
//                  borderRadius: BorderRadius.circular(20.sp),
//                ),
//                child: Column(
//                  children: [
//                    SizedBox(height: 10.h,),
//                    Row(
//                      children: [
//                        IconButton(onPressed: (){_scaffoldKey.currentState?.openDrawer();}, icon: Icon(Icons.arrow_forward_ios,color: Colors.white,size: 20.r,)),
//                        Text("210 ", style: TextStyle(color: Colors.white,fontSize: 30.sp,fontWeight: FontWeight.bold),),
//                        Text("steps",style:TextStyle(fontSize: 25.sp,fontWeight: FontWeight.normal,color: Colors.black) ,)
//                       , SizedBox(width: 70.w,),
//                   AnimatedFootIndicator(percentage: 75,),
//              ]),
//                    SizedBox(height: 20.h,),
//                   Ourtext(text: "You have a great work Today !",fontWeight: FontWeight.normal,),
//                    SizedBox(height: 10.h,),
//                    Divider(
//                      thickness: 1,
//                      color: Colors.white,
//                      indent: 15,
//                      endIndent: 15,
//                    ),
//                    SizedBox(height: 20.h,),
//                    Row(
//                      mainAxisAlignment: MainAxisAlignment.spaceAround,
//                      children: [
//                       Ourtext(text: "390 \n Cal"),
//                        Ourtext(text: "0.8 \n Km"),
//                        Ourtext(text: "160 \nminutes"),
//                      ],
//                    )
//                  ],
//                ),
//          ),
//
//              Container(
//                  height: 150.h,
//                  width: 300.w,
//                  child: DateTimeWidget()),
//
//              SizedBox(
//                height: 180.h,
//                width: 200.w,
//                child: GlowingRing(),
//              ),
//
//
//
//     ])) );
//   }
// }
