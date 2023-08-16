# Matlab

<https://github.com/jonlighthall/matlab>

This repsoitory contains general purpose programs written in MATLAB.

## Contents

### General Purpose

| program              | description                           | reference | test script |
| -------------------- | ------------------------------------  | ----           | ----
| [`load_constants.m`](load_constants.m) | unit conversions |
| [`hello.m`](hello.m) | hello world |
| [`plot_hist.m`](test/plot_hist.m) | plot histogram |

### Figures : [`figs`](figs/)

| program              | description                           | reference | test script |
| -------------------- | ------------------------------------  | ----           | ----
| [`autoArrangeFigures.m`](figs/autoArrangeFigures.m) | arrange figures | [`autoArrangeFigures.m`](https://www.mathworks.com/matlabcentral/fileexchange/48480-automatically-arrange-figure-windows) | [`test_autoArrangeFigures.m`](test/test_autoArrangeFigures.m)
| [`buildcmap.m`](figs/buildcmap.m) | build color map | [`buildcmap.m`](https://www.mathworks.com/matlabcentral/fileexchange/40318-build-custom-colormaps) | [`test_buildcmap.m`](test/test_buildcmap.m)
| [`nfigs.m`](figs/nfigs.m) | number of figures |
| [`setplotsize.m`](figs/setplotsize.m) | set plot size |
| [`timestamp.m`](figs/timestamp.m) | time stamp |

### Geodesy : [`geo`](geo/)

| function              | description                           | reference | test script |
| -------------------- | ------------------------------------  | ----           | ----
| [`dist.m`](geo/dist.m) | distance | [`distbear.m`](http://mooring.ucsd.edu/software/matlab/doc/ocean/distbear.html) | [`test_dist.m`](geo/test_dist.m)
| [`geoc2geod.m`](geo/geoc2geod.m) | geocentric to geodetic | | [`test_geoc2geod.m`](geo/test_geoc2geod.m)
| [`geod2geoc.m`](geo/geod2geoc.m) | geodetic to geocentric |
| [`geoc2rad.m`](geo/geoc2rad.m) | geocentric to radius |
| [`geod2rad.m`](geo/geod2rad.m) | geodetic to radius |

### Mathematics : [`math`](math/)

| function              | description
| -------------------- | ------------------------------------
| [`comb.m`](math/comb.m) | combination |
| [`divisor.m`](math/divisor.m) | factorization |
| [`perm.m`](math/perm.m) | permutation |
| [`tantan.m`](math/tantan.m) | atan2 |

### Transmission Loss : [`tl`](lt/)

| function              | description
| -------------------- | ------------------------------------
| [`TL_units.m`](tl/TL_units.m) | compare TL referenced to 1yd & 1m |

## Installation

### Prerequisites

Requies a working copy of MATLAB. All scripts and functions written on and for version R2018b.

### Cloning

Check out the folder from the repository with one of the following commands.

>`git clone https://github.com/jonlighthall/matlab` (Git HTTPS)

>`git clone git@github.com:jonlighthall/matlab.git` (Git SSH)

### Configuration
To ignore changes to .gitignore, use the following command

>`git update-index --skip-worktree .gitignore`