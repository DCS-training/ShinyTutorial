#Starting from Required libraries
library(ggplot2)
library(shiny)
library(DT)
library(shinythemes)

#App ui, using standard sidebar Layout
ui <- fluidPage(
  theme = shinytheme("yeti"),             #A specific theme selected
  h1("Exploring Iris data set",           #App title, centrally aligned
     align = "center"),                   
  sidebarLayout( 
    sidebarPanel(
      selectInput(                         #Firstly, let the user decide 
        inputId = "Measurements",          #what measurement to analyse
        label = h4("Measurement"),         #(only one from the list)
        choices = list(
          "Sepal.Length" = "Sepal.Length", 
          "Sepal.Width"  = "Sepal.Width",
          "Petal.Length" = "Petal.Length",
          "Petal.Width"  = "Petal.Width"), 
        selected = "Sepal.Length"
      ),
      
      checkboxGroupInput(                  #Secondly, which species should 
        inputId = "Species",               #be included in analysis
        label = h4("Species"),             #(checkboxes with multiple choice)
        choices = list(
          "setosa" = "setosa",
          "versicolor" = "versicolor",
          "virginica" = "virginica"
        ),
        selected = "setosa"
      ),
      
      conditionalPanel(                    #Thirdly, whether species should
        condition = (                      #be analyzed as one group or
          "input.Species.length > 1"),     #separately  
        checkboxInput(                     #(a single checkbox, only if 
        inputId = "Joint",                 #more than 1 species included)
        label = "Joint Species?",             
        value = TRUE)),                       
      
      sliderInput(                         #Lastly, for the histogram
        inputId = "BinSize",               #how big should the bins be
        label = h4("Bin size"),
        min = 0.1,
        max = 1,
        value = 0.3)
    )
    ,
    mainPanel(                             #We expect 3 results to be 
      tabsetPanel(                         #displayed
        tabPanel(                             
          "Plot", 
          plotOutput(                      #histogram
            "resultPlot")            
        ),
        tabPanel(
          "Summary",   
          verbatimTextOutput(              #summary of the measurement
            "resultPrint")                 #(min/max, quartiles etc.)
        ),                                    
        tabPanel(
          "Table",  
          dataTableOutput(                 #Table of raw measurements
            'resultTable')      
        ),
        tabPanel(                          #As written
          "About the app",
          p(" "),
          strong("Example of a working Shiny app"),
          p(" "),
          p("This Shiny app was written as an 
             example for the tutorial teaching 
             how to create a Shiny app. It is 
             based on Fisher/Anderson’s Iris data 
             set, enabling interactive exploration
            of the data."),
          p(" "),
          p("To run this app from GitHub 
            locally use the code below:"),
          code('shiny::runGitHub("ShinyTutorial","DCS-training",
               ref= "main/appexample") [add when completed]'),
          p(" "),
          p("See the link below for Shiny official page:"),
          tags$a(href="https://shiny.rstudio.com/", 
                 "shiny.rstudio.com"),
          p(" "),
          p("See the link below for the tutorial GitHub page"),
          tags$a(href="https://github.com/DCS-training/ShinyTutorial", 
                 "github.com/DCS-training/ShinyTutorial"),
          p(" "),
          p("App and related tutorial created fo CDCS UoE 
            by Andrzej A. Romaniuk")
        )
      )
    )
    
  )
)

#Server
server <- function(input,output) {
  
  dataReactive <- reactive({               #First, lets subset the data                    
    subset(iris,                           #we need from the iris dataset
           Species %in% input$Species,     #All species chosen via checkbox
           select = c(                     #Selecting columns:
             input$Measurements,           #Which measurement we need
             "Species")                    #plus species column for later
    )
  })
  
  output$resultPlot <- renderPlot(         #Starting from rendering a plot
    ggplot(
      dataReactive(),                      #Calling the dataframe we created
      aes(x=dataReactive()[,1],            #x as first column (measurement)
          fill = Species)                  #fill as Species, for better
    ) +                                    #understanding of what's happening
      geom_histogram(                         
        binwidth = input$BinSize,          #Bin size chosen via slider
        boundary = 0,                         
        colour="black"
      ) + 
      theme_classic() + 
      labs(y=NULL,x=NULL) +
      if (input$Joint == FALSE) {          #If separate analysis wanted
        facet_wrap(~Species)               #separate plots for each species
      } else {                             #chosen
      })  
  
  output$resultPrint <- renderPrint(       #Next, summarizing the data
    if (input$Joint == FALSE) {            #If analyzed as separate
      for (i in 1:length(input$Species)) {
        print(
          input$Species[i],                #Each species printed
          row.names = FALSE
        )
        print(
          summary(
            subset(
              dataReactive(), 
              Species == input$Species[i]
            )[,1]                          #Alongside summary statistics
          ),
          row.names = FALSE
        )
      }
    } else {
      {summary(dataReactive())}            #If analyzed jointly
    })
  
  
  output$resultTable <- renderDataTable(   #Finally, rending a data table
    dataReactive(),                        #we created to summarize and plot
    options = list(dom = 'ltp'),           #(restricting interactivity to
    rownames= FALSE                        #pagination and a list)
  )
}

#Finally, shinyApp() combining both ui and server side
shinyApp(ui = ui, server = server)
