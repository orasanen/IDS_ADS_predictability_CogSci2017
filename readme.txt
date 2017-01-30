These MATLAB scripts were used to anaylze predictability of intonation (fundamental frequency, or F0) of infant-directed and adult-directed speech in the following paper: 

"Räsänen, O., Kakouros, S., & Soderstrom, M. (submitted to CogSci-2017): Connecting stimulus-driven attention to the properties of infant-directed speech — Is exaggerated intonation also more surprising?"

Please cite this paper if you use these codes in your own analyses. 

In addition, if you use the syllabification scripts, please cite:
Räsänen, O., Doyle, G. & Frank, M. C. (submitted). "Pre-linguistic rhythmic segmentation of speech into syllabic units".


---------------
Note that the bundle contains following third-party functions distributed under open source licenses: 
- sigstar.m by Rob Campbell (2013) (for plotting significance levels)
- gammatone-filterbank by Ning Ma (2010) (as a part of sonority-based syllabifier)
- peakdet.m from Eli Billauer (2005)

All other codes are written by Okko Räsänen (okko.rasanen@aalto.fi). Please contact okko.rasanen@aalto.fi for any bug reports or feedback on the scripts. 

---------------
Stuff included:
- mixed-order Markov chains (Saul & Pereira, 1997) MATLAB implementation  
- sonority-based syllabifier (Räsänen, Doyle & Frank, submitted).
- scripts to load ManyBabies data+metadata 
- predictability analyses reported in the paper 


---------------
How to get started

Either:

1a) (if you want to change syllabification or F0 extraction parameters)
- Delete existing the pre-computed syllables and F0 trajectories from /saves
- Download ManyBabies data (IDS/ADS Clips Soderstrom) from https://osf.io/re95x/
- Check that gammatone_c.c is mex-compiled for your platform (at thetaOscillator/gammatone)

1b) (if you want to use the pre-processing reported in the paper)
- Use pre-computed syllables and F0 trajectories (at "/saves" )
2) run predictability_IDS_ADS.m. 

The main parameters of the analyses can be found at the beginning of this file. Results will be written to /results , including a .mat file with all relevant variables and two .csv files, one with utterance-level descriptors + speaking style annotation (used in the binary logistic regression reported in the manuscript), and one with speaker-dependent descriptors for IDS and ADS (used in the main statistical analyses of the paper). A large proportion of the statistical analyses and result plotting are conducted inside the main MATLAB-script.  



 
