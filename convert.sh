if [ ! -d venv ]; then
    virtualenv -p python3 venv
fi
source venv/bin/activate

pip install screenplain
pip install 'screenplain[PDF]'


screenplain  --format html script.fountain output/script.html
screenplain  --format pdf script.fountain output/script.pdf

git checkout gh-pages
git merge main
git checkout main
git push 
