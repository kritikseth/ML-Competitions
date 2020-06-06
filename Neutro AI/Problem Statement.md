# NEUTROAI
             
## Problem Statement

**Overview**

In physics, redshift is a phenomenon where electromagnetic radiation (such as light) from an object undergoes an increase in wavelength. Whether or not the radiation is visible, "redshift" means an increase in wavelength, equivalent to a decrease in wave frequency and photon energy, in accordance with, respectively, the wave and quantum theories of light.Earth at velocities proportional to their distance. In other words, the further they are the faster they are moving away from Earth. The velocity of the galaxies has been determined by their redshift, a shift of the light they emit to the red end of the spectrum.

**Content**

Every observation of data is described by 17 feature columns and 1 class column which identifies it to be either a star, galaxy or quasar.

**Feature Description**

The table results from a query which joins two tables (actuaclly views): "PhotoObj" which contains photometric data and "SpecObj" which contains spectral data.

To ease your start with the data you can read the feature descriptions below:

* View "PhotoObj"
* objid = Object Identifier
* ra = J2000 Right Ascension (r-band)
* dec = J2000 Declination (r-band)

Right ascension (abbreviated RA; symbol α) is the angular distance of a particular point measured eastward along the celestial equator from the Sun at the March equinox to the (hour circle of the) point in question above the earth.[1] When paired with declination, these astronomical coordinates specify the location of a point on the celestial sphere in the equatorial coordinate system.

Source: https://en.wikipedia.org/wiki/Right_ascension

* u = better of DeV/Exp magnitude fit
* g = better of DeV/Exp magnitude fit
* r = better of DeV/Exp magnitude fit
* i = better of DeV/Exp magnitude fit
* z = better of DeV/Exp magnitude fit

The Thuan-Gunn astronomic magnitude system. u, g, r, i, z represent the response of the 5 bands of the telescope.

* run = Run Number
* rereun = Rerun Number
* camcol = Camera column
* field = Field number

Run, rerun, camcol and field are features which describe a field within an image taken by the Sky survey. A field is basically a part of the entire image corresponding to 2048 by 1489 pixels. A field can be identified by:
run number, which identifies the specific scan,
the camera column, or "camcol," a number from 1 to 6, identifying the scanline within the run, and
the field number. The field number typically starts at 11 (after an initial rampup time), and can be as large as 800 for particularly long runs.
An additional number, rerun, specifies how the image was processed.
* View "SpecObj"
* specobjid = Object Identifier
* class = object class (galaxy, star or quasar object)
The class identifies an object to be either a galaxy, star or quasar. This will be the response variable which is to be predicted.

* redshift = Final Redshift
* plate = plate number
* mjd = MJD of observation
* fiberid = fiber ID

Each spectroscopic exposure employs a large, thin, circular metal plate that positions optical fibers via holes drilled at the locations of the images in the telescope focal plane. These fibers then feed into the spectrographs. Each plate has a unique serial number, which is called plate in views such as SpecObj in the CAS.

Modified Julian Date, used to indicate the date that a given piece of survey data  was taken.

The spectrograph uses optical fibers to direct the light at the focal plane from individual objects to the slithead. Each object is assigned a corresponding fiberID.

ACCESSING AND ANALYZING THE DATA :

https://drive.google.com/drive/folders/1roD3MeHWvXoucNeXaHivVlIlEdRD8fbg
