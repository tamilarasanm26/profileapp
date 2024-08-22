import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart'; // Import the percent indicator package

void main() {
  runApp(ProfileScreen());
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('View Profile'),
          backgroundColor: Color(0xFF00539C), // Primary color for the app bar
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              // Profile Header with name and avatar
              _buildProfileHeader(),
              SizedBox(height: 20),
              
              // Display Goal Reached above medical details
              _buildGoalReached(),
              SizedBox(height: 20),

              // Medical Details
              _buildMedicalDetails(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween, // Place widgets on opposite sides
      children: [
        // Name and Patient ID on the left
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'John Doe',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 5),
            Text(
              'Patient ID: 12345',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
          ],
        ),
        
        // Profile Picture on the right
        CircleAvatar(
          radius: 50,
          backgroundColor: Colors.grey[200], // Background color if image is not available
          backgroundImage: NetworkImage(
              'https://www.example.com/profile_picture.png'), // Placeholder URL for profile picture
          child: NetworkImage(
              'https://www.example.com/profile_picture.png') == null
            ? Icon(Icons.person, size: 50, color: const Color.fromARGB(255, 6, 6, 6))
            : null,
        ),
      ],
    );
  }

  Widget _buildMedicalDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Medical Details',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Text('Phone No: 123456789', style: TextStyle(fontSize: 16)),
        Text('Mail ID: user@gmail.com', style: TextStyle(fontSize: 16)),
        Text('Affected Side: Left', style: TextStyle(fontSize: 16)),
        Text('Condition: Shoulder Injury', style: TextStyle(fontSize: 16)),
        Text('Speciality: Orthopedics', style: TextStyle(fontSize: 16)),
        
        // Line above Medical History
        Divider(thickness: 1, color: Colors.grey[400]),
        SizedBox(height: 10),

        Text('Medical History: Previous fracture', style: TextStyle(fontSize: 16)),

        // Line below Medical History
        SizedBox(height: 10),
        Divider(thickness: 1, color: Colors.grey[400]),
      ],
    );
  }

  Widget _buildGoalReached() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Title for Goal Reached
        Text(
          'Goal Reached',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 20),

        // Row for Circular Percent Indicator and small containers (EMG and ROM)
        Container(
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 3), // Changes position of shadow
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Circular Percent Indicator
              CircularPercentIndicator(
                radius: 70.0, // Smaller size
                lineWidth: 8.0,
                percent: 0.75, // Example: 75% goal reached
                center: new Text("75%"),
                progressColor: Color(0xFF2ECC71), // Color for goal indicator
                circularStrokeCap: CircularStrokeCap.round,
              ),

              // SizedBox for spacing between the circle and the containers
              SizedBox(width: 20),

              // Column for EMG and ROM
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // EMG Container
                  Container(
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: Color(0xFFE74C3C), // Example color for EMG container
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Text(
                          'EMG',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          '75%',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),

                  // ROM Container
                  Container(
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: Color(0xFF3498DB), // Example color for ROM container
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Text(
                          'ROM',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          '85%',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
