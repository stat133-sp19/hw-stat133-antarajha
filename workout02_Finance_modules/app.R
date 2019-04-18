
library(shiny)
library(rsconnect)
library(dplyr)
library(ggplot2)
library(tidyr)


# Define UI 
ui <- fluidPage(
  
  # Application title
  titlePanel("Analyzing Returns on Different Investment Modules"),
  verticalLayout(
    fluidRow(column(4,
                    sliderInput("initial_amount",
                                "Initial Amount",
                                min = 1,
                                max = 100000,
                                value = 1000,
                                step = 500),
                    
                    sliderInput("add_amount",
                                "Annual Contribution",
                                min = 0,
                                max = 50000,
                                value = 2000,
                                step = 500)),
            column(4,
                   sliderInput("rate",
                               "Return Rate (in %)",
                               min = 0,
                               max = 20,
                               value = 5,
                               step = 0.1),
                   sliderInput("growth_rate",
                               "Growth Rate (in %)",
                               min = 0,
                               max = 20,
                               value = 2,
                               step = 0.1)),
            column(4, 
                   sliderInput("years",
                               "Years",
                               min = 0,
                               max = 50,
                               value = 20,
                               step = 1), 
                   selectInput("facet",
                               "Facet?",
                               choices = c("No","Yes"
                               )))),
          h4("Timelines"),
          plotOutput("investment_graph"),
          h4("Balances"),
          tableOutput("investment_table")
                 )
)

# Define server logic required to plot graph and generate table
server <- function(input, output) {
  
 #Defining output for graph  
  output$investment_graph = renderPlot({
    future_value = function(amount, rate, years) {
      fv = amount * (1 + (rate/100))** years
      return(fv)
    }
    annuity = function(contrib, rate, years) {
      fva = contrib * (((1 + (rate/100) )** years) - 1)/ (rate/100)
      return(fva)
    }
    growing_annuity = function(contrib, rate, growth, years) {
      fvga = contrib * (((1 + (rate/100))** years) - (1 + (growth/100))** years)/ ((rate/100) - (growth/100))
      return(fvga)
    }
    
    year = c()
    no_contrib = c()
    fixed_contrib = c()
    growing_contrib = c()
    
    for (i in 0: input$years) {
      yr = i
      fv_i = future_value(input$initial_amount, input$rate, i)
      fv_a_i = future_value(input$initial_amount, input$rate, i) + annuity(input$add_amount, input$rate, i)
      fv_ga_i = future_value(input$initial_amount, input$rate, i) + growing_annuity(input$add_amount, input$rate,input$growth_rate, i)
      year = append(year, yr)
      no_contrib = append(no_contrib, fv_i)
      fixed_contrib = append(fixed_contrib, fv_a_i)
      growing_contrib = append(growing_contrib, fv_ga_i)
    }
    modalities = data.frame(year, no_contrib, fixed_contrib, growing_contrib)
    
    modalities2 = gather(modalities, key="type", value="value", c("no_contrib","fixed_contrib","growing_contrib"))
    modalities2$var = factor(modalities2$type, levels=c("no_contrib","fixed_contrib","growing_contrib"))
      
      
      if (input$facet == "No") {
        graph1 = ggplot(modalities, aes(x = year)) +
        ggtitle("Three Modes of Investing") +
        xlab("Year") + ylab("Value (in Dollars)") +
        geom_line(aes(y= no_contrib, color = "no_contrib")) +
        geom_line(aes(y= fixed_contrib, color ="fixed_contrib")) +
        geom_line(aes(y= growing_contrib, color ="growing_contrib")) 
        graph1
      }
      else {
        graph2 = ggplot(modalities2) +
          ggtitle("Three Modes of Investing") +
          xlab("Year") + ylab("Value (in Dollars)") +
          geom_line(aes(x=year, y=value, color=var)) +
          geom_area(aes(x=year, y=value, fill=var)) +
          facet_wrap(. ~ type)
        graph2
    }
  })
  
#Define Output for table
  output$investment_table = renderTable({
    future_value = function(amount, rate, years) {
      fv = amount * (1 + (rate/100))** years
      return(fv)
    }
    annuity = function(contrib, rate, years) {
      fva = contrib * (((1 + (rate/100) )** years) - 1)/ (rate/100)
      return(fva)
    }
    growing_annuity = function(contrib, rate, growth, years) {
      fvga = contrib * (((1 + (rate/100))** years) - (1 + (growth/100))** years)/ ((rate/100) - (growth/100))
      return(fvga)
    }
    
    year = c()
    no_contrib = c()
    fixed_contrib = c()
    growing_contrib = c()
    
    for (i in 0: input$years) {
      yr = i
      fv_i = future_value(input$initial_amount, input$rate, i)
      fv_a_i = future_value(input$initial_amount, input$rate, i) + annuity(input$add_amount, input$rate, i)
      fv_ga_i = future_value(input$initial_amount, input$rate, i) + growing_annuity(input$add_amount, input$rate,input$growth_rate, i)
      year = append(year, yr)
      no_contrib = append(no_contrib, fv_i)
      fixed_contrib = append(fixed_contrib, fv_a_i)
      growing_contrib = append(growing_contrib, fv_ga_i)
    }
    
    modalities = data.frame(year, no_contrib, fixed_contrib, growing_contrib)
    modalities})

}
# Run the application 
shinyApp(ui = ui, server = server)


