import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../component/icon_plus_text_widget.dart';

// 1. Data Model for better reusability
class Organization {
  final String name;
  final String location;
  final String website;
  final String coverImagePath;
  final String logoPath;

  const Organization({
    required this.name,
    required this.location,
    required this.website,
    required this.coverImagePath,
    required this.logoPath,
  });
}

class OrgDetailScreen extends StatelessWidget {
  // 3. Pass data via constructor
  final Organization org;

  const OrgDetailScreen({super.key, required this.org});

  @override
  Widget build(BuildContext context) {
    // Define reusable colors or pull from Theme
    const Color borderColor = Color(0XFFEAECF0);
    const Color subtextColor = Color(0xFF475467);

    return Scaffold(
      appBar: AppBar(
        // 2. Functional back button
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: SingleChildScrollView(
        // Added scroll view to prevent overflow on small screens
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Cover Image
            AspectRatio(
              aspectRatio: 4 / 3,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  org.coverImagePath,
                  fit: BoxFit.cover, // 4. Better fit
                ),
              ),
            ),
            const SizedBox(height: 24),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Logo
                Container(
                  width: 84,
                  height: 84,
                  padding: const EdgeInsets.all(8),
                  // Add padding for logo
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: borderColor),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Image.asset(org.logoPath, fit: BoxFit.contain),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        org.name,
                        style: Theme.of(context).textTheme.headlineSmall
                            ?.copyWith(fontWeight: FontWeight.bold),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 12),
                      IconPlusTextWidget(
                        icon: Icons.pin_drop_outlined,
                        text: org.location,
                      ),
                      const SizedBox(height: 8),
                      IconPlusTextWidget(
                        icon: SvgPicture.asset(
                          "asset/images/website.svg",
                          colorFilter: const ColorFilter.mode(
                            Color(0XFF98A2B3),
                            BlendMode.srcIn,
                          ),
                          width: 16,
                          height: 16,
                        ),
                        text: org.website,
                        textStyle: const TextStyle(
                          fontSize: 12,
                          color: subtextColor,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            InkWell(
              borderRadius: BorderRadius.circular(24),
              onTap: () {},
              child: Image.asset(
                "asset/images/zakat_tag.png",
                width: 138,
                height: 32,
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              "The Edhi Foundation, established by Abdul Sattar Edhi in 1951, is the largest non-profit social welfare organization in Pakistan, known for its vast humanitarian services. Registered in the USA as a 501(c)(3) tax-exempt organization (Tax ID: 11-3013369), it relies on individual donations to support its work. It operates Pakistan’s most extensive emergency services, including a 24-hour free ambulance service, providing immediate assistance during disasters and emergencies. The foundation also offers shelter for the destitute, orphan care, and free healthcare services across Pakistan. Bilquis Bano Edhi, Abdul Sattar Edhi’s wife, played a crucial role in expanding maternal and child healthcare services. The Edhi Foundation’s Cradle Program saves newborns, while its hospitals, clinics, and rehabilitation centers offer vital medical care. Internationally, Edhi's disaster relief efforts extend to several countries, providing aid to refugees, war victims, and those affected by natural calamities. Led by Faisal and Kubra Edhi, the foundation continues to serve under the motto, "
              "Live and Help Live,"
              " with a mission rooted in non-discriminatory humanitarian aid.",
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
