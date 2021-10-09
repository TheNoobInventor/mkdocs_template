#!/bin/bash

# Script to easily install MkDocs, build a quick doc template using the material theme for MkDocs 
# and overwriting the default doc page with the user's preference

# Install pip and mkdocs
sudo apt install python3-pip mkdocs

# Navigate to root folder of repository and execute the following command to create a new MkDocs project 
mkdocs new .

# Prompt user for name of the projeect
read -p "Enter the name of your project: " proj_name

# Configuration parameters to be written in the newly created mkdocs.yml config file
cat <<EOT > mkdocs.yml
site_name: $proj_name
site_url: ''
use_directory_urls: False
edit_uri: ""

theme:
  name: material
  palette:
    - scheme: default
      primary: teal
      toggle:
        icon: material/toggle-switch-off-outline
        name: Switch to dark mode
    - scheme: slate
      primary: teal
      toggle:
        icon: material/toggle-switch
        name: Switch to light mode
repo_url: https://github.com/example/example-repo
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
This includes tools and misc like double sided tape
Pictures of some components/sensors

### Assembly
Notes about assembly. Some observations too
Pictures of the assembled project

## Software

### Software architecture
Software used

### Software install
how to download and run the code

## Video demonstration

## Observations

## Future work/suggestions

## References

EOT

echo "Project markdown template written in ./docs/index.md file"

# Referral page for the MkDocs documentation included in the default README.md file

cat <<EOT > README.md
![Mkdocs workflow](https://github.com/TheNoobInventor/REPO_NAME/actions/workflows/.github/workflows/main.yml/badge.svg)
# $proj_name

The documentation for this project can be found [here](https://example.github.io/example/).

EOT

