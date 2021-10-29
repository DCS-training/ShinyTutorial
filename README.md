# Building interactive web applications in R using SHINY

## Table of contents
* [General info](#general-info)
* [Technical background](#technical-background)
* [Repository structure](#repository-structure)
* [Setup](#setup)
* [Project status](#project-status)
* [Author and contact](#author-and-contact)

## General info
This repository contains all the files related to the tutorial "Building interactive web applications in R using SHINY", both ones necessary to create a tutorial PDF file as well as a functioning example of a Shiny app. The tutorial aims at familiarizing the reader with all key stages of web app creation in R, including all key libraries. 

## Technical background
PDF document was knitted in RStudio (ver. 1.3.1073; R ver. 4.02), using RMarkdown library (ver. 2.7) and TinyTex (LaTex distribution). Diagrams presented (Fig. 5-7, namely: AppStructure, SideLayout, TabsetLayout) were done in MS PowerPoint. 

Hex sticker with a Shiny logo, presented on the opening page, was taken from the "hex-stickers" GitHub repository: https://github.com/rstudio/hex-stickers/tree/master/PNG


## Repository structure

```

 .
 └── ShinyTutorial
     ├── Tutorial.Rmd
     ├── Tutorial.pdf
     ├── README.md
     ├── visual
     │   ├── AppStructure.jpg
     │   ├── Customization.jpg  
     │   ├── DCS.jpg   
     │   ├── Difference.jpg
     │   ├── GitHubRep.jpg
     │   ├── InputWidgets.jpg
     │   ├── NewShinyWebApp.jpg
     │   ├── RunningAppRStudio.jpg
     │   ├── Shiny.png
     │   ├── Shinyapp.jpg
     │   ├── SideLayout.jpg
     │   ├── Starting.jpg
     │   ├── TabsetLayout.jpg
     │   ├── TextExamples.jpg
     │   └── UoELogo.png
     └── appexample  
         └── app.R
```

main/ section o the repository contains (apart from the README file) Tutorial.Rmd with all the code necessary to create a tutorial pdf, already knitted Tutorial.pdf (the result of executing Tutorial.Rmd), and two folders. Folder "visual" contains all the figures used by Tutorial.Rmd. Folder "appexample" contains the app.R file, an example R app created by using Shiny library.


## Setup
To be able to access Rmd file or run the app you have to have R and RStudio installed on your computer:
* R package can be downloaded from https://cran.r-project.org/bin/windows/base/release.htm
* RStudio can be downloaded from: https://rstudio.com/products/rstudio/download/#download

If you have R and RStudio already installed:
* Install required libraries ("shiny","shinythemes","DT","ggplot2") to be able to run/modify the app
* To be able to change and/or knit the Rmd document into a pdf file install required libraries ("rmarkdown","knitr"), including LaTeX extensions ("tinytex" or similar). If necessary, "devtools" may also be needed
* Download the files and folders from the repository, make sure to have it all in one folder
* Make sure the working directory in RStudio is the same as the folder in which the data is saved (getwd() for checking directory, setwd() for setting relevant directory)

Alternatively, only to run an app:
* Install required libraries ("shiny","shinythemes","DT","ggplot2") 
* In RStudio, run this code do access app copy in the GitHub repository: shiny::runGitHub("ShinyTutorial","DCS-training", ref = "main", subdir = "appexample")


## Project status
7-27.10.21 -> Tutorial creation

28.10.21   -> Tutorial completed

29.10.21   -> Repository created


## Author and contact
This tutorial was written by Andrzej A. Romaniuk, for the Centre for Data, Culture and Society, University of Edinburgh.

Andrzej A. Romaniuk


PhD (Archaeology), MSc (Osteoarchaeology)

University of Edinburgh, Research/Teaching assistance

National Museums of Scotland, Research associate

Higher Education Academy, Associate fellow

https://www.ed.ac.uk/profile/andrzej-romaniuk

https://www.linkedin.com/in/andrzej-aleksander-romaniuk-74145292/

https://github.com/AndrzejRomaniuk

https://orcid.org/0000-0002-4977-9241
