Audio-Synthesis-with-Fourier-Series-using-MATLAB
This repository can be used to generate Audio Waves or signals with the  concept of Fourier Series. 

Audio synthesis is a fundamental aspect of music production, sound design, and multimedia applications, involving the creation of complex sound waves from simpler components. Among the various techniques available, Fourier series analysis and synthesis stand as a cornerstone in understanding and generating a wide array of audio signals. The Fourier series provides a powerful mathematical framework for decomposing periodic waveforms into their constituent harmonic components, allowing for an insightful exploration of sound structure. This paper aims to delve into the principles, methodologies, and applications of audio synthesis through Fourier series, highlighting its significance in capturing the essence of diverse sounds and shaping the sonic landscape. By examining both the theoretical foundations and practical implementations, this study sheds light on the enduring relevance of Fourier-based audio synthesis techniques.
The methodology of audio synthesis using Fourier series involves a systematic process of decomposing complex audio signals into their constituent sinusoidal components and subsequently reconstructing the original waveform. This process enables the generation of a wide range of sounds, from musical instruments to environmental noises, through the manipulation of harmonics and spectral content. The following steps outline the methodology:
Additive synthesis is a technique used in audio synthesis that involves the creation of complex sounds by adding together multiple sine wave components, each with different frequencies, amplitudes, and phases. It is based on the concept that any periodic waveform can be approximated by summing a series of sine waves at harmonic frequencies. Additive synthesis allows for a high degree of control over the harmonic content and timbre of the resulting sound.Here are some key aspects and characteristics of additive synthesis:

1.Harmonics and Partials: In additive synthesis, each individual sine wave is referred to as a "harmonic" or "partial.“ The fundamental frequency (the lowest frequency component) defines the pitch of the sound, while its harmonics are integer multiples of the fundamental frequency.

2.Timbral Control: Additive synthesis offers precise control over the timbral qualities of a sound. By adjusting the frequencies, amplitudes, and phases of the harmonic components, a wide variety of timbres can be achieved. Timbral changes can be applied in real-time, allowing for dynamic sound manipulation and evolving textures.

3.Complex Sounds: Additive synthesis is capable of recreating a wide range of sounds, including musical instruments, vocal tones, and synthetic textures.Complex and evolving sounds that are challenging to produce using other synthesis methods can be easily generated using additive synthesis.
Audio synthesis using Fourier series has numerous applications across various fields, from music production and sound design to scientific research and multimedia production. Here are some notable applications:

i.Music Production:
Sound Design 
Instrument Emulation

ii.Electronic Music:
Synthesizer Design
Experimental Sounds

Iii.Education and Research:
Sound Analysis
Teaching Tool

iv.Film and Game Audio:
Soundtracks:
Interactive Audio
v.Multimedia Production:
Virtual Reality (VR) and Augmented Reality (AR) Interactive Installations


# Audio-Synthesis-with-Fourier-Series-using-MATLAB
% Parameters
sampling_rate = 44100; % Hz
duration = 3; % seconds
notes = [448 565 789 990] 
% Frequencies of C4 to A4

% Initialize the synthesized waveform
t = linspace(0, duration, duration * sampling_rate);
synthesized_waveform = zeros(size(t));

% Synthesize each note
for i = 1:length(notes)
    frequency = notes(i);
    amplitude = 0.5; % Adjust amplitude as needed
    note_waveform = amplitude * sin(2 * pi * frequency * t);
    synthesized_waveform = synthesized_waveform + note_waveform;
end

% Normalize the waveform
synthesized_waveform = synthesized_waveform / max(abs(synthesized_waveform));

% Play the synthesized waveform
sound(synthesized_waveform, sampling_rate);

% Plot the waveform
subplot(2,1,1)
plot(t, synthesized_waveform,'g');
title('Synthesized Music Signal in Time Domain');
axis([0 1 -1 1])
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

% Frequency domain analysis
nfft = 2^nextpow2(length(synthesized_waveform)); 
% Next power of 2 for better FFT performance
frequencies = sampling_rate/2 * linspace(0, 1, nfft/2 + 1); 
% Compute the single-sided amplitude spectrum
speech_fft = fft(synthesized_waveform, nfft);
amplitude_spectrum = 2 * abs(speech_fft(1:nfft/2 + 1));
% Plot the speech signal in the frequency domain

subplot(2,1,2)
plot(frequencies, amplitude_spectrum,'r');
axis([0 1000 0 20000])
xlabel('Frequency (Hz)');
ylabel('Amplitude');
title('Synthesized signal in Frequency Domain');
