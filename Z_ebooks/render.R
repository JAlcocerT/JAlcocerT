args <- commandArgs(trailingOnly = TRUE)

# very small arg parser
get_arg <- function(flag, default = NULL) {
  i <- match(flag, args)
  if (!is.na(i) && i < length(args)) args[i + 1] else default
}

input  <- get_arg("--input",  "x-rmd/example.Rmd")
output <- get_arg("--output", "x-rmd/example.pdf")
cover  <- get_arg("--cover",  NA)

if (is.na(cover) || !file.exists(cover)) {
  stop(paste0("Cover image not found: ", cover, "\nPass --cover /path/to/cover.png"))
}

# Normalize key paths
abs_input <- normalizePath(input, mustWork = TRUE)
abs_output_dir <- normalizePath(dirname(output), mustWork = FALSE)
abs_output_file <- basename(output)
abs_cover <- normalizePath(cover, mustWork = TRUE)

# Ensure output dir exists
dir.create(abs_output_dir, recursive = TRUE, showWarnings = FALSE)

# Generate a cover.tex that uses the preamble's \FullPageCover
cover_tex_path <- file.path(abs_output_dir, "cover.tex")
writeLines(c(
  "\\newgeometry{margin=0mm}",
  sprintf("\\FullPageCover{%s}", abs_cover),
  "\\restoregeometry"
), con = cover_tex_path)

# Ensure packages
if (!requireNamespace("rmarkdown", quietly = TRUE)) install.packages("rmarkdown", repos = "https://cloud.r-project.org")
if (!requireNamespace("tinytex", quietly = TRUE)) install.packages("tinytex", repos = "https://cloud.r-project.org")
if (!tinytex::is_tinytex()) tinytex::install_tinytex()

# Absolute path to preamble (relative to repo root)
preamble_path <- normalizePath("Z_ebooks/preamble.tex", mustWork = TRUE)

# Render
rmarkdown::render(
  input = abs_input,
  output_file = abs_output_file,
  output_dir = abs_output_dir,
  output_format = rmarkdown::pdf_document(
    latex_engine = "xelatex",
    pandoc_args = c(
      "--variable", "papersize:a4",
      "--variable", "geometry:margin=25mm"
    ),
    includes = rmarkdown::includes(
      in_header   = preamble_path,
      before_body = cover_tex_path
    )
  ),
  clean = TRUE,
  envir = new.env(parent = globalenv())
)

cat(sprintf("\nWrote PDF to: %s\n", normalizePath(file.path(abs_output_dir, abs_output_file))))