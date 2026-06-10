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
docker build -t laqieer/gba-disasm-decomp-tools:fireemblem8u --build-arg USERNAME=laqieer --build-arg PROJECT=fireemblem8u --build-arg BUILD_TOOLS=./build_tools.sh .
```

The `:fireemblem8u` tag is also built and published automatically by the
`Docker` workflow (`.github/workflows/docker-publish.yml`). It is built from the
`laqieer` fork because its `master` carries the `preproc` tool and `gbagfx`
`-mindist` support that upstream `FireEmblemUniverse` does not yet have.

## Usage

[Example](https://github.com/laqieer/fireemblem8u/blob/remove_tools/Dockerfile)
