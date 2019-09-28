close_issue <-
  function(issue = NULL) {
    if (is.null(issue)) issue <- rstudioapi::getSourceEditorContext()[["path"]]

    if (!grepl("issues/open/.+\\.md$", issue)) {
      message(issue, " doesn't appear to be an open issue.")
      return(invisible(NULL))
    }

    message("closing ", basename(issue))

    rstudioapi::documentClose(rstudioapi::getSourceEditorContext()[["id"]], save = TRUE)

    filename_new <- here::here("issues", "closed", basename(issue))

    file.rename(issue, filename_new)

    list_issues()

    invisible(filename_new)
  }
