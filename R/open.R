open_issue <-
  function() {
    if (!dir.exists(t <- here::here("issues", "open"))) dir.create(t, recursive = T))
    if (!dir.exists(t <- here::here("issues", "closed")) dir.create(t, recursive = T))

    hash <- issue_hash()
    filename <- here::here("issues", "open", paste0(hash, ".md"))

    title <- rstudioapi::showPrompt(
      "Open Issue",
      "Issue Title"
    )

    if (!is.null(title)) {
      issue <-
        paste0(
          title,
          "\nOpened by: ",
          username(),
          "\nWhile viewing: ",
          basename(rstudioapi::getSourceEditorContext()[["path"]]),
          "@",
          rstudioapi::getSourceEditorContext()$selection[[1]]$range$start[1],
          "\n\nDetail:\n\n"
        )

      write_utf8(issue, filename)

      list_issues()

      rstudioapi::navigateToFile(filename, line = 7, column = 1)

      return(invisible(filename))
    }

    invisible(NULL)
  }
