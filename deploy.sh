git checkout gh-pages
git merge master --commit
yarn build
git add -f dist
git commit -m "Deploy"
git subtree push --prefix dist origin gh-pages
git checkout master