import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  double _mainVolume = 0.5;
  double _sfxVolume = 0.5;
  String _selectedLanguage = 'English';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0XFF1A1B1E),
        appBar: AppBar(
          backgroundColor: const Color(0XFF1A1B1E),
          title: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset(
                      'lib/images/logo_mcgaming.png',
                      width: 100.0,
                      height: 100.0,
                    ),
                    const SizedBox(width: 10),
                  ],
                ),
                const SizedBox(
                  width: 200.0,
                  height: 40.0,
                  child: TextField(
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                      hintText: "Search something",
                      hintStyle: TextStyle(
                        color: Color(0xffBAB0B0),
                        fontWeight: FontWeight.normal,
                      ),
                      filled: true,
                      fillColor: Color(0xff1A1B1E),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                        borderSide: BorderSide(
                          color: Color(0xffE299FF),
                          width: 1.5,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                        borderSide: BorderSide(
                          color: Color(0xffE299FF),
                          width: 2.0,
                        ),
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(10.0),
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xffE299FF),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xffE299FF),
                    offset: Offset(0, 3),
                    blurRadius: 4.0,
                  ),
                ],
              ),
              height: 2.0,
            ),
          ),
        ),
        body: SafeArea(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, 
              children: [
                const SizedBox(height: 40),
                const Center(
                  child: Text(
                    'SETTINGS',
                    style: TextStyle(
                      color: Color(0xffE399FF),
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0), 
                  child: Text(
                    'Audio',
                    style: TextStyle(
                      color: Color(0xffE399FF),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                VolumeSlider(
                  label: 'Volume',
                  initialVolume: _mainVolume,
                  onVolumeChanged: (volume) {
                    setState(() {
                      _mainVolume = volume;
                    });
                  },
                ),
                const SizedBox(height: 20),
                VolumeSlider(
                  label: 'SFX',
                  initialVolume: _sfxVolume,
                  onVolumeChanged: (volume) {
                    setState(() {
                      _sfxVolume = volume;
                    });
                  },
                ),
                const SizedBox(height: 40),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0), 
                  child: Text(
                    'Language',
                    style: TextStyle(
                      color: Color(0xffE399FF),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Radio<String>(
                              value: 'English',
                              groupValue: _selectedLanguage,
                              onChanged: (value) {
                                setState(() {
                                  _selectedLanguage = value!;
                                });
                              },
                              activeColor: const Color(0xff8A5CF3),
                            ),
                            const Text(
                              'English',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            Radio<String>(
                              value: 'Spanish',
                              groupValue: _selectedLanguage,
                              onChanged: (value) {
                                setState(() {
                                  _selectedLanguage = value!;
                                });
                              },
                              activeColor: const Color(0xff8A5CF3),
                            ),
                            const Text(
                              'Spanish',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            Radio<String>(
                              value: 'French',
                              groupValue: _selectedLanguage,
                              onChanged: (value) {
                                setState(() {
                                  _selectedLanguage = value!;
                                });
                              },
                              activeColor: const Color(0xff8A5CF3),
                            ),
                            const Text(
                              'French',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class VolumeSlider extends StatefulWidget {
  final String label;
  final double initialVolume;
  final ValueChanged<double> onVolumeChanged;

  const VolumeSlider({
    super.key,
    required this.label,
    required this.initialVolume,
    required this.onVolumeChanged,
  });

  @override
  _VolumeSliderState createState() => _VolumeSliderState();
}

class _VolumeSliderState extends State<VolumeSlider> {
  late double _currentVolume;
  bool _isMuted = false;

  @override
  void initState() {
    super.initState();
    _currentVolume = widget.initialVolume;
    _isMuted = _currentVolume == 0.0;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 100,
          child: Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Text(
              widget.label,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.left,
            ),
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Slider(
            value: _isMuted ? 0.0 : _currentVolume,
            min: 0.0,
            max: 1.0,
            divisions: 100,
            label: '${(_isMuted ? 0 : _currentVolume * 100).round()}',
            onChanged: (double value) {
              setState(() {
                _currentVolume = value;
                _isMuted = value == 0.0;
              });
              widget.onVolumeChanged(_currentVolume);
            },
            activeColor: const Color(0xffE399FF),
            inactiveColor: const Color(0xffBAB0B0),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: IconButton(
            icon: Icon(
              _isMuted ? Icons.volume_off : Icons.volume_up,
              color: const Color(0xff8A5CF3),
            ),
            onPressed: () {
              setState(() {
                if (_isMuted) {
                  _isMuted = false;
                  _currentVolume = 0.5;
                } else {
                  _isMuted = true;
                  _currentVolume = 0.0;
                }
                widget.onVolumeChanged(_currentVolume);
              });
            },
          ),
        ),
      ],
    );
  }
}
