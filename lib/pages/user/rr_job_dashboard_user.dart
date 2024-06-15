import 'package:flutter/material.dart';
import 'package:flutter_app/drawer.dart';
import 'package:flutter_app/models/job_posting.dart';
import 'package:flutter_app/pages/admin/add_job_posting_screen.dart';
import 'package:flutter_app/pages/user/rr_job_details.dart';
import 'package:flutter_app/services/api_service.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class RrJobDashboardUser extends StatefulWidget {
  const RrJobDashboardUser({super.key});

  @override
  _RrJobDashboardUserState createState() => _RrJobDashboardUserState();
}

class _RrJobDashboardUserState extends State<RrJobDashboardUser> {
  late Future<List<JobPosting>> futureJobPostings;
  final TextEditingController _searchController = TextEditingController();
  List<JobPosting> _filteredJobPostings = [];

  @override
  void initState() {
    super.initState();
    futureJobPostings = ApiService().fetchJobPostings();
    futureJobPostings.then((data) {
      setState(() {
        _filteredJobPostings = data;
      });
    });
    _searchController.addListener(_filterJobPostings);
  }

  void _showAddJobPostingDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AddJobPostingDialog(onJobPosted: _refreshJobPostings);
      },
    );
  }

  void _showProfileDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const ListTile(
                  leading: Icon(Icons.person),
                  title: Text(
                    'Hendrixon Moldes',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                      'Graduate | Bachelor of Science in Information Technology'),
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.settings),
                  title: const Text('Settings'),
                  onTap: () {
                    // Navigate to settings
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.logout),
                  title: const Text('Logout'),
                  onTap: () {
                    // Handle logout
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _refreshJobPostings() async {
    setState(() {
      futureJobPostings = ApiService().fetchJobPostings();
      futureJobPostings.then((data) {
        setState(() {
          _filteredJobPostings = data;
        });
      });
    });
  }

  void _filterJobPostings() {
    String query = _searchController.text.toLowerCase();
    futureJobPostings.then((data) {
      setState(() {
        _filteredJobPostings = data
            .where((job) =>
                job.jobTitle.toLowerCase().contains(query) ||
                job.fieldIndustry.toLowerCase().contains(query))
            .toList();
      });
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(0, 4, 0, 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 0, 4, 0),
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          'assets/images/seal_of_university_of_nueva_caceres_2.png',
                        ),
                      ),
                    ),
                    child: const SizedBox(
                      width: 48,
                      height: 48,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 6.5, 0, 6.5),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: GoogleFonts.getFont(
                          'Montserrat',
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                          color: const Color(0xFF000000),
                        ),
                        children: [
                          TextSpan(
                            text: 'UNIVERSITY\n',
                            style: GoogleFonts.getFont(
                              'Montserrat',
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              height: 1.3,
                            ),
                          ),
                          TextSpan(
                            text: 'CAREER CENTER',
                            style: GoogleFonts.getFont(
                              'Montserrat',
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                              height: 1.3,
                            ),
                          ),
                          TextSpan(
                            text: '\n' 'MANAGEMENT SYSTEM',
                            style: GoogleFonts.getFont(
                              'Montserrat',
                              fontWeight: FontWeight.w700,
                              fontSize: 12,
                              height: 1.3,
                              color: const Color(0xFF000000),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () => _showProfileDialog(context),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFD9D9D9),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: SizedBox(
                  width: 88,
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(8, 4, 14, 4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CircleAvatar(
                          backgroundImage: AssetImage(
                              'assets/images/image_12.png'), // Add the path to your profile image
                          radius: 24,
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 20.6, 0, 20),
                          width: 12,
                          height: 7.4,
                          child: SizedBox(
                            width: 12,
                            height: 7.4,
                            child: SvgPicture.asset(
                              'assets/vectors/vector_331_x2.svg',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        toolbarHeight: 100,
      ),
      drawer: const MyDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(16, 24, 16, 24),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Recruitment and Placement',
                  style: GoogleFonts.getFont(
                    'Montserrat',
                    fontWeight: FontWeight.w700,
                    fontSize: 32,
                    color: const Color(0xFF000000),
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(16, 0, 16, 24),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    'assets/images/rectangle_223.jpeg',
                  ),
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    right: 0,
                    top: 0,
                    bottom: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0x80000000),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: const SizedBox(
                        width: 380,
                        height: 200,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(24, 64, 24, 63),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 0, 0, 4),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Seek Job Opportunities',
                              style: GoogleFonts.getFont(
                                'Montserrat',
                                fontWeight: FontWeight.w700,
                                fontSize: 24,
                                color: const Color(0xFFFFFFFF),
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ',
                            style: GoogleFonts.getFont(
                              'Montserrat',
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: const Color(0xFFFFFFFF),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(16, 0, 16, 24),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF808080),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Container(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(16, 0, 16, 24),
                        child: Column(
                          children: [
                            const SizedBox(height: 20),
                            TextField(
                              controller: _searchController,
                              decoration: InputDecoration(
                                hintText: 'Search jobs here...',
                                hintStyle: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondary),
                                prefixIcon: Icon(Icons.search,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondary),
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50),
                                  borderSide: BorderSide.none,
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 16, horizontal: 20),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFFD9D9D9),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              FutureBuilder<List<JobPosting>>(
                                future: futureJobPostings,
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return const Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  } else if (snapshot.hasError) {
                                    return Center(
                                      child: Text("${snapshot.error}"),
                                    );
                                  } else if (!snapshot.hasData ||
                                      _filteredJobPostings.isEmpty) {
                                    return const Center(
                                      child: Text(
                                        'No job found. Try different keyword/s',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    );
                                  } else {
                                    List<JobPosting> data =
                                        _filteredJobPostings;
                                    // Determine the number of columns based on screen width
                                    int crossAxisCount =
                                        (MediaQuery.of(context).size.width /
                                                225)
                                            .floor();

                                    return GridView.builder(
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: crossAxisCount,
                                        mainAxisSpacing: 10.0,
                                        crossAxisSpacing: 10.0,
                                        childAspectRatio: 0.53,
                                      ),
                                      itemCount: data.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Card(
                                          elevation: 10.0,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(25.0),
                                          ),
                                          clipBehavior: Clip.antiAlias,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Image.asset(
                                                'assets/images/gettyimages_1406724005_dsc_018073.jpeg',
                                                width: double.infinity,
                                                height: 100,
                                                fit: BoxFit.cover,
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(16.0),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(data[index].jobTitle,
                                                        style: const TextStyle(
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold)),
                                                    const SizedBox(height: 4),
                                                    Text(data[index].salary,
                                                        style: const TextStyle(
                                                          fontSize: 16,
                                                        )),
                                                    const SizedBox(height: 4),
                                                    Text(
                                                        data[index]
                                                            .fieldIndustry,
                                                        style: const TextStyle(
                                                          fontSize: 14,
                                                        )),
                                                  ],
                                                ),
                                              ),
                                              const Spacer(),
                                              Align(
                                                alignment: Alignment.bottomLeft,
                                                child: Padding(
                                                  padding: const EdgeInsets.all(
                                                      16.0),
                                                  child: ElevatedButton(
                                                    onPressed: () {
                                                      Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              RrJobDetailScreen(
                                                                  jobPosting:
                                                                      data[
                                                                          index]),
                                                        ),
                                                      );
                                                    },
                                                    child:
                                                        const Text('View More'),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
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
