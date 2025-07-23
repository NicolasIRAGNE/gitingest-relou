#!/bin/bash
# Script to generate content weirdness edge case files for gitingest
# Run from the repo root

mkdir -p content_weirdness
cd content_weirdness

# 1. File with null bytes and random binary data
dd if=/dev/urandom of=binary_nulls.bin bs=1K count=1 status=none
# Also a text file with embedded null byte
echo -e "abc\x00def" > nullbyte.txt

# 2. Extremely large file (10MB for demo; change count for bigger)
dd if=/dev/zero of=largefile.bin bs=1M count=10 status=none

# 3. Files with only BOM
# UTF-8 BOM
echo -ne '\xEF\xBB\xBF' > bom_only_utf8.txt
# UTF-16 LE BOM
echo -ne '\xFF\xFE' > bom_only_utf16le.txt
# UTF-16 BE BOM
echo -ne '\xFE\xFF' > bom_only_utf16be.txt

# 4. Mixed line endings
printf "line1\r\nline2\nline3\rline4\r\n" > mixed_endings.txt

# 5. Invalid UTF-8 sequences
echo -ne '\x80\x81\xfe\xff' > invalid_utf8.txt

# 6. File with only control characters
echo -ne '\x01\x02\x03\x04' > control_chars.txt

# 7. File with a very long line (1 million 'A's)
head -c 1000000 < /dev/zero | tr '\0' 'A' > long_line.txt

# 8. File with no newline at EOF
echo -n "no newline at end" > nonewline.txt

cd ..
echo "Content weirdness files generated in ./content_weirdness/" 