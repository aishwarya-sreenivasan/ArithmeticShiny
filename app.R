
library(shiny)

ui <- fluidPage(
  titlePanel("Let's Do Arithmetic!"),
  sidebarLayout(
    sidebarPanel(
      numericInput(inputId = "number1",
                   label = "Number 1",
                   value = 0),
      numericInput(inputId = "number2",
                   label = "Number 2",
                   value = 0),
      actionButton("btn_add", "Add"),
      actionButton("btn_mul", "Multiply")
    ),
    mainPanel(
      verbatimTextOutput("result")
    )
  )
)

server <- function(input, output, session) {
    result_val <- reactiveVal(NULL)
    observeEvent(input$btn_add, {
    res <- input$number1 + input$number2
    result_val(res)
  })
    observeEvent(input$btn_mul, {
    res <- input$number1 * input$number2
    result_val(res)
  })
  output$result <- renderText({
    rv <- result_val()
    if (is.null(rv)) {
      "Select a function"
    } else {
      paste("Result:", rv)
    }
  })
}

shinyApp(ui, server)


