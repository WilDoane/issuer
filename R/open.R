open_issue <-
  function(title = rstudioapi::showPrompt("Open Issue", "Issue Title")) {
    if (is.null(title)) {
      message("You must provide a title in order to open an issue.")
      return(invisible(NULL))
    }

    dir_setup()

    hash <- issue_hash()
    filename <- here::here("issuer", "open", paste0(hash, ".md"))

    source_filename <-
      gsub(
        paste0("^", here::here(), "/"),
        "",
        normalizePath(
          rstudioapi::getSourceEditorContext()[["path"]]
        )
      )

    issue <-
      paste0(
        title,
        "\n\nOpened by: ",
        username(),
        "\nOpened at: ",
        Sys.time(),
        "\nWhile viewing: ",
        source_filename,
        "@",
        rstudioapi::getSourceEditorContext()$selection[[1]]$range$start[1],
        "\n\nDetail:\n\n"
      )

    write_utf8(issue, filename)

    list_issues()

    rstudioapi::navigateToFile(filename, line = 9, column = 1)

    return(invisible(filename))

  }
