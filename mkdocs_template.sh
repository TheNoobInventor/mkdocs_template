#!/bin/bash

# Script to easily install MkDocs, build a quick doc template using the material theme for MkDocs 
# and overwriting the default doc page with the user's preference

# Install pip and mkdocs
sudo apt install python3-pip mkdocs

# Navigate to root folder of repository and execute the following command to create a new MkDocs project 
mkdocs new .

# Prompt user for name of the project
read -p "Enter the name of your project: " proj_name

# Configuration parameters to be written in the newly created mkdocs.yml config file
cat <<EOT > mkdocs.yml
site_name: $proj_name
site_url: ''
use_directory_urls: False

theme:
  name: material
  palette:
    - scheme: default
      primary: indigo 
      toggle:
        icon: material/toggle-switch-off-outline
        name: Switch to dark mode
    - scheme: slate
      primary: indigo
      toggle:
        icon: material/toggle-switch
        name: Switch to light mode
  features:
    - navigation.tabs
    - navigation.tabs.sticky
    - navigation.sections
    - navigation.top
    - toc.integrate
repo_url: https://github.com/sample/sample-repo
repo_name: example/example-repo
plugins:
  - search:
      lang: en
EOT

# Print project markdown template in index.md file, overwriting its previous contents
cat <<EOT > docs/index.md
# $proj_name

## Hardware

### Components
Tools and sensors used 

### Project assembly
Assembly steps 
Pictures of the assembled project

## Software

### Software architecture
Software used

### Software install
How to download and run the code

## Video demonstration

## Observations

## Future work/suggestions

## References

EOT

echo "Project markdown template written in ./docs/index.md file"

# Referral page for the MkDocs documentation included in the default README.md file

cat <<EOT > README.md
![Mkdocs workflow](https://github.com/sample/sample-repo/actions/workflows/.github/workflows/main.yml/badge.svg)

# $proj_name

The documentation for this project can be found [here](https:/sample.github.io/sample/).

EOT

