#!/usr/bin/env bash



FFMPEG="/mnt/c/ffmpeg/bin/ffmpeg.exe"

MIC_NAME="Microphone (Realtek Audio)"  # <-- Adjust to match your input device



OUTPUT_WIN="C:\\Users\\$(cmd.exe /c 'echo %USERNAME%' | tr -d '\r')\\Videos\\recording_$(date '+%Y-%m-%d_%H-%M-%S').mkv"



record() {

  # Start recording screen + mic using Windows ffmpeg

  "$FFMPEG" \

    -y \

    -f dshow -i audio="$MIC_NAME" \

    -f gdigrab -framerate 30 -i desktop \

    -c:v libx264 -preset ultrafast -c:a aac \

    "$OUTPUT_WIN" &

  

  echo $! > /tmp/recpid

  echo "Recording started → saved to: $OUTPUT_WIN"

}



end() {

  kill -15 "$(cat /tmp/recpid)" && rm -f /tmp/recpid

  echo "Recording stopped."

}



# Toggle behavior

if [[ -f /tmp/recpid ]]; then

  end

else

  record

fi
