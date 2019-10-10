issr_delete_closed_issues <-
  function() {
    confirmed <- rstudioapi::showQuestion(
      "Permanently Delete All Closed Issues",
      "Are you sure?",
      ok = "Delete",
      cancel = "Keep"
    )

    if (confirmed) {
      closed <- list.files(here::here("issuer", "closed"), "\\.md$", full.names = TRUE)

      unlink(closed)

      issr_list_issues()
    }

    invisible(NULL)
  }
