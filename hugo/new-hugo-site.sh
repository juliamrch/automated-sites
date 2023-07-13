
# Make a new site and enter the repository
hugo new site my-hugo-site
cd my-hugo-site

# Initialize git
git init

# Download PaperMod theme and set it as your site theme (change this if you want another theme by default)
git submodule add --depth=1 https://github.com/adityatelange/hugo-PaperMod.git themes/PaperMod
echo "theme = 'PaperMod'" >> hugo.toml

# Write a first post, beacuse why not
hugo new first-post.md
echo "Hi, this is my first post on my new Hugo site!" >> content/first-post.md

# Make a script for deployment on Clever Cloud and sets permissions
touch hugo.sh
echo "wget https://github.com/gohugoio/hugo/releases/download/v$HUGO_VERSION/hugo_extended_"$HUGO_VERSION"_Linux-64bit.tar.gz" >> hugo.sh
echo "tar -xvf hugo_extended_"$HUGO_VERSION"_Linux-64bit.tar.gz" >> hugo.sh
echo "chmod +x ./hugo" >> hugo.sh
echo "./hugo --gc --minify --destination public" >> hugo.sh
chmod +rwx hugo.sh

# Make your first commit
git add .
git commit -m "first commit"

# Open your site with VSCode
code .

# Shows your site 
hugo server
