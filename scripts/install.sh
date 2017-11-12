#!/bin/sh

if [ $# -ne 2 ]; then
  echo "Usage: $0 HTKPATH HDECODEPATH"
  exit -1
fi

STARTPATH=`pwd`

HTKPATH="$(cd $(dirname "$1") && pwd)/$(basename "$1")"
cd "$STARTPATH"
HDECODEPATH="$(cd $(dirname "$2") && pwd)/$(basename "$2")"
cd "$STARTPATH"

mkdir tools
cd tools
TOOLSDIR=`pwd`

sudo apt-get update
sudo apt-get -y install sox libsox-fmt-all libpulse-dev libasound-dev hts-voice-nitech-jp-atr503-m001 cmake csh libx11-dev flac jq

wget https://github.com/julius-speech/julius/archive/v4.4.2.1.tar.gz
tar zxvf v4.4.2.1.tar.gz
mv julius-4.4.2.1 julius
cd julius
./configure
make
cd ..

wget --trust-server-names "https://osdn.net/frs/redir.php?m=jaist&f=%2Fjulius%2F66544%2Fdictation-kit-v4.4.zip"
unzip dictation-kit-v4.4.zip

wget https://www.dropbox.com/s/vvzl4yg4rwcdjol/segment_adapt_windows-v1.0.zip
unzip segment_adapt_windows-v1.0.zip
cd segment_adapt_windows-v1.0
cp ../../segment_adapt.patch .
patch -p1 -d . < segment_adapt.patch
cd ..

mkdir htk
tar zxvf $HTKPATH
tar zxvf $HDECODEPATH
wget http://hts.sp.nitech.ac.jp/archives/2.3/HTS-2.3_for_HTK-3.4.1.tar.bz2
mkdir HTS-2.3_for_HTK-3.4.1
tar jxvf HTS-2.3_for_HTK-3.4.1.tar.bz2 -C HTS-2.3_for_HTK-3.4.1
mv HTS-2.3_for_HTK-3.4.1/HTS-2.3_for_HTK-3.4.1.patch htk
cd htk
patch -p1 -d . < HTS-2.3_for_HTK-3.4.1.patch
./configure --prefix=$TOOLSDIR/htk/
make CFLAGS="-DARCH=ASCII -I$TOOLSDIR/htk/HTKLib"
make install
cd ..

wget http://downloads.sourceforge.net/hts-engine/hts_engine_API-1.10.tar.gz
tar zxvf hts_engine_API-1.10.tar.gz
mkdir hts_engine_API
cd hts_engine_API-1.10/
./configure --prefix=$TOOLSDIR/hts_engine_API/
make
make install
cd ..

wget http://downloads.sourceforge.net/sp-tk/SPTK-3.10.tar.gz
tar zxvf SPTK-3.10.tar.gz
mkdir SPTK
cd SPTK-3.10/
./configure --prefix=$TOOLSDIR/SPTK/
make
make install
cd ..

wget http://hts.sp.nitech.ac.jp/archives/2.3/HTS-demo_NIT-ATR503-M001.tar.bz2
tar jxvf HTS-demo_NIT-ATR503-M001.tar.bz2
cd HTS-demo_NIT-ATR503-M001/
cp ../../HTS-demo.patch .
patch -p1 -d . < HTS-demo.patch
./configure --with-sptk-search-path=$TOOLSDIR/SPTK/bin --with-hts-search-path=$TOOLSDIR/htk/bin --with-hts-engine-search-path=$TOOLSDIR/hts_engine_API/bin UPPERF0=500
cd ..

wget https://downloads.sourceforge.net/project/open-jtalk/Open%20JTalk/open_jtalk-1.10/open_jtalk-1.10.tar.gz
tar zxvf open_jtalk-1.10.tar.gz
mkdir open_jtalk
cd open_jtalk-1.10/
./configure --prefix=$TOOLSDIR/open_jtalk --with-hts-engine-header-path=$TOOLSDIR/hts_engine_API/include --with-hts-engine-library-path=$TOOLSDIR/hts_engine_API/lib
make
make install
cd ..

wget https://github.com/NON906/splitAndGetLabel/archive/v0.2.tar.gz
tar zxvf v0.2.tar.gz
mv splitAndGetLabel-0.2 splitAndGetLabel
cd splitAndGetLabel
mkdir build
cd build
cmake ..
make
cd ../..

rm -f v4.4.2.1.tar.gz dictation-kit-v4.4.zip segment_adapt_windows-v1.0.zip HTS-2.3_for_HTK-3.4.1.tar.bz2 hts_engine_API-1.10.tar.gz SPTK-3.10.tar.gz HTS-demo_NIT-ATR503-M001.tar.bz2 open_jtalk-1.10.tar.gz v0.2.tar.gz

