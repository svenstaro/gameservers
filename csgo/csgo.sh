#!/bin/bash
mkdir tmp && cd tmp
wget http://media.steampowered.com/installer/steamcmd_linux.tar.gz
wget http://gfx.esl.eu/media/eu/csgo/downloads/configs/csgo_esl_serverconfig.zip
tar xf steamcmd_linux.tar.gz
unzip csgo_esl_serverconfig.zip

cd ..
tmp/steamcmd.sh +login anonymous +force_install_dir ../csgoserver +app_update 740 validate +quit
csgoserver/srcds_run -game csgo -console -usercon +game_type 0 +game_mode 1 +mapgroup mg_active +map de_dust2
