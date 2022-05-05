# gba-disasm-decomp-tools
Tools to build a disassembly or decompilation project for GameBoy Advance game.

![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/laqieer/gba-disasm-decomp-tools)

```
docker pull laqieer/gba-disasm-decomp-tools
```

## Build

|Arg|Value|Default|
|---|---|---|
|USERNAME|GitHub account|pret|
|PROJECT|GitHub repo|pokeemerald|
|BUILD_TOOLS|Command to build tools|make tools|

Example:

```
docker build -t laqieer/gba-disasm-decomp-tools:fireemblem8u --build-arg USERNAME=FireEmblemUniverse --build-arg PROJECT=fireemblem8u --build-arg BUILD_TOOLS=./build_tools.sh .
```

## Usage

[Example](https://github.com/laqieer/fireemblem8u/blob/remove_tools/Dockerfile)
