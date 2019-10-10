issr_username <-
  function() {
    if (identical(.Platform$OS.type, "windows"))
      Sys.getenv("USERNAME")
    else
      Sys.getenv("USER")
  }

issr_issue_hash <-
  function() {
    digest::digest(paste(Sys.time(), issr_username()), algo = "sha1")
  }

issr_write_utf8 <-
  function(cvec, file = NULL, ...) {
    if (is.null(file)) {
      message("You must specify a file path")
      return(invisible(NULL))
    }

    con <- file(file, encoding = "UTF-8")
    writeLines(cvec, con, ...)
    close(con)

    invisible(NULL)
  }

issr_read_utf8 <-
  function(file = NULL, ...) {
    if (is.null(file)) {
      message("You must specify a file path")
      return(invisible(NULL))
    }

    con <- file(file, encoding = "UTF-8")
    lines <- readLines(con, ...)
    close(con)

    lines
  }

issr_dir_setup <-
  function() {
    if (!dir.exists(d <- here::here("issuer", "open"))) dir.create(d, recursive = T)
    if (!dir.exists(d <- here::here("issuer", "closed"))) dir.create(d, recursive = T)
  }
