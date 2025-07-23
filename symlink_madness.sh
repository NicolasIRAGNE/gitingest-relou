#!/bin/bash
# Script to generate symlink edge case files for gitingest
# Run from the repo root

mkdir -p symlink_madness
cd symlink_madness

# 1. Normal symlink to a file
echo "target file" > target_file.txt
ln -s target_file.txt symlink_to_file.txt

# 2. Normal symlink to a directory
mkdir target_dir
echo "inside dir" > target_dir/file_in_dir.txt
ln -s target_dir symlink_to_dir

# 3. Broken symlink (target does not exist)
ln -s does_not_exist.txt broken_symlink.txt

# 4. Symlink loop (A -> B, B -> A)
ln -s loopB.txt loopA.txt
ln -s loopA.txt loopB.txt

# 5. Symlink to parent directory
ln -s .. symlink_to_parent

# 6. Symlink to itself
ln -s self_symlink.txt self_symlink.txt

cd ..
echo "Symlink madness files generated in ./symlink_madness/" 