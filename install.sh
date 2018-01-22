#!/bin/bash -e

echo "========================= Clean apt-get ========================"
apt-get clean
mv /var/lib/apt/lists/* /tmp
mkdir -p /var/lib/apt/lists/partial
apt-get clean
apt-get update
echo "======================== Cleaned apt-get ======================"

echo "======================= Installing gcc 7.2 ======================"
add-apt-repository ppa:ubuntu-toolchain-r/test
apt-get update
apt-get install -y \
  gcc-7=7.2.0-1ubuntu1~14.04 \
  g++-7=7.2.0-1ubuntu1~14.04
update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-7 50 --slave /usr/bin/g++ g++ /usr/bin/g++-7
gcc --version
echo "================== Successfully Installed gcc 7.2 ==============="

apt-get install autoconf=2.69* automake=1:1.14.1* ccache=3.1.9* libssl-dev:amd64=1.0.1f*

CLANG_VERSION=5.0.1
echo "==================== Installing clang $CLANG_VERSION ==================="
wget -nv http://releases.llvm.org/"$CLANG_VERSION"/clang+llvm-"$CLANG_VERSION"-x86_64-linux-gnu-ubuntu-14.04.tar.xz
tar xf clang+llvm-"$CLANG_VERSION"-linux-x86_64-ubuntu14.04.tar.xz
cd clang+llvm-"$CLANG_VERSION"-linux-x86_64-ubuntu14.04
cp -R * /usr/local/
cd ../
clang --version
echo "=============== Successfully Installed clang $CLANG_VERSION ============"
