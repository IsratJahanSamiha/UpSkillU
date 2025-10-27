import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'feedback_provider.dart';

class FeedbackPage extends StatefulWidget {
  const FeedbackPage({Key? key}) : super(key: key);

  @override
  State<FeedbackPage> createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FeedbackProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Feedback'),
        backgroundColor: const Color(0xFF008080),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Name is required';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Email is required';
                  }
                  if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                    return 'Enter a valid email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _messageController,
                decoration: const InputDecoration(labelText: 'Message'),
                maxLines: 4,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Message cannot be empty';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              provider.isLoading
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    provider.submitFeedback(
                      _nameController.text,
                      _emailController.text,
                      _messageController.text,
                    );
                  }
                },
                child: const Text('Submit Feedback'),
              ),
              const SizedBox(height: 20),
              if (provider.responseMessage.isNotEmpty)
                Text(
                  provider.responseMessage,
                  style: TextStyle(
                    color: provider.responseMessage.contains('successfully')
                        ? Colors.green
                        : Colors.red,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
