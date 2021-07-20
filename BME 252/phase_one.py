import numpy as np
import matplotlib.pyplot as plt
import simpleaudio as sa
from scipy.io.wavfile import read, write
from scipy import signal
from scipy.signal import resample, sosfilt, butter

basePath = "C:/Users/User/Desktop/School/2B/BME 252/Project Phase 1/"
fileNames = ["Single Female.wav",
             "Single Male.wav",
             "Dual Male Female.wav",
             "Coffee Shop.wav"]




# Task 4 - Function for designing a bandpass filter
def bandpass(signal, fs, fLow, fHigh, order):
    ''' Applies a bandpass filter to a signal and returns the filtered signal
    Args:
        signal: signal to filter
        fs: sampling frequency
        fLow: lower cutoff frequency
        fHigh: higher cutoff frequency
        order: order of filter
    '''
    nyq = fs * 0.5
    low = fLow / nyq
    high = fHigh / nyq
    #b, a = butter(order, [low, high], 'bandpass', analog=False)
    sos = butter(order, [low, high], 'bandpass', analog=False, output='sos')
    return sosfilt(sos, signal)
    
# Task 5 - Function to filter the sounds 
def filter(signal, fs, fLow, fHigh, order):
    return bandpass(signal, fs, fLow, fHigh, order)




def analyze (path, fileName):
    # Read the file as an array
    file = read(path + fileName)
    # print(f"\nFile name: {fileName}")

    # 3.1 - Get the sampling rate (44100)
    samplingRate = file[0]
    # print(f"Sampling rate: {samplingRate}")

    # Convert to numpy array
    arr = np.array(file[1])

    # 3.2 - Combine to mono if stereo (nChannels == 2)
    nChannels = len(arr[0])
    # print(f"# Channels: {nChannels}")
    if nChannels > 1:
        arr = np.sum(arr, axis = 1)

    # Scale and cast array to int16 so it's playable as a .wav file
    arr = np.int16(arr/np.max(np.abs(arr)) * 32767)
    # print(f"Sample length: {len(arr)}")
    # print(f"Data type: {type(arr[0])}")

    ''' # Temporarily disabled
    # 3.3 - Play numpy array as audio
    play = sa.play_buffer(arr, 1, 2, samplingRate)
    play.wait_done()
    '''

    ''' # Temporarily disabled
    # 3.4 - Write the mono waveform to file
    write(f'{fileName}_mono.wav', samplingRate, arr)
    '''

    ''' # Temporarily disabled
    # 3.5 - Plot waveform as a function of the sample number
    plt.plot(arr)
    plt.xlabel("Sample Number")
    plt.ylabel("Amplitude")
    plt.show()
    '''

    # 3.6 - Downsample to 16 kHz if input sampling rate is higher
    if samplingRate < 16000:
        raise ValueError("Sampling rate too low (< 16 kHz)")
    elif samplingRate > 16000:
        arr = resample(arr, int(len(arr) / samplingRate * 16000))
    # print(f"Downsampled length: {len(arr)}")

    ''' # Temporarily disabled
    # 3.7 - Generate cosine function
    x = np.linspace(0, len(arr)-1, len(arr))
    y = np.cos(np.pi / 8 * x)   # 1 cycle / 16 points = 1000 cycles / 16000 points = 1000 cycles / second = 1 kHz 
    '''

    ''' # Temporarily disabled
    # Play sound generated by the cosine waveform
    cos_play = sa.play_buffer(arr, 1, 2, samplingRate)
    cos_play.wait_done()
    '''

    ''' # Temporarily disabled
    # Plot 2 cycles of the waveform as a function of time
    t = np.linspace(0, 2, 32)
    plt.plot(t, y[:32])
    plt.xlabel("Time (ms)")
    plt.ylabel("Amplitude")
    plt.show()
    '''




    # Task 6 - Function to plot the filtered signal
    time = np.linspace(0, len(arr)-1, len(arr))
    plt.plot(time, filter(arr, samplingRate, 100.0, 8000.0, 5))
    plt.title('Signal for: ' + fileName)
    plt.xlabel('Time (ms)')
    plt.ylabel('Amplitude')
    plt.show()



# analyze(basePath, fileNames[0])
for fileName in fileNames:
    analyze(basePath, fileName)