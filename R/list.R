list_issues <-
  function() {
    open <- list.files(here::here("issues", "open"), "\\.md$", full.names = TRUE)
    closed <- list.files(here::here("issues", "closed"), "\\.md$", full.names = TRUE)

    issues <- sapply(open, read_utf8, n = 1)

    names(issues) <- NULL

    markers <-
      data.frame(
        type = "info",
        file = open,
        line = 1L,
        column = 1L,
        message = issues,
        stringsAsFactors = FALSE
      )

    rstudioapi::sourceMarkers(
      "Issues (Local)",
      markers,
      basePath = here::here("issues", "open")
    )
  }
