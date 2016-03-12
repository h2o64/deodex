#/bin/sh
mkdir -p deodex
mkdir -p NEW/$1
cp $1/$1.apk .
cp $1/arm/$1.odex .
java -jar oat2dex.jar boot $1.odex
java -jar baksmali-2.1.1.jar -a 22 -x dex/$1.dex -o deodex
java -jar smali-2.1.1.jar -a 22 deodex -o classes.dex
7za u -tzip $1.apk classes.dex
mv $1.apk NEW/$1/
rm classes.dex
rm -rf deodex
rm -rf odex
rm -rf dex
rm *.odex
