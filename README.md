# MkDocs Template
This bash script is used to create a markdown documentation template for any project. It utilizes the static site generator, [MkDocs](https://www.mkdocs.org/getting-started/),
and the [material theme](https://squidfunk.github.io/mkdocs-material/getting-started/) to build project documentation. 

The script is well documented and each section can be edited to suit the required structure of the project.

## Clone repository

Open a terminal window and type in the following command to clone this repository:
```
git clone https://github.com/TheNoobInventor/mkdocs_template.git
```

Alternatively, the ZIP file for the repository can be downloaded and its contents extracted.

## Running the bash script

The `mkdocs_template.sh` file in the cloned repository is the bash script used to create the markdown documentation. Since this script will be used in any project that requires documentation, it is more efficient to make the script system-wide available, where it can be executed from any directory, instead of always copying the script to each project directory.

First copy the bash script to a directory, one that is mainly for scripts for instance. Then open a terminal window and execute the following commands:

```
cd
```

To ensure that you are in the home directory. Then,

```
export PATH = "/home/username/absolute-path-to-script-folder:$PATH"
```

Fill out the absolute path to the folder with the `mkdocs_template.sh` file as shown in the following screenshot. 

<p align="center">
  <img title='Export path' src=screenshots/export_bash.jpg width="600">
</p>

This command writes to the `.bashrc` system-wide configuration file, that handles shell configuration options among other functions, and will enable the script to be called from any directory. 

Execute the following command to save the changes made to the config file:

```
source .bashrc
```

Sometimes the terminal will have to be restarted for the changes to take effect. 

At this point, it is assumed that the project folder for the documentation is already a git repository, if that is not the case, go ahead and make the directory a git repository as this will needed to push the documentation to GitHub. 

Afterwards, navigate to the project folder in your terminal window and run the `mkdocs_template.sh` script:

```
mkdocs_template.sh
```

The script does the following:
- Installs the python package manager, `pip` and `mkdocs`.
- Runs the command: 
  ```
  mkdocs new .
  ``` 
  to create a new MkDocs project composed of a configuration file, `mkdocs.yml` a folder `docs` with a single documentation page named `index.md`. The documentation source files will be contained in the `docs` folder.
- Prompts the user for the name of the project to be used in the `mkdocs.yml` file.
- Populates the newly created `mkdocs.yml` file with configuration parameters such as the color theme to be used, table of contents, dark/light mode functionality and more.
- Overwrites the default contents of `index.md` with a template of titles that can be changed later to suit the needs of the documented project.
- Creates a `README.md` or overwrites the existing one to be used as a referral to the main documentation page.

The screenshots below show some of these steps in action.

<p align="center">
  <img title='Script 1' src=screenshots/script_1.jpg width="600">
  <img title='Script 2' src=screenshots/script_2.jpg width="600">
</p>


## Editing MkDocs Project Files

After running the script file, edit the default files...

* Change repo url and name and anything else in mkdocs.yml file
* Move any folders/files needed by index.md into the 'docs' folder 
* run mkdocs serve and see how things are 
* Assumed that you already have a github repository
* run mkdocs build, add 'site/' to .gitignore --> echo "site/" >> .gitignore
* commit to github
* deploy mkdocs --> mkdocs gh-deploy
* Copy in the .io link into the README file 
* Create the environment and/or secret for a git action 
* Create a git action and copy in a template for deploying mkdocs from one of the other repos
* Commit this file to the repo
* Pull the repo in vscode and commit the README change (and others), then push to the repo

(to be completed)