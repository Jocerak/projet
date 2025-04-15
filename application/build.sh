cd projet/application
touch build.sh
chmod +x build.sh
echo -e '#!/bin/bash\necho "Build réussi 🚀"' > build.sh

git add build.sh
git commit -m "Ajout du script build.sh"
git push origin main
