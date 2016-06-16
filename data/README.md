A brief description of the mocap data folder
=============================================

This directory contains 14 sequences performed by Subject 86 from the [CMU Mocap dataset](http://mocap.cs.cmu.edu/).
For each frame, we computed the quaternions for 14 joints on the body, resulting in a 42-D feature vector that describes the human pose.
The precomputed information for each sequence is stored in individual mat files.
The `mocap_cnames_mapping.mat` file contains the mapping of actions that were merged to remove redundancy in action labels.
In each mat file:

- `X`:         A 42-by-nFrm matrix representing 42-D feature vectors
- `nFrm`:      The number of frames
- `label`:     The ground turth action indicated by cnames (eg, the label "1" in `86_01` indicates "walk")
- `nSeg`:      The number of segments 
- `cnames`:    The annotation of differenct actions which the variable `label` map to
- `segs`:      The begin and (end+1) frame indices of segments (eg, in `86_01` the first segment start from frame 1 and end at frame (115-1))

A visualization toolbox can be found in [Feng's mocgui](https://github.com/zhfe99/mocgui).
