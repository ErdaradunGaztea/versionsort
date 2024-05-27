compare_components <- function(e1, e2) {
  
}

codes <- sample(letter_versions)
components <- strsplit(codes, "[^\\w]+", perl = TRUE)
components <- lapply(seq_len(max(lengths(components))), function(position) {
  nth_components <- vapply(
    components, `[`, FUN.VALUE = character(1), position
  )
  initial_number_match <- regexpr("^\\d+", nth_components)
  list(
    # Initial numbers
    as.numeric(substring(nth_components, 1, attr(
      initial_number_match, "match.length", exact = TRUE)
    )),
    # Rest of the code
    substring(nth_components, 1 + attr(
      initial_number_match, "match.length", exact = TRUE)
    )
  )
})
components <- unlist(components, recursive = FALSE)

codes[do.call(order, c(components, na.last = FALSE))]
