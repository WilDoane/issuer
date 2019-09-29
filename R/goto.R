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

    text <- read_utf8(issue)

    ref <- which(grepl("^While viewing: ", text))

    ref <- gsub("^While viewing: ", "", text[ref])

    filename <- unlist(strsplit(ref, "@"))[1]
    line <- unlist(strsplit(ref, "@"))[2]

    rstudioapi::navigateToFile(filename, line, column = 1)

    invisible(NULL)
  }
