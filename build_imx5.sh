#!/bin/bash



simlink? () {
  test "$(readlink "${1}")";
}


cd ./poky/
#rm build-imx5 -Rf

if simlink? "meta-imx5"; then
  echo Link exits
else
  ln -s ../meta-imx5 meta-imx5
fi

if simlink? "meta-embtom"; then
  echo Link exits
else
  ln -s ../meta-embtom meta-embtom
fi

source oe-init-build-env build-imx5
cp ../../layerConf/bblayers.conf ./conf/
cp ../../layerConf/local.conf ./conf/

bitbake imx53-embtom-image
bitbake imx53-embtom-image -c populate_sdk

mkdir -p ../../buildOut/deploy
cp tmp/deploy/images/imx53/imx53-embtom-image-imx53.tar.gz ../buildOut/deploy
cp tmp/deploy/images/imx53/imx53-embtom-image-imx53-dbg.tar.gz ../buildOut/deploy
cp tmp/deploy/images/imx53/imx53-embtom-image-imx53.jffs2 ../buildOut/deploy
cp tmp/deploy/images/imx53/uImage ../buildOut/deploy
cp tmp/deploy/images/imx53/imx53-embtom.dtb  ../buildOut/deploy
cp tmp/deploy/sdk/poky-glibc-x86_64-imx53-embtom-image-armv7a-neon-toolchain-2.6.2.sh ../buildOut/deploy

