# MkDocs Template
This bash script is used to create a markdown documentation template for any project. It utilizes the static site generator, [MkDocs](https://www.mkdocs.org/getting-started/),
and the [material theme](https://squidfunk.github.io/mkdocs-material/getting-started/) to build project documentation. 

The script is well documented and each section can be edited to suit the required structure of the project.

## Running bash script

(to be completed)

* Run script in repo directory
* Change repo url and name and anything else in mkdocs.yml file
* Move any folders/files needed by index.md into the 'docs' folder 
* run mkdocs serve and see how things are 
* run mkdocs build, add 'site/' to .gitignore --> echo "site/" >> .gitignore
* commit to github
* deploy mkdocs --> mkdocs gh-deploy
* Copy in the .io link into the README file 
* Create the environment and/or secret for a git action 
* Create a git action and copy in a template for deploying mkdocs from one of the other repos
* Commit this file to the repo
* Pull the repo in vscode and commit the README change (and others), then push to the repo
* Later on do the vale config files and git action 
