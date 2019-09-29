goto_reference <-
  function(issue = NULL) {
    if (is.null(issue)) issue <- rstudioapi::getSourceEditorContext()[["path"]]

    # if (is.null(target)) {
    #   message("You must provide a search expression to search issues.")
    #   return(invisible(NULL))
    # }

    if (!grepl("issuer/(open|closed)/.+\\.md$", issue)) {
      message(issue, " doesn't appear to be an issue ticket.")
      return(invisible(NULL))
    }

    text <- rstudioapi::getSourceEditorContext()[["contents"]]

    ref <- which(grepl("^While viewing: ", text))

    if (length(ref) == 0) {
      message(issue, " doesn't appear to contain a source file reference.")
      return(invisible(NULL))
    }

    ref <- gsub("^While viewing: ", "", text[ref])

    filename <- unlist(strsplit(ref, "@"))[1]
    line <- unlist(strsplit(ref, "@"))[2]

    if (!file.exists(here::here(filename))) {
      message(filename, " doesn't appear to exist.")
      return(invisible(NULL))
    }

    rstudioapi::navigateToFile(here::here(filename), line, column = 1)

    invisible(NULL)
  }
