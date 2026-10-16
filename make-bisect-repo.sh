#!/usr/bin/env bash

set -e

rm -rf regression-demo
mkdir regression-demo
cd regression-demo

git init -b main

git config user.name "Sarab"
git config user.email "sarab@example.com"

printf 'alpha\nbeta\ngamma\ndelta\n' > input.txt

cat > transform.sh <<'EOF'
#!/usr/bin/env bash
cat input.txt > output.txt
EOF

chmod +x transform.sh

git add .
git commit -m "Initial working transform"

cat > transform.sh <<'EOF'
#!/usr/bin/env bash
head -n 3 input.txt > output.txt
EOF

git add transform.sh
git commit -m "Introduce regression"

git log --oneline
