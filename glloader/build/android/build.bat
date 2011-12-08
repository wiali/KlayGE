set PATH=%PATH%;%ANDROID_NDK%

REM Workaround for NDK r7
mkdir obj
mkdir obj\local
mkdir obj\local\armeabi
mkdir obj\local\armeabi-v7a
mkdir obj\local\x86
copy "%ANDROID_NDK%\sources\cxx-stl\gnu-libstdc++\libs\armeabi\libgnustl_static.a" obj\local\armeabi\
copy "%ANDROID_NDK%\sources\cxx-stl\gnu-libstdc++\libs\armeabi-v7a\libgnustl_static.a" obj\local\armeabi-v7a\
copy "%ANDROID_NDK%\sources\cxx-stl\gnu-libstdc++\libs\x86\libgnustl_static.a" obj\local\x86\

ndk-build

mkdir ..\..\lib\android_armeabi
copy /Y obj\local\armeabi\libglloader.a ..\..\lib\android_armeabi\

mkdir ..\..\lib\android_armeabi-v7a
copy /Y obj\local\armeabi-v7a\libglloader.a ..\..\lib\android_armeabi-v7a\

mkdir ..\..\lib\android_x86
copy /Y obj\local\x86\libglloader.a ..\..\lib\android_x86\
