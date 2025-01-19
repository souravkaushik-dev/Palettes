import 'package:flutter/material.dart';
import 'package:Palettes/settings/screens/account_screen.dart';

class TermsAndConditionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: Text('Terms and Conditions'),
            floating: false,
            pinned: true,
            snap: false,
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const AccountScreen(name: '',)),
                  );
                }
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Introduction',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'Welcome to Palettes . These Terms and Conditions ("Terms") govern your use of our mobile application and services (collectively, the "Service"). By accessing or using the Service, you agree to comply with and be bound by these Terms. If you do not agree with any part of these Terms, you should not use the Service.',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'License',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'We grant you a non-exclusive, non-transferable, revocable license to use the Service for personal, non-commercial purposes, subject to these Terms. You may not copy, modify, distribute, sell, or lease any part of the Service or included content, nor may you reverse engineer or attempt to extract the source code from the Service.',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'Use of Wallhaven API',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'Our Service integrates with the Wallhaven API to provide image content. By using our Service, you agree to comply with Wallhaven’s API Terms of Service and their licensing terms. You acknowledge that we do not own the content provided by the Wallhaven API and that your use of such content is subject to Wallhaven’s terms and conditions.',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'Intellectual Property',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'All intellectual property rights in the Service, including but not limited to copyrights, trademarks, and patents, are owned by us or our licensors. You may not use any of our intellectual property without our prior written consent.',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'User Conduct',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'You agree not to use the Service for any unlawful purpose or in any way that could damage, disable, overburden, or impair the Service. You are responsible for any content you submit and must ensure that it does not violate any laws or third-party rights.',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'Disclaimers and Limitation of Liability',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'The Service is provided "as is" without any warranties or representations, express or implied. We do not warrant that the Service will be uninterrupted or error-free. To the fullest extent permitted by law, we disclaim all liability for any damages arising from your use of the Service.',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'Changes to Terms',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'We may update these Terms from time to time. When we do, we will notify you by posting the new Terms on this page. Your continued use of the Service after any changes constitutes your acceptance of the new Terms.',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'Contact Us',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'If you have any questions about these Terms, please contact us at insta page ("impulze.in").',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
