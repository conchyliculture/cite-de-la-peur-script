if [ ! -d venv ]; then
    virtualenv -p python3 venv
fi
source venv/bin/activate

pip3 show screenplain 1>/dev/null
if [ $? != 0 ]; then
  pip install screenplain
  pip install 'screenplain[PDF]'
fi

screenplain  --format html script.fountain output/script.html
screenplain  --format pdf script.fountain output/script.pdf

git commit output/script.html output/script.pdf -m "auto-gen output files"
git checkout gh-pages
git merge main
git checkout main
git push --all origin 
