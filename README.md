# Vintage KallistiOS for Dreamcast (2005-06-18)
This repo contains a snapshot of KallistiOS and a kos-ports tree from 2005-06-18, and includes a script for building a matching toolchain on modern systems (with GCC 3.4.6, Newlib 1.12.0, and Binutils 2.41).

This is useful for compiling old Dreamcast homebrew codebases that used KallistiOS 1.x series.

By default, everything installs to `/opt/toolchains/dc/kos-20050618` and the repo comes with a premade `environ.sh` script already set up for that path.
- Initial dc-chain script is stored at `/opt/toolchains/dc/kos-20050618/dc-chain`
- KallistiOS will be stored at `/opt/toolchains/dc/kos-20050618/kos`
- kos-ports tree will be stored at `/opt/toolchains/dc/kos-20050618/kos-ports`
- SH compiler will be stored at `/opt/toolchains/dc/kos-20050618/sh-elf`
- ARM compiler will be stored at `/opt/toolchains/dc/kos-20050618/arm-elf`

# Setup
## Dependencies
If you have the dependencies from modern KallistiOS installed already, you should probably be OK here. See [this article](https://dreamcast.wiki/Getting_Started_with_Dreamcast_development) for more information on dependencies.

## Download
Create `/opt/toolchains/dc` directory if it doesn't already exist
```
sudo mkdir -p /opt/toolchains/dc
sudo chmod -R 755 /opt/toolchains/dc
sudo chown -R $(id -u):$(id -g) /opt/toolchains/dc
```
Clone the git repo in place and unpack KallistiOS and kos-ports
```
cd /opt/toolchains/dc
git clone https://github.com/darcagn/kos-20050618.git
cd kos-20050618
tar jxf kos-snapshot-20050618.tar.bz2
tar jxf kos-ports-snapshot-20050618.tar.bz2
```
## Install SH and ARM compilers
Enter the dc-chain builder script directory, download the necessary packages, and unpack files:
```
cd dc-chain
./download.sh
./unpack.sh
```
You can adjust the Makefile with a text editor now if you want to deviate from the standard settings.

Build the toolchain:
```
make
```

If successful, the `/opt/toolchains/dc/kos-20050618` directory will contain the toolchains in `sh-elf` and `arm-elf` directories. If unsuccessful, check the `dc-chain/logs` directory for details.

## Build KOS
Enter KOS directory and move `environ.sh` script into place:
```
cd /opt/toolchains/dc/kos-20050618/kos
mv ../environ.sh.sample environ.sh
```
Set environment and build KallistiOS:
```
source environ.sh
make
```

Enter kos-ports directory and build kos-ports
```
cd ../kos-ports
make
```

# Resources
[DCEmulation Forums](http://dcemulation.org/phpBB/viewforum.php?f=29): Goldmine of Dreamcast development information and history  
[dreamcast.wiki](http://dreamcast.wiki): Large collection of tutorials and articles for beginners  
[Simulant Discord Chat](https://discord.gg/bpDZHT78PA): Home to the official Discord channel of KOS  
IRC Channel: irc.libera.chat `#dreamcastdev`
