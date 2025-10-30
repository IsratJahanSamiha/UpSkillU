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
        backgroundColor: const Color(0xFFA5A6F6),
      ),
      body: SingleChildScrollView( // 👈 allows scrolling when list grows
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 🔹 Input fields
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Name'),
                validator: (value) =>
                value == null || value.trim().isEmpty ? 'Name is required' : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) return 'Email is required';
                  if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) return 'Enter a valid email';
                  return null;
                },
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _messageController,
                decoration: const InputDecoration(labelText: 'Message'),
                maxLines: 4,
                validator: (value) =>
                value == null || value.trim().isEmpty ? 'Message cannot be empty' : null,
              ),
              const SizedBox(height: 20),

              // 🔹 Submit Button
              provider.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    provider.submitFeedback(
                      _nameController.text,
                      _emailController.text,
                      _messageController.text,
                    );

                    // Clear text fields after submission
                    _nameController.clear();
                    _emailController.clear();
                    _messageController.clear();
                  }
                },
                child: const Text('Submit Feedback'),
              ),

              const SizedBox(height: 20),

              // 🔹 Response message
              if (provider.responseMessage.isNotEmpty)
                Center(
                  child: Text(
                    provider.responseMessage,
                    style: TextStyle(
                      color: provider.responseMessage.contains('successfully')
                          ? Colors.green
                          : Colors.red,
                    ),
                  ),
                ),

              const SizedBox(height: 30),

              // 🔹 Feedback List
              const Text(
                'Previous Feedbacks',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              provider.feedbackList.isEmpty
                  ? const Text(
                'No feedback yet',
                style: TextStyle(color: Colors.grey, fontSize: 16),
              )
                  : ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: provider.feedbackList.length,
                itemBuilder: (context, index) {
                  final feedback = provider.feedbackList[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    child: ListTile(
                      leading: const Icon(Icons.person, color: Color(0xFFA5A6F6)),
                      title: Text(feedback['name'] ?? ''),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(feedback['email'] ?? ''),
                          const SizedBox(height: 4),
                          Text(feedback['message'] ?? ''),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
