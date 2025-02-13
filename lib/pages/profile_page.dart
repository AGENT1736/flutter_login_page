import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ict_hub_session/cubit/profile_cubit.dart';
import 'package:ict_hub_session/cubit/profile_states.dart';
import 'package:ict_hub_session/model/user_profile.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit()..fetchUserProfile(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Profile",
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
        ),
        body:
            BlocBuilder<ProfileCubit, ProfileStates>(builder: (context, state) {
          if (state is ProfileLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ProfileLoaded) {
            UserProfile user = state.userProfile;
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 50, bottom: 6),
                  child: Icon(
                    Icons.person_pin,
                    size: 50,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6.0),
                  child: Text(
                    "Username: ${user.username}",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6.0),
                  child: Text(
                    "Email: ${user.email}",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            );
          } else if (state is ProfileError) {
            return Center(
              child: Text(state.message),
            );
          }
          return Center(
            child: Text("No profile data"),
          );
        }),
      ),
    );
  }
}
