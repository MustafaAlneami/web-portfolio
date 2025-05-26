import 'package:flutter/material.dart';
import '../viewmodel/portfolio_viewmodel.dart';
import '../model/contact_message.dart';

class ContactForm extends StatefulWidget {
  final PortfolioViewModel viewModel;
  const ContactForm({super.key, required this.viewModel});

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final _formKey = GlobalKey<FormState>();
  String name = '';
  String email = '';
  String message = '';
  bool isSubmitting = false;
  String? submitResult;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Contact',
            style: Theme.of(
              context,
            ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Name'),
                  onSaved: (v) => name = v ?? '',
                  validator: (v) =>
                      v == null || v.isEmpty ? 'Enter your name' : null,
                ),
                const SizedBox(height: 12),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Email'),
                  onSaved: (v) => email = v ?? '',
                  validator: (v) => v == null || !v.contains('@')
                      ? 'Enter a valid email'
                      : null,
                ),
                const SizedBox(height: 12),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Message'),
                  maxLines: 4,
                  onSaved: (v) => message = v ?? '',
                  validator: (v) =>
                      v == null || v.isEmpty ? 'Enter a message' : null,
                ),
                const SizedBox(height: 16),
                AnimatedOpacity(
                  opacity: isSubmitting ? 0.5 : 1.0,
                  duration: const Duration(milliseconds: 400),
                  child: ElevatedButton(
                    onPressed: isSubmitting
                        ? null
                        : () async {
                            if (_formKey.currentState?.validate() ?? false) {
                              _formKey.currentState?.save();
                              setState(() => isSubmitting = true);
                              try {
                                await widget.viewModel.submitContact(
                                  ContactMessage(
                                    name: name,
                                    email: email,
                                    message: message,
                                  ),
                                );
                                setState(() => submitResult = 'Message sent!');
                              } catch (e) {
                                setState(
                                  () => submitResult = 'Failed to send.',
                                );
                              } finally {
                                setState(() => isSubmitting = false);
                              }
                            }
                          },
                    child: const Text('Send'),
                  ),
                ),
                if (submitResult != null) ...[
                  const SizedBox(height: 8),
                  Text(
                    submitResult!,
                    style: const TextStyle(color: Colors.green),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
