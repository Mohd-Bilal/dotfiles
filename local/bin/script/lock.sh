#!/bin/bash

# images=(/home/bilal/Photos/WallPapers/1920x1080/soldier_helmet_art_123765_1920x1080.jpg)
# swaylock_args=()

# for output in $(swaymsg -t get_outputs | jq -r '.[] .name'); do
#   image=$(mktemp --suffix=.png)
#   images+=($image)
#   swaylock_args+=(-i $output:$image)
#   grim -o $output $image
# done

# # printf '%s\n' "${images[@]}" | xargs -P 0 -I{} convert -blur 0x8 {} {}
# corrupter -mag 2 -boffset 35 ${images[@]} ${images[@]}


# swaylock ${swaylock_args[@]} -s center
# rm ${images[@]}

swaylock -i /home/bilal/Photos/WallPapers/1920x1080/autumn_benches_table_128676_1920x1080.jpg
