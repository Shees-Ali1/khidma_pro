import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waveform_flutter/waveform_flutter.dart'; // Ensure the package is added correctly

class VoiceNoteWidget extends StatefulWidget {
  final String audioUrl;

  const VoiceNoteWidget({super.key, required this.audioUrl});

  @override
  State<VoiceNoteWidget> createState() => _VoiceNoteWidgetState();
}

class _VoiceNoteWidgetState extends State<VoiceNoteWidget> {
  late AudioPlayer _audioPlayer;
  bool _isPlaying = false;
  bool _isLoading = true;
  String? _errorMessage;
  List<int>? _waveformData;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
    _loadAudio();
  }

  Future<void> _loadAudio() async {
    try {
      // Fetch waveform data (Mocked here, replace with actual data generation if needed)
      _waveformData = List.generate(50, (index) => (index * 2) % 20 + 5);

      setState(() {
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _errorMessage = "Failed to load waveform: $e";
        _isLoading = false;
      });
    }
  }

  Future<void> _togglePlayPause() async {
    try {
      if (_isPlaying) {
        await _audioPlayer.pause();
      } else {
        await _audioPlayer.play(UrlSource(widget.audioUrl));
      }

      setState(() {
        _isPlaying = !_isPlaying;
      });
    } catch (e) {
      setState(() {
        _errorMessage = "Error playing audio: $e";
      });
    }
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 14.w),
      height: 50.h,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _errorMessage != null
          ? Center(
        child: Text(
          _errorMessage!,
          style: const TextStyle(color: Colors.red),
          textAlign: TextAlign.center,
        ),
      )
          : Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: Icon(
              _isPlaying
                  ? Icons.pause_circle_filled
                  : Icons.play_circle_fill,
              color: Colors.blue,
              size: 30.h,
            ),
            onPressed: _togglePlayPause,
          ),
          Expanded(
            child: _waveformData == null
                ? const Center(child: CircularProgressIndicator())
                : const Waveform(

            ),
          ),
        ],
      ),
    );
  }
}
