
file=short_teaser
root_path=.
path=${root_path}/${file}.mp4
out_path=${root_path}/${file}_c.mp4

ffmpeg -i $path -vcodec libx264 -crf 30 $out_path
# ffmpeg -i $path -vcodec libx264 -crf 30 -vf scale=1000:500 $out_path


# print the orignal size for both   
ls -lh $path
ls -lh $out_path
# remove the original file
# rm $path
mv $out_path $path