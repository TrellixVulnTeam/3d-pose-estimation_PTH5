#!/usr/bin/env sh
expID=mpii/mpii_hg8   # snapshots and log file will save in checkpoints/$expID
dataset=mpii          # mpii | mpii-lsp | lsp |
gpuID=0,1             # GPUs visible to program
nGPU=2                # how many GPUs will be used to train the model
batchSize=16          
LR=6.7e-4
netType=hg-prm        # network architecture
nStack=2
nResidual=1
nThreads=4            # how many threads will be used to load data
minusMean=true
nClasses=16
nEpochs=1           
snapshot=10           # save models for every $snapshot

OMP_NUM_THREADS=1 CUDA_VISIBLE_DEVICES=$gpuID th main.lua \
   -dataset $dataset \
   -expID $expID \
   -batchSize $batchSize \
   -nGPU $nGPU \
   -LR $LR \
   -momentum 0.0 \
   -weightDecay 0.0 \
   -netType $netType \
   -nStack $nStack \
   -nResidual $nResidual \
   -nThreads $nThreads \
   -minusMean $minusMean \
   -nClasses $nClasses \
   -nEpochs $nEpochs \
   -snapshot $snapshot \
   # -resume checkpoints/$expID  \  # uncomment this line to resume training
   # -testOnly true \               # uncomment this line to test on validation data
   # -testRelease true \            # uncomment this line to test on test data (MPII dataset)