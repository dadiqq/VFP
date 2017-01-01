
git status -s

git status -s | awk ' $2 { print ( $2 ) }'>/d/zjdz/addgit
git add `cat /d/zjdz/addgit`
git status -s
git commit -m " `date "+%Y-%m-%d %H:%M:%S"`  `git status -s`"
git status -s

 
