# CONTRIBUTING.md

> Building the pdf requires pandoc.

- Don't hyperlink anything that appears in the table-of-content.
  * Reason: Those links get messed up in the final pdf.

- After you're done with your edits, use `make` to build the pdf and
  verify that everything looks nice.

## Building pdf files

You can build other pdf version of the guide for languages other than
english. For instance, to build the french version:

    make pdf-lang GUIDE_LANG=fr

This will output a `tutorial-fr.pdf` file.

Currently the repository provides a `guide-*.md` file for the following
languages:

 Language   | Parameter
 ---------: | -------------
 German     | `GUIDE_LANG=de`
 Greek      | `GUIDE_LANG=el`
 Spanish    | `GUIDE_LANG=es`
 French     | `GUIDE_LANG=fr`
 Italian    | `GUIDE_LANG=it`
 Portuguese | `GUIDE_LANG=pt`
 Turkish    | `GUIDE_LANG=tr`
 Russian    | `GUIDE_LANG=ru`
 Hungarian  | `GUIDE_LANG=hu`
