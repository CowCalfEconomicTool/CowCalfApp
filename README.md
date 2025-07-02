# Repository Overview

This repository contains the following files and directories:

| Filename              | Description                                                          |
|:----------------------|:---------------------------------------------------------------------|
| README.md             | High-level overview of the repository and file descriptions.         |
| app.R                 | Core script for running the economic simulation tool.                |
| Scenario_Nr.json      | JSON files for each scenario used in the study.                      |
| scenario_metadata.xlsx| Metadata of all variables used in each scenario.                     |
| www/                  | Directory with graphics used in the tool                             |
| build.sh              | Exports app into a GitHub Pages directory to update the hosted site  |
| LICENSE               | Information concerning license                                       |
# CowCalfApp

Economic simulation tool for farmers who want to implement cow-calf contact. The tool allows producers to simulate cost and benefit options for different management strategies.

The tool is an R Shiny application and it can either be run locally or deployed online. Online version is hosted at: https://cowcalfeconomictool.github.io/ .

## Build with Shinylive

You can build the application with shinylive.

First clone the code and run build using shinylive. You will need to install the [shinylive](https://posit-dev.github.io/r-shinylive/) package before running the commands.

```bash
git@github.com:CowCalfEconomicTool/CowCalfApp.git
cd ..
R --vanilla -e 'shinylive::export("CowCalfApp", "ccs_site")'
```

