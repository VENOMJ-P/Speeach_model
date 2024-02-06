# Welcome to Speech Recognition Music Player

This Bash script provides a convenient way to transcribe audio, fetch a corresponding YouTube video URL, and play the video using `mpv`.

## Usage

To use this script, simply execute it in a Bash-compatible environment:

```bash
./final.sh

```

## Functions

### `transcribe_and_play`

This function transcribes audio using the Vosk model, fetches the corresponding YouTube video URL, and plays the video using mpv.

## Prerequisites

- ffmpeg : For recording audio and saving to a temporary WAV file.

- vosk-transcriber : For transcribing the audio using the Vosk model. Here you can download models 'https://alphacephei.com/vosk/models'

- yt-dlp : For fetching the YouTube video URL.

- mpv : For playing the video.

Once the script is executed, it will record audio, transcribe it, fetch the corresponding YouTube video URL based on the transcribed text, and finally play the video using mpv.

##### This script relies on third-party services (Vosk, YouTube, etc.) and is provided for educational purposes only. Use it responsibly and ensure compliance with all relevant terms of service.
