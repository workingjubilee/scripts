
if [[ $# -eq 2 ]]; then
    echo "# ${2}" >> README.md
    git init
    git add README.md
    git commit -m "Add README"
    git remote add origin https://github.com/${1}/${2}.git
    git push -u origin master
elif
    echo "Insufficient parameters, please supply username and repo name."
fi
