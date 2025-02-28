import 'dart:async';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

import '../consts/colors.dart';


class VoiceNotePlayerUI extends StatefulWidget {
  final String? voiceNoteUrl;

  const VoiceNotePlayerUI({Key? key, required this.voiceNoteUrl}) : super(key: key);

  @override
  State<VoiceNotePlayerUI> createState() => _VoiceNotePlayerUIState();
}

class _VoiceNotePlayerUIState extends State<VoiceNotePlayerUI> with SingleTickerProviderStateMixin {
  late AudioPlayer _audioPlayer;
  late AnimationController _animationController;
  StreamSubscription? _positionSubscription;
  StreamSubscription? _stateSubscription;
  StreamSubscription? _durationSubscription;
  StreamSubscription? _completeSubscription;

  bool _isPlaying = false;
  Duration _currentPosition = Duration.zero;
  Duration _totalDuration = Duration.zero;
  double _playbackSpeed = 1.0;
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300), // Smooth animation for play/pause
    );

    // Initialize audio only if URL is valid
    if (_hasValidVoiceNote()) {
      _initializeAudio();
    }

    // Use streams for efficient state updates
    _setupAudioListeners();
  }

  bool _hasValidVoiceNote() => widget.voiceNoteUrl != null && widget.voiceNoteUrl!.isNotEmpty;

  Future<void> _initializeAudio() async {
    try {
      await _audioPlayer.setSourceUrl(widget.voiceNoteUrl!);
      await _audioPlayer.setPlaybackRate(_playbackSpeed);
      setState(() => _isInitialized = true);
    } catch (e) {
      debugPrint("Error loading audio: $e");
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Failed to load audio!")),
        );
      }
    }
  }

  void _setupAudioListeners() {
    _stateSubscription = _audioPlayer.onPlayerStateChanged.listen((state) {
      if (mounted) {
        setState(() {
          _isPlaying = state == PlayerState.playing;
          if (_isPlaying) {
            _animationController.forward();
          } else {
            _animationController.reverse();
          }
        });
      }
    });

    _positionSubscription = _audioPlayer.onPositionChanged.listen((position) {
      if (mounted) {
        setState(() => _currentPosition = position);
      }
    });

    _durationSubscription = _audioPlayer.onDurationChanged.listen((duration) {
      if (mounted) {
        setState(() => _totalDuration = duration);
      }
    });

    _completeSubscription = _audioPlayer.onPlayerComplete.listen((_) {
      if (mounted) {
        setState(() {
          _isPlaying = false;
          _currentPosition = Duration.zero; // Reset to start on completion
          _animationController.reverse();
        });
      }
    });
  }

  Future<void> _togglePlayPause() async {
    if (!_hasValidVoiceNote()) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("No Voice Note added by customer.")),
        );
      }
      return;
    }

    if (!_isInitialized) {
      await _initializeAudio();
      if (!_isInitialized) return;
    }

    try {
      if (_isPlaying) {
        await _audioPlayer.pause();
      } else {
        if (_currentPosition >= _totalDuration || _currentPosition == Duration.zero) {
          // Logic from your code: stop, reload, and play from start
          await _audioPlayer.stop();
          await _audioPlayer.setSourceUrl(widget.voiceNoteUrl!);
          await _audioPlayer.setPlaybackRate(_playbackSpeed); // Ensure speed is applied
          await _audioPlayer.resume();
        } else {
          await _audioPlayer.resume();
        }
      }
    } catch (e) {
      debugPrint("Error toggling play/pause: $e");
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Failed to play/pause audio!")),
        );
      }
    }
  }

  void _changeSpeed() {
    try {
      _playbackSpeed = _playbackSpeed == 1.0 ? 1.5 : 1.0;
      _audioPlayer.setPlaybackRate(_playbackSpeed);
      if (mounted) setState(() {});
    } catch (e) {
      debugPrint("Error changing playback speed: $e");
    }
  }

  void _seekAudio(double dx, double width) {
    try {
      final double relativePosition = dx / width;
      final newPosition = _totalDuration * relativePosition.clamp(0.0, 1.0);
      _audioPlayer.seek(newPosition);
    } catch (e) {
      debugPrint("Error seeking audio: $e");
    }
  }

  @override
  void didUpdateWidget(covariant VoiceNotePlayerUI oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.voiceNoteUrl != widget.voiceNoteUrl && _hasValidVoiceNote()) {
      _isInitialized = false;
      _currentPosition = Duration.zero;
      _totalDuration = Duration.zero;
      _initializeAudio();
    }
  }

  @override
  void dispose() {
    _positionSubscription?.cancel();
    _stateSubscription?.cancel();
    _durationSubscription?.cancel();
    _completeSubscription?.cancel();
    _animationController.dispose();
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool hasVoiceNote = _hasValidVoiceNote();

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
      decoration: BoxDecoration(
        color: hasVoiceNote ?   skyblue
          : Colors.grey,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildPlayPauseButton(),
          const SizedBox(width: 10),
          if (hasVoiceNote) _buildWaveform(),
          const SizedBox(width: 10),
          if (hasVoiceNote) _buildSpeedButton(),
          if (hasVoiceNote) _buildDurationText(),
        ],
      ),
    );
  }

  Widget _buildPlayPauseButton() {
    return GestureDetector(
      onTap: _togglePlayPause,
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return Container(
            width: 45,
            height: 45,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: Icon(
              _isPlaying ? Icons.pause : Icons.play_arrow,
              color: skyblue,
              size: 28 * _animationController.value + 28 * (1 - _animationController.value),
            ),
          );
        },
      ),
    );
  }

  Widget _buildWaveform() {
    return Expanded(
      child: GestureDetector(
        onHorizontalDragUpdate: (details) {
          final renderBox = context.findRenderObject() as RenderBox?;
          if (renderBox != null) {
            _seekAudio(details.localPosition.dx, renderBox.size.width);
          }
        },
        onTapUp: (details) {
          final renderBox = context.findRenderObject() as RenderBox?;
          if (renderBox != null) {
            _seekAudio(details.localPosition.dx, renderBox.size.width);
          }
        },
        child: SizedBox(
          height: 40,
          child: CustomPaint(
            painter: OptimizedWaveformPainter(_currentPosition, _totalDuration),
            willChange: true,
          ),
        ),
      ),
    );
  }

  Widget _buildSpeedButton() {
    return GestureDetector(
      onTap: _changeSpeed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          "${_playbackSpeed}x",
          style: TextStyle(
            fontSize: 14,
            color: skyblue,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildDurationText() {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Text(
        "${_currentPosition.inSeconds}s/${_totalDuration.inSeconds}s",
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}

class OptimizedWaveformPainter extends CustomPainter {
  final Duration currentPosition;
  final Duration totalDuration;

  OptimizedWaveformPainter(this.currentPosition, this.totalDuration);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 3.0;

    const waveHeight = 20.0;
    const waveSpacing = 4.0;
    final progressFraction =
    totalDuration.inMilliseconds > 0
        ? (currentPosition.inMilliseconds / totalDuration.inMilliseconds).clamp(0.0, 1.0)
        : 0.0;
    final progressX = progressFraction * size.width;

    final int barCount = (size.width / waveSpacing).floor();
    for (int i = 0; i < barCount; i++) {
      final xOffset = i * waveSpacing;
      final barHeight = (i % 2 == 0) ? waveHeight : waveHeight * 0.5;
      paint.color = xOffset <= progressX ? Colors.blue : Colors.white;

      canvas.drawLine(
        Offset(xOffset, size.height / 2 - barHeight / 2),
        Offset(xOffset, size.height / 2 + barHeight / 2),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    if (oldDelegate is OptimizedWaveformPainter) {
      return oldDelegate.currentPosition != currentPosition ||
          oldDelegate.totalDuration != totalDuration;
    }
    return true;
  }
}