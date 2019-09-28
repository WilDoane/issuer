open_issue <-
  function(title = rstudioapi::showPrompt("Open Issue", "Issue Title")) {
  if (is.null(title)) {
    message("You must provide a title in order to open an issue.")
    return(invisible(NULL))
  }

dir_setup()

hash <- issue_hash()
filename <- here::here("issuer", "open", paste0(hash, ".md"))

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
