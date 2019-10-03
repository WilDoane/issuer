search_issues <-
  function(target =
             rstudioapi::showPrompt(
               "Search Issues",
               "Issue matches (regular expressions supported):"
             )
  ) {

    if (is.null(target)) {
      message("You must provide a search expression to search issues.")
      return(invisible(NULL))
    }

    open <- list.files(here::here("issuer", "open"), "\\.md$", full.names = TRUE)
    closed <- list.files(here::here("issuer", "closed"), "\\.md$", full.names = TRUE)

    if (length(open) + length(closed) == 0) {
      message("No issues found.")
      return(invisible(NULL))
    }

    filenames <- c(open, closed)

    filenames <-
      Filter(function(filename) {
        any(grepl(target, read_utf8(filename, warn = FALSE)))
      },
      filenames)

    if (length(filenames) == 0) {
      message("No matching issues found.")
      return(invisible(NULL))
    }

    issues <- sapply(filenames, read_utf8, n = 1)

    markers <-
      data.frame(
        type = "info",
        file = filenames,
        line = 1L,
        column = 1L,
        message = issues,
        stringsAsFactors = FALSE
      )

    rstudioapi::sourceMarkers(
      "Issuer",
      markers,
      basePath = here::here("issuer")
    )

    invisible(NULL)
  }
