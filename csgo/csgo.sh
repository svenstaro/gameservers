#!/bin/bash
mkdir tmp
cd tmp
wget -c -N \
    http://media.steampowered.com/installer/steamcmd_linux.tar.gz \
    http://gfx.esl.eu/media/eu/csgo/downloads/configs/csgo_esl_serverconfig.zip
tar xf steamcmd_linux.tar.gz
unzip -f csgo_esl_serverconfig.zip

cd ..
tmp/steamcmd.sh +login anonymous +force_install_dir ../csgoserver +app_update 740 validate +quit

cd csgoserver
./srcds_run -game csgo -console -usercon +game_type 0 +game_mode 1 \
    +mapgroup mg_active +map de_dust2 -exec ../tmp/esl5on5rl.cfg -tickrate 128 \
    +hostname "Kuschelmatch" sv_password "lol" rcon_password "hunter2"
