library(shiny)
shinyServer(function(input, output) {
    ans <- reactiveValues()
    # Calculate the interest and amount    
    observe({
        input$compute
        ans$range <- round(isolate({
            input$velocity * input$velocity * sin(2*pi/180*input$theta) / 9.8 }),4)
        ans$tof <- round(isolate({2 * input$velocity * sin(pi/180*input$theta) / 9.8}),4)
        ans$height <- round(isolate({(input$velocity)^2 * (sin(pi/180*input$theta)^2) / (2* 9.8)}),4)
    })
    
    # Display ans entered
    output$t_velocity <- renderText({
        paste("Projectile Velocity: ", isolate(input$velocity),"m/s")
    })
    
    output$t_theta <- renderText({
        paste("Angle of projection: ", isolate(input$theta),"deg")
    })
    
    output$t_range <- renderText({
        if(input$compute == 0) ""
        else
        paste("Range of Projectile: ", isolate(ans$range), "metres")
    })
    
    output$t_tof <- renderText({
        if(input$compute == 0) ""
        else
        paste("Time of Flight:", ans$tof, "secs")
    })
    
    output$t_height <- renderText({
        if(input$compute == 0) ""
        else
            paste("Max Height of Projectile:", ans$height, "metres")
    })
    
})