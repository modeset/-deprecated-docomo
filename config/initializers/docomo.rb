Docomo.setup do |config|

  # Root
  #
  # The root path for docomo to use for various file operations.  Docomo will attempt to locate many files, including
  # the template and markdown files using this as it's primary source root path -- falling back to the engine path when
  # a file isn't found.
  config.root = Rails.root

  # Title
  #
  # The title is used in the generated html, but if you customize the template you may not need this -- it's intended
  # to provide an easy way to adjust the template without having to override it entirely.
  config.title = "Docomo Documentation"

  # Template Filename
  #
  # The path and filename for the template used when generating the documentation.  It's assumed to be haml (for now.)
  config.template_filename = "app/views/layouts/docomo.html.haml"

  # Output Path
  #
  # You can change where Docomo generates the output files.  By default this is into your public path, but you could
  # use whatever seems appropriate.
  config.output_path = "public/docomo"

  # Manifest Matcher
  #
  # This is used to glob files that should be parsed into the Docomo generated content.  These are relative to the root
  # configuration set above, and supports wildcard matchers (calls Dir.glob on each item in the array.)
  config.manifest_matcher = ["app/assets/**/*.md", "lib/assets/**/*.md"]

  # Use Pygments
  #
  # By default pygments (http://pygments.org/) support is disabled, as this can drastically slow down documentation
  # generation.  You can enable it if you want to get pygments highlighting on your code sections.
  config.use_pygments = false

  # Markdown Options
  #
  # These are the standard markdown options that we use.
  config.markdown_options = {
    autolink: true,
    no_intra_emphasis: true,
    tables: true,
    fenced_code_blocks: true,
    lax_html_blocks: true,
    strikethrough: true,
    superscript: true,
    space_after_headers: true
  }

end
