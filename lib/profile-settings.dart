import 'package:flutter/material.dart';
import 'package:flutter_application_2/AllOnboarding.dart';
import 'package:flutter_application_2/login.dart';
import 'package:flutter_application_2/navbar.dart';
import 'package:flutter_application_2/storageAuth.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Theme mode state
  bool isLightMode = false;

  void toggleTheme(bool value) {
    setState(() {
      isLightMode = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile ',
      theme: ThemeData(
        brightness: isLightMode ? Brightness.light : Brightness.dark,
        scaffoldBackgroundColor: isLightMode
            ? Colors.white
            : const Color(0xFF131313),
        primaryColor: const Color(0xFFFFA000),
        splashColor: Colors.white24,
        listTileTheme: const ListTileThemeData(
          dense: true,
          contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
        ),
      ),
      home: ProfilePage(onThemeChange: toggleTheme, isLightMode: isLightMode),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ProfilePage extends StatefulWidget {
  final bool isLightMode;
  final Function(bool) onThemeChange;

  const ProfilePage({
    super.key,
    required this.isLightMode,
    required this.onThemeChange,
  });

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _selectedIndex = 3; // Profile tab is last

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _buildOptionButton({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        splashColor: Colors.white10,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          child: Row(
            children: [
              Icon(icon, color: Colors.white70),
              const SizedBox(width: 14),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
              const Icon(Icons.chevron_right, color: Colors.white38),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuTile(
    IconData icon,
    String title, {
    VoidCallback? onTap,
    Color? textColor,
  }) {
    return Column(
      children: [
        ListTile(
          leading: Icon(icon, color: Colors.white70),
          title: Text(
            title,
            style: TextStyle(color: textColor ?? Colors.white, fontSize: 16),
          ),
          onTap: onTap,
          trailing: const Icon(Icons.chevron_right, color: Colors.white38),
        ),
        const Divider(color: Colors.white12, height: 0),
      ],
    );
  }

  Future<String?> getToken() async {
    return await TokenStorage.getToken();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () => Navigator.of(context).maybePop(),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              //Navigator.pop(context);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8),
          child: Column(
            children: [
              // Avatar + name + email
              Center(
                child: Column(
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      clipBehavior: Clip.none,
                      children: [
                        CircleAvatar(
                          radius: 52,
                          backgroundColor: const Color(0xFF2A2A2A),
                          backgroundImage: Image.asset("images/user.png").image,
                        ),
                        Positioned(
                          bottom: -12,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFF2B2B2B),
                              borderRadius: BorderRadius.circular(18),
                              border: Border.all(color: Colors.white12),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: const [
                                Icon(
                                  Icons.edit,
                                  size: 14,
                                  color: Colors.white70,
                                ),
                                SizedBox(width: 6),
                                Text(
                                  "Edit profile picture",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white70,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 28),
                    FutureBuilder<String?>(
                      future: getToken(),
                      builder: (context, snapshot) {
                        return Text(
                          (snapshot.data ?? 'Loading...').replaceAll(
                            "@gmail.com",
                            "",
                          ),
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.orangeAccent,
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 4),
                    FutureBuilder<String?>(
                      future: TokenStorage.getToken(),
                      builder: (context, snapshot) {
                        return Text(
                          snapshot.data ?? 'No Name',
                          style: TextStyle(
                            color: Colors.white70.withOpacity(0.9),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Divider(color: Colors.white12, thickness: 1),

              // Option buttons
              const SizedBox(height: 8),
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF191919),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    _buildOptionButton(
                      icon: Icons.tune,
                      title: "User preferences and Interests",
                      onTap: () {},
                    ),
                    const Divider(color: Colors.white12, height: 0),
                    _buildOptionButton(
                      icon: Icons.badge,
                      title: "Personal details and Addresses",
                      onTap: () {},
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 14),
              const Divider(color: Colors.white12),

              // Menu list
              const SizedBox(height: 6),
              _buildMenuTile(
                Icons.notifications,
                'Notifications',
                onTap: () {},
              ),
              _buildMenuTile(Icons.favorite_border, 'Favourites', onTap: () {}),
              _buildMenuTile(Icons.help_outline, 'Help', onTap: () {}),
              _buildMenuTile(
                Icons.contact_mail_outlined,
                'Contact',
                onTap: () {},
              ),
              _buildMenuTile(
                Icons.settings_outlined,
                'Settings',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SettingsPage(
                        isLightMode: widget.isLightMode,
                        onThemeChange: widget.onThemeChange,
                      ),
                    ),
                  );
                },
              ),
              _buildMenuTile(
                Icons.power_settings_new,
                'Logout',
                textColor: Colors.redAccent,
                onTap: () {
                  TokenStorage.deleteToken();
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => Login()),
                  );
                },
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}

// ================= Settings Page =================
class SettingsPage extends StatefulWidget {
  final bool isLightMode;
  final Function(bool) onThemeChange;

  const SettingsPage({
    super.key,
    required this.isLightMode,
    required this.onThemeChange,
  });

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late bool isLightMode;
  String selectedLanguage = 'English';

  @override
  void initState() {
    super.initState();
    isLightMode = widget.isLightMode;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ListTile(
            leading: const Icon(Icons.light_mode, color: Colors.white70),
            title: const Text(
              'Light Mode',
              style: TextStyle(color: Colors.white),
            ),
            trailing: Switch(
              value: isLightMode,
              onChanged: (value) {
                setState(() {
                  isLightMode = value;
                  widget.onThemeChange(value); // ← changes theme dynamically
                });
              },
              activeColor: Theme.of(context).primaryColor,
            ),
          ),
          const Divider(color: Colors.white12),
          ListTile(
            leading: const Icon(Icons.language, color: Colors.white70),
            title: const Text(
              'Language',
              style: TextStyle(color: Colors.white),
            ),
            trailing: DropdownButton<String>(
              value: selectedLanguage,
              dropdownColor: const Color(0xFF191919),
              items: const [
                DropdownMenuItem(value: 'English', child: Text('English')),
                DropdownMenuItem(value: 'Arabic', child: Text('Arabic')),
                DropdownMenuItem(value: 'French', child: Text('French')),
              ],
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    selectedLanguage = value;
                  });
                }
              },
            ),
          ),
          const Divider(color: Colors.white12),
        ],
      ),
    );
  }
}
