This is an autotools package for the `alsacap` command. It was originally
written by Volker Schatz and reports the audio capabilities of ALSA devices.

Example output:

$ alsacap
*** Scanning for playback devices ***
Card 0, ID `ICH5', name `Intel ICH5'
  Device 0, ID `Intel ICH', name `Intel ICH5', 1 subdevices (1 available)
    2 channels, sampling rate 8000..48000 Hz
    Sample formats: S16_LE, S32_LE
    Buffer size range from 4 to 16384
    Period size range from 4 to 16384

      Subdevice 0, name `subdevice #0'

  Device 4, ID `Intel ICH - IEC958', name `Intel ICH5 - IEC958', 1 subdevices (1 available)
    2 channels, sampling rate 48000..48000 Hz
    Sample formats: S16_LE
    Buffer size range from 8 to 16384
    Period size range from 8 to 16384

      Subdevice 0, name `subdevice #0'


==== Notes about the package ====

This is a standard autotools package. You need:
  - `libasound2-dev` (ALSA library)
  - `pod2man` (to generate the man page)

## Builiding packages

To build manually:

  ./bootstrap
  ./configure
  make
  make install

To generate a distribution tarball:

  make dist

### Build .deb packages across architectures using Docker

#### Overriding Compiler Flags

To build for a specific architecture (e.g. ARMv6 hard-float):

```bash
export CFLAGS="-O2 -march=armv6 -mfpu=vfp -mfloat-abi=hard -marm"
make
```

You will see a summary like:

```text
[+] Building alsacap with CC=gcc and CFLAGS=-O2 -march=armv6 -mfpu=vfp -mfloat-abi=hard -marm
```

### Verifying Output

You can confirm architecture and float ABI using:

```bash
file alsacap
readelf -A alsacap | grep Tag_ABI
```

Example output for ARMv6 hard-float:

```text
alsacap: ELF 32-bit LSB executable, ARM, EABI5, hard-float
Tag_ABI_HardFP_use: Yes
```

### Packaging `.deb` (Debian/Ubuntu/Raspbian)

Builds a local Debian package:

```bash
dpkg-buildpackage -b -us -uc
```

This outputs `.deb` files in the parent directory (`../`).

### Docker-Based Cross-Architecture Packaging

To produce `.deb` packages for all target platforms (ARMv6, ARMv7, ARM64, AMD64):

```bash
./build-matrix.sh --volumio --verbose
```

This:

* Uses isolated Docker containers per target
* Copies source + packaging to `build/alsacap/source/`
* Runs `dpkg-buildpackage` inside each container
* Outputs `.deb` packages to `out/<arch>/`

Renamed outputs for Volumio convention:

| Arch  | Original `.deb` Suffix | Renamed Suffix |
| ----- | ---------------------- | -------------- |
| armv6 | `_armhf.deb`           | `_arm.deb`     |
| armhf | `_armhf.deb`           | `_armv7.deb`   |
| arm64 | `_arm64.deb`           | `_armv8.deb`   |
| amd64 | `_amd64.deb`           | `_x64.deb`     |

## Cleaning

To remove all build artifacts, intermediate files, and `.deb` outputs:

```bash
./clean-all.sh
```


Maintained by:
  foonerd
