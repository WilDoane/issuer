issr_close_issue <-
  function(issue = NULL) {
    if (is.null(issue)) issue <- rstudioapi::getSourceEditorContext()[["path"]]

    if (!grepl("issuer/open/.+\\.md$", issue)) {
      message(issue, " doesn't appear to be an open issue.")
      return(invisible(NULL))
    }

    rstudioapi::documentClose(rstudioapi::getSourceEditorContext()[["id"]], save = TRUE)

    filename_new <- here::here("issuer", "closed", basename(issue))

    file.rename(issue, filename_new)

    issr_list_issues()

    invisible(filename_new)
  }
