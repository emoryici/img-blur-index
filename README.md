# img-blur-index

Calculating image blur adapted from De & Masilamani, Procedia Engineering, Volume 64, 2013, Pages 149-158 (link below). Used to determine how much selective plane illumination microscopy (SPIM) data to crop.  Uses Fiji/ImageJ FFT, and thresholds 3 std dev above the mean background to determine included FFT area.  Here this area is used as an index of blur.

https://www.sciencedirect.com/science/article/pii/S1877705813016007
