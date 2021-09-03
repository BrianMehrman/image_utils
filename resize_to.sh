#! /bin/bash

# this script takes a properties files that describes the input image
# and the sizes to convert the images too. The output prefix can be
# defined there too but is not required. The output files will use
# the name of the input file as default.

. $1
IFS=$'\n' read -d '' -r -a formats < "${formats_path}"
for format in "${formats[@]}"; do
  echo "converting ${input_name}.${input_ext} to ${format} as ${output_name}-${format}.${output_ext}"
  convert "${input_name}.${input_ext}" -resize $format^ \
                  -gravity Center  \
                  -extent $format  \
          "${output_name}-${format}.${output_ext}"
done;


