username <-
  function() {
    if (identical(.Platform$OS.type, "windows"))
      Sys.getenv("USERNAME")
    else
      Sys.getenv("USER")
  }

issue_hash <-
  function() {
    digest::digest(paste(Sys.time(), username()), algo = "sha1")
  }

write_utf8 <-
  function(cvec, file = NULL, ...) {
    if (is.null(file)) {
      message("You must specify a file path")
      return(invisible(NULL))
    }

    writeLines(cvec, file(file, encoding = "UTF-8"), ...)
  }

read_utf8 <-
  function(file = NULL, ...) {
    if (is.null(file)) {
      message("You must specify a file path")
      return(invisible(NULL))
    }


    readLines(file(file, encoding = "UTF-8"), ...)

  }

dir_setup <-
  function() {
    if (!dir.exists(d <- here::here("issuer", "open"))) dir.create(d, recursive = T)
    if (!dir.exists(d <- here::here("issuer", "closed"))) dir.create(d, recursive = T)
  }
