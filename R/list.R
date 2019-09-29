list_issues <-
  function() {
    open <- list.files(here::here("issuer", "open"), "\\.md$", full.names = TRUE)
    closed <- list.files(here::here("issuer", "closed"), "\\.md$", full.names = TRUE)

    if (length(open) + length(closed) == 0) {
      message("No issues found.")
      return(invisible(NULL))
    }

    filenames <- c(open, closed)

    issues <- sapply(filenames, read_utf8, n = 1)

    names(issues) <- NULL

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
