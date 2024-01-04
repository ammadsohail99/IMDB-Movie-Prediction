library(shiny)
library(shinyWidgets)

# Define the URLs for the movie posters
poster_urls <- c(
  "Pencils vs Pixels" = "https://m.media-amazon.com/images/M/MV5BNDUyODhmOTktNzNhNS00YzZmLTllMzktYTU1MDcxZTQxNDllXkEyXkFqcGdeQXVyMTI1NjI4NjY1._V1_FMjpg_UX1000_.jpg",
  "The Dirty South" = "https://upload.wikimedia.org/wikipedia/en/c/c2/Dirty_south_2023_poster.jpg",
  "The Marvels" = "https://m.media-amazon.com/images/M/MV5BM2U2YWU5NWMtOGI2Ni00MGMwLWFkNjItMjgyZWMxNjllNTMzXkEyXkFqcGdeQXVyMDM2NDM2MQ@@._V1_.jpg",
  "The Holdovers" = "https://m.media-amazon.com/images/M/MV5BNDc2MzNkMjMtZDY5NC00NmQ0LWI1NjctZjRhNWIzZjc4MGRiXkEyXkFqcGdeQXVyMjkwOTAyMDU@._V1_FMjpg_UX1000_.jpg",
  "Next Goal Wins" = "https://m.media-amazon.com/images/M/MV5BNDIwNWQwYTktZGQwYS00NzNjLThhNDMtODBlYmI5N2E0NjM0XkEyXkFqcGdeQXVyMDM2NDM2MQ@@._V1_FMjpg_UX1000_.jpg",
  "Thanksgiving" = "https://m.media-amazon.com/images/M/MV5BOGZhOGJjZTAtOTJmYS00ZTk2LTgxYWEtNjM3ZmUxMjY2NWFiXkEyXkFqcGdeQXVyNjU2NTI4MjE@._V1_.jpg",
  "The Hunger Games: The Ballad of Songbirds and Snakes" = "https://m.media-amazon.com/images/M/MV5BOTZmMmY2MzctMjU2Yy00YjJlLTk1NjAtY2U4MmMxOWZkZWY4XkEyXkFqcGdeQXVyMjM4NTM5NDY@._V1_FMjpg_UX1000_.jpg",
  "Trolls Band Together" = "https://m.media-amazon.com/images/M/MV5BMTY4MDk2YWUtNWY1My00YjAxLWI4ZGQtMmRhN2FiNDI4NDRjXkEyXkFqcGdeQXVyMTUzMTg2ODkz._V1_.jpg",
  "Leo" = "https://m.media-amazon.com/images/M/MV5BZDNiZWI3ZmItMjY4OS00Mjk5LThlNjktMmMwZDM1OTEwOGVmXkEyXkFqcGdeQXVyMDc5ODIzMw@@._V1_QL75_UX190_CR0,0,190,281_.jpg",
  "Dream Scenario" = "https://m.media-amazon.com/images/M/MV5BZDI4MjI1YmYtYzg1Ny00MWQzLWIwNTgtNmFkMWNhYTYzYjdkXkEyXkFqcGdeQXVyMTUzMTg2ODkz._V1_FMjpg_UX1000_.jpg",
  "Wish" = "https://upload.wikimedia.org/wikipedia/en/d/de/WishMoviePoster.jpg",
  "Napoleon" = "https://m.media-amazon.com/images/M/MV5BZWIzNDAxMTktMDMzZS00ZjJmLTlhNjYtOGUxYmZlYzVmOGE4XkEyXkFqcGdeQXVyODk4OTc3MTY@._V1_.jpg"
)

# Predicted movie ratings
predicted_imdb_scores <- c(
  6.774477, 6.147198, 6.539814, 6.528496, 7.496605,
  7.122512, 5.362363, 6.439651, 6.855736, 6.762479,
  7.037649, 8.842437
)

# Ensure the names in the predicted ratings match the names in poster_urls
names(predicted_imdb_scores) <- names(poster_urls)

ui <- fluidPage(
  tags$head(
    tags$style(HTML("
      body {
        background-color: #f3f3f3;
        font-family: 'Arial', sans-serif;
      }
      .container {
        max-width: 1200px;
        margin: auto;
        display: flex;
        flex-wrap: wrap;
        justify-content: center;
      }
      .poster-container {
        perspective: 1000px;
        margin: 15px;
        cursor: pointer;
        box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
        transition: 0.3s;
      }
      .poster-container:hover {
        box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);
      }
      .poster-card {
        width: 200px;
        height: 300px;
        transition: 0.6s;
        transform-style: preserve-3d;
        position: relative;
      }
      .poster-card.flip .poster-card-inner {
        transform: rotateY(180deg);
      }
      .poster-card-inner {
        width: 100%;
        height: 100%;
        transition: transform 0.6s;
        transform-style: preserve-3d;
      }
      .poster, .poster-details {
        position: absolute;
        width: 100%;
        height: 100%;
        backface-visibility: hidden;
        border-radius: 10px;
      }
      .poster {
        background-size: cover;
        background-position: center;
        opacity: 0.9;
        filter: blur(1px);
      }
      .poster-details {
        background: white;
        color: black;
        transform: rotateY(180deg);
        display: flex;
        align-items: center;
        justify-content: center;
        flex-direction: column;
        font-weight: bold;
        font-size: 1.1em;
      }
      .title-panel {
        background-color: #333;
        color: white;
        text-align: center;
        padding: 20px 0;
        margin-bottom: 30px;
      }
      h1 {
        margin: 0;
      }
    ")),
    tags$script(HTML("
      $(document).on('click', '.poster-card', function(){
        $(this).toggleClass('flip');
      });
    "))
  ),
  div(class="title-panel",
      h1("IMDB Movie Ratings November 2023")
  ),
  div(class = "container",
      uiOutput("posters")
  )
)

server <- function(input, output) {
  output$posters <- renderUI({
    movie_names <- names(poster_urls)
    movie_cards <- lapply(movie_names, function(movie_name) {
      div(class = "poster-container",
          div(class = "poster-card",
              div(class = "poster-card-inner",
                  div(class = "poster", style = sprintf("background-image: url('%s');", poster_urls[movie_name])),
                  div(class = "poster-details",
                      h3(movie_name),
                      p(sprintf("Rating: %.1f", predicted_imdb_scores[movie_name]))
                  )
              )
          )
      )
    })
    do.call(tagList, movie_cards)
  })
}

shinyApp(ui, server)