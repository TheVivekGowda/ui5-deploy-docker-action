#!/bin/sh -l

cd "$GITHUB_WORKSPACE" "$GITHUB_REPOSITORY" || exit

mbt build --mtar -p=neo -t ui5app.mtar
