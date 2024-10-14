ffmpeg -i cover.mp4 -vf "fps=10,scale=640:-1:flags=lanczos" -c:v gif cover.gif
