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
- Overwrites the default contents of `index.md` with a template of titles that can be changed later to suit the needs of the project documentation.
- Creates a `README.md` if one does not exist and appends text it does. The text added in this file indicates that the `README.md` will be used as a referral page to the main documentation page.

The screenshots below show some of these steps in action.

<p align="center">
  <img title='Script 1' src=screenshots/script_1.jpg width="600">
  <img title='Script 2' src=screenshots/script_2.jpg width="600">
</p>

## MkDocs Project Files

After running the script file, certain default parameters in the `mkdocs.yml` file. These parameters include the `repo_url`, to be replaced with the url of the project repository, and `repo_name`. with the repository name. 

For example, 
```
repo_url: https://github.com/TheNoobInventor/Mkdocs_test
repo_name: TheNoobInventor/Mkdocs_test
```

The `site_url` parameter will also be changed but only after the project documentation has been generated, which will be detailed shortly.

Any folder or files required by the main documentation page, `index.md`, are copied into the `docs` folder.

MkDocs comes with an built-in development server that enables you to preview your documentation as you work on it. Open a terminal window again, ensure that you are in the directory that has the `mkdocs.yml` configuration file, and start the server by running the `mkdocs serve` command:

<p align="center">
  <img title='Mkdocs Serve' src=screenshots/mkdocs_serve.jpg width="600">
</p>

The custom home page can be seen when you open up http://127.0.0.1:8000/ in your browser:

<p align="center">
  <img title='Served Page' src=screenshots/served_page.jpg width="800">
</p>

The development server also supports auto-reloading, and will rebuild your documentation whenever anything in the configuration file or documentation directory changes.

## Building the Documentation Site

The next step is to build the documentation site. The running mkdocs server is shutdown (Ctrl+C keystroke) and the site is built by executing the following command:

```
mkdocs build
```

This creates the diretory, `site` which contains the files required for the documentation site. 

<p align="center">
  <img title='Build' src=screenshots/build.jpg width="600">
</p>

To avoid git keeping track of the documentation builds in your project directory, add the `site` directory to `.gitignore` file as follows:

```
echo "site/" >> .gitignore
```

## Deploying the Documentation with GitHub Pages

Finally, we want to deploy the documentation site for our project using GitHub Pages. GitHub Pages enables the user to host project documentation site in the respective repository. There are two GitHub Page site options: [Project Pages sites](https://pages.github.com/#project-site) and [User and Organization Pages sites](https://pages.github.com/#user-site); Project Page sites are suitable for our needs. 

To deploy the documentation site run the following command:

```
mkdocs gh-deploy
```

This command builds the docs, uses the [ghp-import](https://github.com/c-w/ghp-import) tool to commit them to the gh-pages branch and pushes the gh-pages branch to GitHub.

A `github.io` link to the documentation is provided at the end of the deploy process. 

  <p align="center">
    <img title='Deploy' src=screenshots/deploy.jpg width="600">
  </p>

This link should be copied and pasted into the last line of the `README.md` file that has a sample placeholder link. This `github.io` link is also copied into the `site_url` parameter in the `mkdocs.yml` file.

Right now, the documentation deployment is done however, to automate this deployment process, we are going to employ the use of GitHub Actions. [GitHub Actions](https://docs.github.com/en/actions/learn-github-actions/understanding-github-actions) is a continuous integration and continuous delivery (CI/CD) platform that allows us to automate our build, test and deployment pipelines. We will make use of GitHub Actions to deploy the site each time a change is pushed from our local repository to our GitHub repository.

We will be creating a GitHub workflow to perform the task of deploying the docs to the project repository. The steps to achieve this are as follows:

<ol>
  <li>Open the project GitHub repository and click on the <strong><em>Settings</em></strong> button.
  </li>
  <br/>

  <p align="center">
    <img title='Repo' src=screenshots/main_repo.jpg width="800">
  </p>

  <li>Click on <strong><em>Environments</em></strong> and then <strong><em>New environment</em></strong>.</li>
  <br/>

  <p align="center">
    <img title='Env' src=screenshots/env.jpg width="800">
  </p>

  <li>Choose a name for the Environment then click on <strong><em>Configure environment</em></strong> </li>

  </br>

  <p align="center">
    <img title='Config Env' src=screenshots/config_env.jpg width="800">
  </p>

  <li>We need to add an environment secret for GitHub Actions.</li>

  <br/>

  <p align="center">
    <img title='Add secret' src=screenshots/add_secret.jpg width="800">
  </p>

  <li>Input a secret name and value, then click on <strong><em>Add secret</em></strong>.</li>
  <br/>

  <p align="center">
    <img title='Secret value' src=screenshots/secret_value.jpg width="800">
  </p>

  <li>Now that the secret has been set, click on the <strong><em>Actions</em></strong> button, then on <strong><em>New workflow</em></strong>. </li>
  <br/>

  <p align="center">
    <img title='Actions' src=screenshots/actions.jpg width="800">
  </p>

  <li>Under <strong><em>Choose a workflow</em></strong>, click on <strong><em>set up a workfolow yourself.</em></strong> </li>
  <br/>

  <p align="center">
    <img title='New workflow' src=screenshots/new_work_flow.jpg width="800">
  </p>

  <li>Edit the name of the workflow file otherwise use the default name. Copy the contents of the main.yml file, provided in this repository, into the new workflow we are currently working on. </li>
  <br/>

  <p align="center">
    <img title='Setup workflow' src=screenshots/setup_workflow.jpg width="800">
  </p>

</ol>

In the workflow file, the MkDocs material theme is installed and the docs are deployed. Make sure to edit the environment secrets according to the name you chose in this fields of the file, `MKDOCS` was used in this case:

```
- run: pip install git+https://${MKDOCS}@github.com/squidfunk/mkdocs-material.git
```

And here:
```
env:
  GH_TOKEN: ${{secrets.MKDOCS}}
```

The workflow name field can also be edited if needed. After all the necessary edits have been made to the workflow file, click on Start commit to finish setting the workflow and commit the changes to the repository. This workflow will deploy and push the docs to GitHub pages on your repository everytime a commit is made to the project repository.  

To ensure that both the local and GitHub repositories are up to date, pull the latest changes from GitHub using:

```
git pull
```

Make the appropriate changes to the workflow link in the project `README.md` file as a sample link was used. Proceed as normal to add the changes to the staging area before committing and pushing them to the project GitHub repository.

## References

More information on the packages and tools used can be found in the references below.

- [MkDocs](https://www.mkdocs.org/getting-started/)
- [Material theme](https://squidfunk.github.io/mkdocs-material/getting-started/)
- [GitHub Pages](https://pages.github.com/)
- [GitHub Actions](https://docs.github.com/en/actions/learn-github-actions/understanding-github-actions)
- [Encrypted Environment Secrets](https://docs.github.com/en/actions/security-guides/encrypted-secrets)
