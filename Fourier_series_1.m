% Parameters
sampling_rate = 44100; % Hz
duration = 3; % seconds
notes = input("Enter the frequencies = ") ;
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
