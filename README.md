CMU mocap: Subject 86
=====================

This repository shares the features and matlab scripts for the following tasks:

* [1] "[Video Co-summarization: Video Summarization by Visual Co-occurrence](http://www.cv-foundation.org/openaccess/content_cvpr_2015/papers/Chu_Video_Co-Summarization_Video_2015_CVPR_paper.pdf)", ICCV 15.<br/>
* [2] "[Unsupervised Temporal Commonality Discovery](https://www.ri.cmu.edu/pub_files/2012/10/tcd_final.pdf)", ECCV 12.

More info:

- **Contact**:  Please send comments to Wen-Sheng Chu (wschu@cmu.edu)  
- **Citation**: If you use this code in your paper, please cite either of the following:
```
@InProceedings{chu2015video,
	author = {Chu, Wen-Sheng and Song, Yale and Jaimes, Alejandro},
	title = {Video Co-Summarization: Video Summarization by Visual Co-Occurrence},
	booktitle = {CVPR},
	year = {2015}
}
```
```
@inproceedings{chu2012unsupervised,
	title={Unsupervised temporal commonality discovery},
	author={Chu, Wen-Sheng and Zhou, Feng and {De la Torre}, Fernando},
	booktitle={ECCV},
	year={2012}
}
```

Contents
========

The project tree is organized as follows.

    data/                      directory of pre-computed data for 14 mocap sequences of Subject 86
    func/                      provided Matlab functions 
    README.md                  this file
    demo_cosum_km_pair.m       k-means results of Fig 6 in [1]
    demo_cosum_km_batch.m      k-means results of Sec 4.3 in [1]
    result_km_16-Oct-2014.mat  pre-computed k-means results reported in [1] (should be replicated from demo_cosum_km_batch.m)

Usage
=====

In Matlab shell:

    >> cd mocap
    >> demo_cosum_km_pair

The script has been tested on Windows 8, Ubuntu 3.11.0 and Mac X 10.9.4 without problems. 
Please send your feedbacks to [Wen-Sheng Chu](mailto:wschu@cmu.edu) regarding any issues, bugs and improvements. 

License
=======

The code may be redistributed under BSD license.

