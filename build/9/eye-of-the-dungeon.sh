#!/bin/sh
echo -ne '\033c\033]0;Just Get Started\a'
base_path="$(dirname "$(realpath "$0")")"
"$base_path/eye-of-the-dungeon.x86_64" "$@"
