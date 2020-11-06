library(shiny)
shinyUI(fluidPage(titlePanel("Projectile Motion Equation Solver"),
                  sidebarLayout( sidebarPanel(helpText("This app calculates various parameters of a projectile based on the initial condition"),
                                              sliderInput("theta",label = h6("Pick the angle of projection"),
                                                          5,90,value = 30,step = 5),
                                              numericInput("velocity", label = h6("Enter the projectile velocity (in m/s)"),
                                                            value = 10),
                                              actionButton("compute", label = "Compute"),
                  ),   
                                 
                                 mainPanel(
                                   tabsetPanel(
                                     tabPanel("Output",
                                              p(h5("Your entered values:")), textOutput("t_theta"),
                                              textOutput("t_velocity"),
                                              p(h5("Calculated values:")),
                                              textOutput("t_range"), textOutput("t_tof"), textOutput("t_height")
                                     ),
                                     tabPanel("Documentation",
                                              p(h4("Projectile Motion Solver:")),
                                              helpText("This application computes and returns various parameters of a projectile like range, tof, max height, etc."),
                                              HTML("<u><b>Formulae for Computation: </b></u>
                                              <br> <br>
                                              <b> Range = u<sup>2</sup>sin(2*theta)/g </b>
                                              <br>
                                              <b> TOF = 2u*sin(theta)/g </b>
                                              <br>
                                              <b> Max. Height = u<sup>2</sup>*sin<sup>2</sup>(theta)/2g </b>
                                              <br>
                                              <br>
                                              where: <br>
                                              u = Initial Velocity <br>
                                              theta = Angle of projection <br>
                                              g = Acceleration due to gravity <br>"
                                              )                
                                     )
                                   )
                                 )
                  )
))