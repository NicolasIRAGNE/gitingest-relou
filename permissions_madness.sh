#!/bin/bash
# Script to generate permissions/ownership edge case files for gitingest
# Run from the repo root

mkdir -p permissions
cd permissions

# 1. Read-only file
echo "read only" > readonly.txt
chmod 444 readonly.txt

# 2. No permissions file
echo "no permissions" > noperms.txt
chmod 000 noperms.txt

# 3. Executable file
echo -e '#!/bin/bash\necho "hello"' > exec.sh
chmod +x exec.sh

# 4. Directory with no permissions
mkdir noperms_dir
touch noperms_dir/file.txt
chmod 000 noperms_dir

# 5. Sticky bit on directory
mkdir sticky_dir
touch sticky_dir/file.txt
chmod +t sticky_dir

# 6. Setuid and setgid on file
echo "setuid/setgid" > setid.txt
chmod u+s,g+s setid.txt

# 7. File owned by another user (if root)
if [ "$(id -u)" -eq 0 ]; then
  user=$(lslogins -u | awk 'NR==2{print $1}')
  chown $user:$user readonly.txt
fi

cd ..
echo "Permissions madness files generated in ./permissions/" 