#!/bin/bash
# Script to generate crazy nesting edge cases for gitingest
# Run from the repo root


dirname="nesting"
mkdir -p $dirname

# Deeply nested directories (50 levels)
nest=$dirname
for i in {1..50}; do
  nest="$nest/level$i"
done

find $dirname -type d -name "level1" -exec bash -c 'echo "shallow" > {}/shallow.txt' \;
find $dirname -type d -name "level25" -exec bash -c 'echo "mid" > {}/mid.txt' \;
find $dirname -type d -name "level50" -exec bash -c 'echo "deep" > {}/deep.txt' \;

echo "Crazy nesting files generated in $dirname" 