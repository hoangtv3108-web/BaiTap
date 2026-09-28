import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(const ProfileApp());
}

class ProfileApp extends StatelessWidget {
  const ProfileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Việt Hoàng Profile',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: const Color(0xFFF1F5F9),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF0284C7),
          brightness: Brightness.light,
          surface: const Color(0xFFFFFFFF),
        ),
        textTheme: GoogleFonts.plusJakartaSansTextTheme(
          ThemeData.light().textTheme,
        ),
        useMaterial3: true,
      ),
      home: const ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F5F9),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: FittedBox(
              fit: BoxFit.contain,
              child: Container(
                width: 390,
                height: 844,
                decoration: BoxDecoration(
                  color: const Color(0xFFF8FAFD),
                  borderRadius: BorderRadius.circular(44),
                  border: Border.all(
                    color: const Color(0xFFCBD5E1),
                    width: 2.5,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF0F172A).withValues(alpha: 0.09),
                      blurRadius: 32,
                      offset: const Offset(0, 14),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(41),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _ProfileTopBar(),
                        _ProfileAvatarSection(),
                        _StatsCard(),
                        _AboutMeSection(),
                        _SkillsSection(),
                        _FeaturedProjectsSection(),
                        _ContactInformationCard(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// -------------------------------------------------------------
// Top Bar Widget (Back button, Profile Title, Share button)
// -------------------------------------------------------------
class _ProfileTopBar extends StatelessWidget {
  const _ProfileTopBar();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildNavButton(
          icon: Icons.chevron_left_rounded,
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Back button tapped'),
                duration: Duration(milliseconds: 800),
              ),
            );
          },
        ),
        Text(
          'Profile',
          style: GoogleFonts.plusJakartaSans(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: const Color(0xFF0F172A),
          ),
        ),
        _buildNavButton(
          icon: Icons.share_outlined,
          onTap: () {
            Clipboard.setData(
              const ClipboardData(text: 'Việt Hoàng - Công nghệ phần mềm'),
            );
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Đã sao chép liên kết thông tin!'),
                duration: Duration(milliseconds: 800),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildNavButton({required IconData icon, required VoidCallback onTap}) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          width: 38,
          height: 38,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: const Color(0xFFE2E8F0).withValues(alpha: 0.8),
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF0F172A).withValues(alpha: 0.04),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Icon(
            icon,
            color: const Color(0xFF1E293B),
            size: 20,
          ),
        ),
      ),
    );
  }
}

// -------------------------------------------------------------
// Profile Avatar, Verified Badge, Name, Title, and Location
// -------------------------------------------------------------
class _ProfileAvatarSection extends StatelessWidget {
  const _ProfileAvatarSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Avatar with gradient ring and verified badge
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              padding: const EdgeInsets.all(3.5),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [
                    Color(0xFFFF9E7D),
                    Color(0xFFFF5E62),
                    Color(0xFFFFB199),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Color(0x28FF5E62),
                    blurRadius: 14,
                    offset: Offset(0, 6),
                  ),
                ],
              ),
              child: Container(
                padding: const EdgeInsets.all(2.5),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: ClipOval(
                  child: Image.asset(
                    'assets/images/viet_hoang.jpg',
                    width: 90,
                    height: 90,
                    fit: BoxFit.cover,
                    alignment: const Alignment(0, -0.2),
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        width: 90,
                        height: 90,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Color(0xFF3B82F6), Color(0xFF1D4ED8)],
                          ),
                        ),
                        child: const Center(
                          child: Text(
                            'VH',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            // Verified check badge
            Positioned(
              bottom: 2,
              right: 2,
              child: Container(
                padding: const EdgeInsets.all(2),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x20000000),
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.verified,
                  color: Color(0xFF0284C7),
                  size: 22,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        // Name: Việt Hoàng
        Text(
          'Việt Hoàng',
          style: GoogleFonts.plusJakartaSans(
            fontSize: 22,
            fontWeight: FontWeight.w800,
            color: const Color(0xFF0F172A),
            letterSpacing: -0.4,
          ),
        ),
        const SizedBox(height: 3),
        // Role: Công nghệ phần mềm
        Text(
          'Công nghệ phần mềm',
          style: GoogleFonts.plusJakartaSans(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: const Color(0xFF64748B),
          ),
        ),
        const SizedBox(height: 6),
        // Location Badge
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          decoration: BoxDecoration(
            color: const Color(0xFFEDF2F7),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.location_on_outlined,
                size: 14,
                color: Color(0xFF64748B),
              ),
              const SizedBox(width: 4),
              Text(
                'Hà Nội, Việt Nam',
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF475569),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// -------------------------------------------------------------
// Stats Card (Projects, Experience, Rating)
// -------------------------------------------------------------
class _StatsCard extends StatelessWidget {
  const _StatsCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color(0xFFE2E8F0).withValues(alpha: 0.7),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF0F172A).withValues(alpha: 0.03),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: _buildStatItem(
              value: '148',
              label: 'Projects',
            ),
          ),
          _buildDivider(),
          Expanded(
            child: _buildStatItem(
              value: '9 Yrs',
              label: 'Experience',
            ),
          ),
          _buildDivider(),
          Expanded(
            child: _buildStatItem(
              value: '4.9',
              label: 'Rating',
              hasStar: true,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Container(
      height: 32,
      width: 1,
      color: const Color(0xFFE2E8F0),
    );
  }

  Widget _buildStatItem({
    required String value,
    required String label,
    bool hasStar = false,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              value,
              style: GoogleFonts.plusJakartaSans(
                fontSize: 18,
                fontWeight: FontWeight.w800,
                color: const Color(0xFF0F172A),
              ),
            ),
            if (hasStar) ...[
              const SizedBox(width: 3),
              const Icon(
                Icons.star_rounded,
                color: Color(0xFFFBBF24),
                size: 18,
              ),
            ],
          ],
        ),
        const SizedBox(height: 2),
        Text(
          label,
          style: GoogleFonts.plusJakartaSans(
            fontSize: 11.5,
            fontWeight: FontWeight.w500,
            color: const Color(0xFF94A3B8),
          ),
        ),
      ],
    );
  }
}

// -------------------------------------------------------------
// About Me Section
// -------------------------------------------------------------
class _AboutMeSection extends StatelessWidget {
  const _AboutMeSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'About Me',
          style: GoogleFonts.plusJakartaSans(
            fontSize: 15.5,
            fontWeight: FontWeight.w700,
            color: const Color(0xFF0F172A),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          'Kỹ sư Công nghệ phần mềm chuyên sâu Flutter, Dart và xây dựng ứng dụng di động hiệu năng cao với kiến trúc Clean Architecture & tối ưu giao diện người dùng.',
          style: GoogleFonts.plusJakartaSans(
            fontSize: 12,
            height: 1.45,
            fontWeight: FontWeight.w400,
            color: const Color(0xFF64748B),
          ),
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}

// -------------------------------------------------------------
// Skills & Expertise Section
// -------------------------------------------------------------
class _SkillsSection extends StatelessWidget {
  const _SkillsSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Skills & Expertise',
          style: GoogleFonts.plusJakartaSans(
            fontSize: 15.5,
            fontWeight: FontWeight.w700,
            color: const Color(0xFF0F172A),
          ),
        ),
        const SizedBox(height: 7),
        Wrap(
          spacing: 7,
          runSpacing: 7,
          children: const [
            _SkillChip(
              label: 'Flutter',
              icon: Icons.draw_rounded,
              backgroundColor: Color(0xFFE0F2FE),
              foregroundColor: Color(0xFF0284C7),
            ),
            _SkillChip(
              label: 'Dart',
              icon: Icons.code_rounded,
              backgroundColor: Color(0xFFDCFCE7),
              foregroundColor: Color(0xFF16A34A),
            ),
            _SkillChip(
              label: 'Clean Arch',
              icon: Icons.layers_outlined,
              backgroundColor: Color(0xFFFFE4E6),
              foregroundColor: Color(0xFFE11D48),
            ),
            _SkillChip(
              label: 'UI/UX',
              icon: Icons.local_offer_outlined,
              backgroundColor: Color(0xFFF3E8FF),
              foregroundColor: Color(0xFF9333EA),
            ),
            _SkillChip(
              label: 'Firebase',
              icon: Icons.local_fire_department_rounded,
              backgroundColor: Color(0xFFFEF3C7),
              foregroundColor: Color(0xFFD97706),
            ),
          ],
        ),
      ],
    );
  }
}

class _SkillChip extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color backgroundColor;
  final Color foregroundColor;

  const _SkillChip({
    required this.label,
    required this.icon,
    required this.backgroundColor,
    required this.foregroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 5.5),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: foregroundColor),
          const SizedBox(width: 5),
          Text(
            label,
            style: GoogleFonts.plusJakartaSans(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: foregroundColor,
            ),
          ),
        ],
      ),
    );
  }
}

// -------------------------------------------------------------
// Featured Projects Section
// -------------------------------------------------------------
class _FeaturedProjectsSection extends StatelessWidget {
  const _FeaturedProjectsSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Featured Projects',
          style: GoogleFonts.plusJakartaSans(
            fontSize: 15.5,
            fontWeight: FontWeight.w700,
            color: const Color(0xFF0F172A),
          ),
        ),
        const SizedBox(height: 7),
        Row(
          children: const [
            Expanded(
              child: _ProjectCard(
                imageAssetPath: 'assets/images/eshop.jpg',
                fallbackGradient: [Color(0xFF1E293B), Color(0xFF0F172A)],
                fallbackIcon: Icons.shopping_cart_outlined,
                title: 'E-Shop Flutter',
                subtitle: 'Mobile App • 2026',
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: _ProjectCard(
                imageAssetPath: 'assets/images/crypto.jpg',
                fallbackGradient: [Color(0xFF8B5CF6), Color(0xFFEC4899)],
                fallbackIcon: Icons.account_balance_wallet_outlined,
                title: 'Crypto Vault',
                subtitle: 'Finance • Clean Arch',
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _ProjectCard extends StatelessWidget {
  final String imageAssetPath;
  final List<Color> fallbackGradient;
  final IconData fallbackIcon;
  final String title;
  final String subtitle;

  const _ProjectCard({
    required this.imageAssetPath,
    required this.fallbackGradient,
    required this.fallbackIcon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xFFE2E8F0).withValues(alpha: 0.7),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF0F172A).withValues(alpha: 0.03),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
            child: SizedBox(
              height: 64,
              width: double.infinity,
              child: Image.asset(
                imageAssetPath,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: fallbackGradient,
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: Center(
                      child: Icon(
                        fallbackIcon,
                        color: Colors.white,
                        size: 22,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 12.5,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF0F172A),
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 10.5,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF94A3B8),
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// -------------------------------------------------------------
// Contact Information Card (Email & Phone)
// -------------------------------------------------------------
class _ContactInformationCard extends StatelessWidget {
  const _ContactInformationCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: const Color(0xFFE2E8F0).withValues(alpha: 0.7),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF0F172A).withValues(alpha: 0.03),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildItem(
            context,
            icon: Icons.alternate_email_rounded,
            title: 'Contact Information',
            isHeader: true,
            onTap: () {},
          ),
          const Divider(
            height: 1,
            indent: 48,
            endIndent: 12,
            color: Color(0xFFF1F5F9),
          ),
          _buildItem(
            context,
            icon: Icons.mail_outline_rounded,
            title: 'Hoangtv3108@gmail.com',
            onTap: () {
              Clipboard.setData(
                const ClipboardData(text: 'Hoangtv3108@gmail.com'),
              );
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Đã sao chép email!'),
                  duration: Duration(milliseconds: 800),
                ),
              );
            },
          ),
          const Divider(
            height: 1,
            indent: 48,
            endIndent: 12,
            color: Color(0xFFF1F5F9),
          ),
          _buildItem(
            context,
            icon: Icons.phone_outlined,
            title: '0946506675',
            onTap: () {
              Clipboard.setData(
                const ClipboardData(text: '0946506675'),
              );
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Đã sao chép số điện thoại!'),
                  duration: Duration(milliseconds: 800),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    bool isHeader = false,
    required VoidCallback onTap,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(18),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Row(
            children: [
              Container(
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                  color: const Color(0xFFF8FAFC),
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: const Color(0xFFE2E8F0).withValues(alpha: 0.6),
                    width: 1,
                  ),
                ),
                child: Icon(
                  icon,
                  size: 14,
                  color: const Color(0xFF475569),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  title,
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 13,
                    fontWeight: isHeader ? FontWeight.w700 : FontWeight.w500,
                    color: isHeader
                        ? const Color(0xFF0F172A)
                        : const Color(0xFF475569),
                  ),
                ),
              ),
              const Icon(
                Icons.chevron_right_rounded,
                size: 18,
                color: Color(0xFF94A3B8),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
