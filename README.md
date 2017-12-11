# Batch-Edit-Matroska-Defaults
Edit all Matroska files' default tracks under the specified directory.

## Requirements
[`mkvpropedit`](https://mkvtoolnix.download/)

## Usage
```
./mkvdefault.sh [--path <arg>] [--fa <arg>] [--ta <arg>] [--fs <arg>] [--ts <arg>] [-h|--help]
        --path: Matroska files' directory
        --fa: Current default audio track
        --ta: Target subtitle track
        --fs: Current default subtitle track
        --ts: Target subtitle track
        -h,--help: Prints help
```

Examples:
-	`./mkvdefault.sh --path yee --fa 1 --fs 1 --ta 2 --ts 2`
-	`./mkvdefault.sh --path yee --fa 1 --ta 2`
-	`./mkvdefault.sh --path yee --fs 1 --ts 2`

## Hacking
The script is generated with [argbash](https://argbash.io/).

It is recommended to modify the mkvdefault.m4 file and process it with `argbash mkvdefault.m4 -o mkvdefault.sh`.
