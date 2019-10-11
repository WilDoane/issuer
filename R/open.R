issr_open_issue <-
  function(title = rstudioapi::showPrompt("Open Issue", "Title for New Issue:")) {
    if (is.null(title)) {
      message("You must provide a title in order to open an issue.")
      return(invisible(NULL))
    }

    issr_dir_setup()

    hash <- issr_issue_hash()
    filename <- here::here("issuer", "open", glue::glue(hash, ".md"))

    sec <- rstudioapi::getSourceEditorContext()

    if (is.null(sec)) {
      source_filename <- "an_unknown_document"

      source_loc <- 0
    } else {
      source_filename <-
        gsub(
          glue::glue("^", here::here(), "/"),
          "",
          normalizePath(
            sec[["path"]],
            winslash = "/",
            mustWork = FALSE
          )
        )

      if (source_filename == "") source_filename <- "an_unknown_document"

      source_loc <- sec$selection[[1]]$range$start[1]
    }


    issue <-
      glue::glue(
        "{title}\n",
        "\nOpened by: {issr_username()}",
        "\nOpened at: {Sys.time()}",
        "\nWhile viewing: {source_filename}@{source_loc}",
        "\n\nDetail:\n",
        sep = "\n\n",
        .trim = FALSE
      )

    issr_write_utf8(issue, filename)

    issr_list_issues()

    rstudioapi::navigateToFile(filename, line = 9, column = 1)

    return(invisible(filename))

  }
