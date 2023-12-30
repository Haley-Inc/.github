#!/bin/bash

# https://github.com/Sopel97/Stockfish.git 
# commit d7d4ec211f7ef35ff39fe8aea54623a468b36c7d
# Author: Tomasz Sobczyk <tomasz.sobczyk1997@gmail.com>
# Date:   Fri Nov 13 22:28:28 2020 +0100
# 
#     Fix searching terminal nodes in gensfen.


# ./copy_syzygy.sh
 
DEPTH=5
GAMES=256000000
SEED=$RANDOM
 
options="
uci
setoption name PruneAtShallowDepth value false
setoption name Use NNUE value true
setoption name Threads value 250
setoption name Hash value 10240
setoption name SyzygyPath value /dev/shm/vjoost/3-4-5-6/WDL/:/dev/shm/vjoost/3-4-5-6/DTZ/
isready
gensfen set_recommended_uci_options ensure_quiet random_move_maxply 12 write_minply 12 seed $SEED depth $DEPTH loop $GAMES output_file_name d${DEPTH}_${GAMES}_${SEED}"
 
printf "$options" | ./stockfish
