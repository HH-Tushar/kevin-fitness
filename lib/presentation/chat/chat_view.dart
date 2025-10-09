import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
// Note: These libraries must be added to your pubspec.yaml for the final application:
// flutter_markdown, http
// flutter_screenutil has been removed.
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:http/http.dart' as http;
import 'package:kenvinorellana/application/auth/auth_controller.dart';
import 'package:kenvinorellana/common/colors.dart';
import 'package:kenvinorellana/common/gaps.dart';
import 'package:provider/provider.dart';

import '../../application/chat/repo.dart';
import '../../env.dart';

// -----------------------------------------------------------------------------
// --- 1. API Service Placeholders
// -----------------------------------------------------------------------------

/// Custom exception for detailed error reporting.
class ApiException implements Exception {
  final String message;
  final int statusCode;
  const ApiException({required this.message, required this.statusCode});

  @override
  String toString() => 'ApiException: $message (Status: $statusCode)';
}

// Helper extension for mock stream delay
extension StreamDelay<T> on Stream<T> {
  Stream<T> delay(Duration duration) async* {
    await for (final item in this) {
      await Future.delayed(duration);
      yield item;
    }
  }
}

// -----------------------------------------------------------------------------
// --- 2. Message Model
// -----------------------------------------------------------------------------

class ChatMessage {
  final String text;
  final bool isUser;
  final bool isStreaming;
  const ChatMessage({
    required this.text,
    required this.isUser,
    this.isStreaming = false,
  });
}

// -----------------------------------------------------------------------------
// --- 3. Main Chat Screen (StatefulWidget)
// -----------------------------------------------------------------------------

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _inputController = TextEditingController();
  final String _sessionId = DateTime.now().millisecondsSinceEpoch.toString();

  List<ChatMessage> _messages = [];

  bool _isStreaming = false;

  @override
  void dispose() {
    _inputController.dispose();
    super.dispose();
  }

  void _sendMessage(String text) async {
    final trimmedText = text.trim();
    if (trimmedText.isEmpty || _isStreaming) return;

    // 1. Add user message
    setState(() {
      _messages.add(ChatMessage(text: trimmedText, isUser: true));
      _inputController.clear();
      _isStreaming = true;
    });

    // 2. Add streaming placeholder
    setState(() {
      _messages.add(
        const ChatMessage(text: '', isUser: false, isStreaming: true),
      );
    });

    String streamedResponse = '';

    try {
      // 3. Start streaming and update state on each chunk
      await for (final chunk in ChatRepo.chatAiStream(
        message: trimmedText,
        sessionId: _sessionId,
      )) {
        streamedResponse += chunk;

        // Update the streaming message by replacing the last element
        setState(() {
          _messages[_messages.length - 1] = ChatMessage(
            text: streamedResponse,
            isUser: false,
            isStreaming: true,
          );
        });
      }

      // 4. Finalize the message (remove streaming flag)
      setState(() {
        _messages[_messages.length - 1] = ChatMessage(
          text: streamedResponse,
          isUser: false,
          isStreaming: false,
        );
        _isStreaming = false;
      });
    } catch (e) {
      // 5. Handle error
      String errorMessage = e.toString();
      if (e is ApiException) {
        errorMessage = 'API Error (Status ${e.statusCode}): ${e.message}';
      } else {
        errorMessage = 'Unknown Error: ${e.toString()}';
      }

      // Replace the streaming message with the error message
      if (_messages.isNotEmpty && _messages.last.isStreaming) {
        setState(() {
          _messages[_messages.length - 1] = ChatMessage(
            text: 'Sorry, I encountered an error:\n\n>$errorMessage',
            isUser: false,
            isStreaming: false,
          );
          _isStreaming = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // Get screen size for dynamic sizing without ScreenUtil
    // final screenWidth = MediaQuery.of(context).size.width;
    // final screenHeight = MediaQuery.of(context).size.height;

    final isInitialState = _messages.length <= 1;

    return Scaffold(
      backgroundColor: const Color(0xFF263133), // Dark background color
      body: SafeArea(
        child: Column(
          children: [
            Column(
              children: [
                const Text(
                  'KEVIN ORELLANA',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    // Fixed font size (was 28.sp)
                    fontSize: 28.0,
                    fontFamily: 'Outfit',
                    // fontWeight: FontWeight.w700,
                    letterSpacing: 2.0,
                  ),
                ),
                // Fixed spacing (was 8.h)
                const SizedBox(height: 8.0),
                const Text(
                  'HEALTH & FITNESS AI',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    // Fixed font size (was 13.sp)
                    fontSize: 13.0,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                    letterSpacing: 2.9,
                  ),
                ),
              ],
            ),

            // Chat area or prompt
            Expanded(
              child: isInitialState && _messages.length <= 1
                  ? _InitialPrompt()
                  : _ChatArea(messages: _messages),
            ),

            // Message input bar
            _ChatInputBar(
              controller: _inputController,
              onSend: _sendMessage,
              isStreaming: _isStreaming,
            ),
            vPad5,
          ],
        ),
      ),
    );
  }
}

// -----------------------------------------------------------------------------
// --- 4. Presentation Components
// -----------------------------------------------------------------------------

class _ChatBubble extends StatelessWidget {
  final ChatMessage message;
  const _ChatBubble({required this.message});

  @override
  Widget build(BuildContext context) {
    final isUser = message.isUser;
    final isStreaming = message.isStreaming;
    // Get screen width for proportional sizing
    final screenWidth = MediaQuery.of(context).size.width;

    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        constraints: BoxConstraints(maxWidth: screenWidth * 0.7),

        margin: const EdgeInsets.symmetric(vertical: 4.0),

        padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 10.0),
        decoration: BoxDecoration(
          color: isUser ? Colors.white : const Color(0xFF343F41),

          border: Border.all(color: const Color(0xFF767781), width: 1.0),

          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: isUser
                  ? Text(
                      message.text,
                      style: TextStyle(
                        color: Colors.black,
                        // Fixed font size (was 14.sp)
                        fontSize: 14.0,
                        fontFamily: 'Outfit',
                        fontWeight: FontWeight.w400,
                        height: 1.4,
                      ),
                    )
                  : MarkdownBody(
                      data: message.text.isEmpty && isStreaming
                          ? 'Ai is typing...' // Show a minimal indicator if text hasn't started
                          : message.text,
                      styleSheet:
                          MarkdownStyleSheet.fromTheme(
                            Theme.of(context),
                          ).copyWith(
                            // Customize AI text appearance (Markdown)
                            p: const TextStyle(
                              color: Colors.white,
                              // Fixed font size (was 14.sp)
                              fontSize: 14.0,
                              fontFamily: 'Outfit',
                              fontWeight: FontWeight.w400,
                              height: 1.4,
                            ),
                            strong: const TextStyle(
                              color: Colors.white,
                              // Fixed font size (was 14.sp)
                              fontSize: 14.0,
                              fontFamily: 'Outfit',
                              fontWeight: FontWeight.w700,
                              height: 1.4,
                            ),
                            code: const TextStyle(
                              color: Color(0xFFA0A0A6),
                              // Fixed font size (was 13.sp)
                              fontSize: 13.0,
                              fontFamily: 'monospace',
                              fontWeight: FontWeight.w400,
                              backgroundColor: Color(0xFF3A4646),
                            ),
                            codeblockDecoration: BoxDecoration(
                              color: const Color(0xFF3A4646),
                              // Fixed radius (was 4.r)
                              borderRadius: BorderRadius.circular(4.0),
                              border: Border.all(
                                color: const Color(0xFF767781),
                                width: 1,
                              ),
                            ),
                            // Fixed font sizes for other styles (was 18.sp, 14.sp)
                            h1: const TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w700,
                            ),
                            listBullet: const TextStyle(
                              color: Colors.white,
                              fontSize: 14.0,
                              height: 1.4,
                            ),
                            blockquote: const TextStyle(
                              color: Colors.white70,
                              fontSize: 14.0,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                      shrinkWrap: true,
                      softLineBreak: true,
                      fitContent: true,
                    ),
            ),
            if (isStreaming && message.text.isNotEmpty) ...[
              // Fixed spacing (was 8.w)
              const SizedBox(width: 8.0),
              SizedBox(
                // Fixed dimensions (was 12.w, 12.h)
                width: 12.0,
                height: 12.0,
                child: const CircularProgressIndicator(
                  // Fixed stroke width (was 2.w)
                  strokeWidth: 2.0,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _ChatInputBar extends StatelessWidget {
  final TextEditingController controller;
  final void Function(String) onSend;
  final bool isStreaming;

  const _ChatInputBar({
    required this.controller,
    required this.onSend,
    required this.isStreaming,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: defaultPadding),
      height: 48.0,
      decoration: BoxDecoration(
        color: const Color(0xFF3A4646),
        // Fixed radius (was 20.r)
        borderRadius: BorderRadius.circular(12),
        // Fixed border width (was 1.w)
        border: Border.all(
          color: const Color(0xFF767781).withOpacity(0.5),
          width: 1.0,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0x33000000),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              // Fixed padding (was 20.w, 8.w)
              padding: const EdgeInsets.only(left: 20.0, right: 8.0),
              child: TextField(
                minLines: 1,
                maxLines: 3,
                controller: controller,
                enabled: !isStreaming,
                style: TextStyle(
                  color: isStreaming
                      ? Colors.white.withOpacity(0.5)
                      : Colors.white,
                  // Fixed font size (was 13.sp)
                  fontSize: 13.0,
                  fontFamily: 'Outfit',
                  fontWeight: FontWeight.w400,
                  height: 1.20,
                ),
                decoration: InputDecoration(
                  hintText: isStreaming ? 'AI is typing...' : 'Send Message',
                  hintStyle: TextStyle(
                    color: isStreaming
                        ? Colors.white.withOpacity(0.5)
                        : Colors.white70,
                    // Fixed font size (was 13.sp)
                    fontSize: 13.0,
                    fontFamily: 'Outfit',
                    fontWeight: FontWeight.w400,
                    height: 1.20,
                  ),
                  border: InputBorder.none,
                  isDense: true,
                  contentPadding: EdgeInsets.zero,
                ),
                onSubmitted: isStreaming ? null : onSend,
              ),
            ),
          ),
          IconButton(
            onPressed: isStreaming ? null : () => onSend(controller.text),
            icon: Icon(
              Icons.send_rounded,
              color: isStreaming ? Colors.white.withOpacity(0.3) : customWhite,
              // Fixed size (was 22.sp)
              size: 24.0,
            ),
          ),
        ],
      ),
    );
  }
}

class _ChatArea extends StatefulWidget {
  final List<ChatMessage> messages;
  const _ChatArea({required this.messages});
  @override
  State<_ChatArea> createState() => _ChatAreaState();
}

class _ChatAreaState extends State<_ChatArea> {
  final _scrollController = ScrollController();

  @override
  void didUpdateWidget(covariant _ChatArea oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.messages.length != oldWidget.messages.length ||
        (widget.messages.isNotEmpty && oldWidget.messages.isNotEmpty)) {
      _scrollToBottom();
    }
  }

  // FIX: Added an asynchronous delay before calling addPostFrameCallback
  void _scrollToBottom() async {
    await Future.delayed(const Duration(milliseconds: 10));

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      // Fixed padding (was 16.w, 12.h)
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
      child: ListView.separated(
        controller: _scrollController,
        // Fixed padding (was 12.h)
        padding: const EdgeInsets.only(top: 12.0, bottom: 12.0),
        itemCount: widget.messages.length,
        // Fixed spacing (was 18.h)
        separatorBuilder: (_, __) => const SizedBox(height: 18.0),
        itemBuilder: (context, i) => _ChatBubble(message: widget.messages[i]),
      ),
    );
  }
}

// Initial prompt screen widget
class _InitialPrompt extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      // Fixed padding (was 40.w)
      padding: const EdgeInsets.symmetric(horizontal: 40.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Fixed size (was 48.sp)
          const Icon(
            Icons.monitor_heart_outlined,
            color: Color(0xFF00E5FF),
            size: 48.0,
          ),
          // Fixed spacing (was 16.h)
          const SizedBox(height: 16.0),
          const Text(
            'Start Talking with your\nfitness partner',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              // Fixed font size (was 30.sp)
              fontSize: 30.0,
              fontFamily: 'Outfit',
              fontWeight: FontWeight.w500,
              height: 1.25,
            ),
          ),
          // Fixed spacing (was 8.h)
          const SizedBox(height: 8.0),
          const Text(
            'Ask anything about your health, fitness, or diet!',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white70,
              // Fixed font size (was 16.sp)
              fontSize: 16.0,
              fontFamily: 'Outfit',
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
