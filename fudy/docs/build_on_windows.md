These are common steps to build Fudy from source on Windows.

### Requirements

Windows 10 (or newer) is required to build Fudy.

Additionally, you need to install the following tools/components:

- [Git](https://gitforwindows.org/)
- [Microsoft Visual C++](https://visualstudio.microsoft.com/downloads) `>= 2019` _(only the build tools are required)_
- [Qt](https://www.qt.io/download-qt-installer) `>= 5.15` _(using the latest version is recommended)_
  - [CMake](https://cmake.org/download/) _(can be installed via the Qt installer)_
  - [Ninja](https://ninja-build.org/) _(can be installed via the Qt installer)_

### Building

The following steps are done all via the command line. If you're not that comfortable with it, you can also to configure the project using a graphical tool like the CMake GUI, or Qt Creator.

Additionally, these commands are meant to be run on the Windows command prompt, _not_ on PowerShell (though they can be easily adapted).

First, use `git` to clone the project and its components, and then navigate into it:

```shell
git clone https://github.com/DongTrieu1998/fudy_project.git --recurse-submodules
cd fudy_project
```

Now, let's configure our build environment. In this example, we will be using Microsoft Visual C++ 2019 and Qt 5.15.2 (the MSVC 2019 build), targeting a 64-bit system.

Depending on what versions of these applications you have installed, you may need to make some path adjustments in the following steps.

Let's begin by invoking the `vcvars64.bat` script from MSVC 2019, which will set some helpful environment variables for us:

```shell
@call "C:\Program Files (x86)\Microsoft Visual Studio\2019\BuildTools\VC\Auxiliary\Build\vcvars64.bat"
```

Now, we need to add CMake, Ninja, Qt sources and tools to our `Path` environment variable:

```shell
set Path=C:\Qt\Tools\CMake_64\bin;%Path%
set Path=C:\Qt\Tools\Ninja;%Path%
set Path=C:\Qt\5.15.2\msvc2019_64;%Path%
set Path=C:\Qt\5.15.2\msvc2019_64\bin;%Path%
```

Optionally, if you want to dedicate all cores of your CPU to build Fudy much faster, set this environment variable:

```shell
set CMAKE_BUILD_PARALLEL_LEVEL=%NUMBER_OF_PROCESSORS%
```

After that, we're ready to build Fudy!

Invoke CMake to configure and build the project into a folder called `build`, in [`Release` mode](https://cmake.org/cmake/help/latest/variable/CMAKE_BUILD_TYPE.html):

```shell
cmake -B build -G Ninja -DCMAKE_BUILD_TYPE=Release
cmake --build build
```

<!-- FIXME: Avoid hardcoding the output folder to `bin` on Windows? -->

Now, let's move the `Fudy.exe` executable we just built into a separate folder called `bin` inside the `build` folder, where later we will copy other libraries required to run the app:

```shell
cmake --install build --prefix build
```

Now, use the `windeployqt` tool from Qt to copy the required Qt libraries to run Fudy:

```shell
windeployqt --qmldir src\qml build\bin
```

And then, finally, copy the required OpenSSL libraries to make internet-dependent features work properly (like the auto-updater):

```shell
copy /B C:\Qt\Tools\OpenSSL\Win_x64\bin\libcrypto-1_1-x64.dll build\bin
copy /B C:\Qt\Tools\OpenSSL\Win_x64\bin\libssl-1_1-x64.dll build\bin
```

You can now run Fudy by double-clicking the `Fudy.exe` executable in the `build\bin` folder.
