#!/bin/bash

# Function to play audio using gTTS and mpv
play_audio() {

    C:/'Program Files'/Python312/python.exe - <<EOF
from gtts import gTTS
import os

text = "Let's play ${1//+/ }"  # Update this line with your desired text
language = "en"

# Create the gTTS object
tts = gTTS(text=text, lang=language, slow=False)

# Save the audio file
try:
    tts.save("output.mp3")
    print("Audio file saved successfully")
except Exception as e:
    print("Error saving audio file:", e)

# Play the audio file using mpv
try:
    os.system("mpv output.mp3")
except Exception as e:
    print("Error playing audio file:", e)
EOF
}

# Function to replace spaces with '+'
format_song_name() {
  echo "${1// /+}"
}

# Function to transcribe audio, fetch YouTube video URL, and play using mpv
transcribe_and_play() {
  # Update the Vosk model path
  VOSK_MODEL_PATH="C:/Users/HP/Downloads/Speech Model/vosk-model-small-en-in-0.4"

  # Update the audio device name if needed
  AUDIO_DEVICE="Microphone Array (Intel® Smart Sound Technology for Digital Microphones)"

  # Record audio and save to temporary WAV file
  ffmpeg -y -f dshow -i audio="$AUDIO_DEVICE" -acodec pcm_s16le -ac 1 -ar 44100 -t 4 -f wav ./input/tmp.wav

  # Transcribe the audio using Vosk
  vosk-transcriber -m "$VOSK_MODEL_PATH" -i ./input/tmp.wav -o ./output/data.txt

  # Read the transcribed text from the output file
  read audio_input < ./output/data.txt

  # Replace spaces with '+' in the transcribed text
  formatted_song_name="$(format_song_name "$audio_input")"
  echo "$formatted_song_name"
  play_audio $formatted_song_name
  # Fetch the YouTube video URL using yt-dlp
  video_url=$(yt-dlp -f bestaudio --audio-quality 0 --get-url "https://youtu.be/$(curl -s "https://vid.puffyan.us/search?q=$formatted_song_name" | grep -Eo "/watch\?v=.{11}" | head -n 1)")

  # Run mpv with the video URL
  mpv.com "$video_url"
}

# Call the transcribe_and_play function
transcribe_and_play
