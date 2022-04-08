#!/bin/bash

config="/toker/hassio/config"
themes="$config/themes"
toker="$config/toker"
bak="$config/bak.themes"
helper="$toker/helper-themes.yaml"

cd $themes

echo -e "name: Theme\nicon: mdi:format-paint\noptions:" > $helper

exclude=(
  animated-weather-card
  caule-images
  )

do_themes () {
  for d in */
  do
    d=${d//\//}
    if [[ ! ${exclude[@]} =~ $d ]]
    then
      for i in ./$d/*.yaml
      do
        sed -i '/^#.*/d;/^-.*/d' $i
        sed -i '1!b;s/_/ /g' $i
        sed -i -r '1!b;s/\b(.)/\u\1/g' $i
        head -1 $i | sed 's/^/  - /g;s/:$//g'
        head -1 $i | sed 's/^/  - /g;s/:$//g' >> $helper
        #sed '/^#.*/d;/^-.*/d' $i | head -1 | sed 's/^/  - /g;s/:$//g' >> $helper
      done
    fi
  done

  for i in ./*.yaml
  do
    sed -i '/^#.*/d;/^-.*/d' $i
    head -1 $i | sed 's/^/  - /g;s/:$//g'
    head -1 $i | sed 's/^/  - /g;s/:$//g' >> $helper
  done

  #docker exec hassio python -m homeassistant --script check_config --config /config

}

do_themes | lolcat
