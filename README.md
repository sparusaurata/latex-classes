# Some personal (Xe)LaTeX classes


The **rcarticle** class is intended for articles.
Some dependencies:
- TeX engine: XeLaTeX
- Fonts: Libertinus Serif, Libertinus Math and Fira Sans
- Bibliography: BibLaTeX

The **rcbeamer** class is intended for presentations. It is based upon the
[Metropolis](https://github.com/matze/mtheme) theme.
Some dependencies:
- TeX engine: XeLaTeX
- Fonts: Fira Sans, Fira Math and STIX Two Math

The **rcposter** class is intended for posters. It is based upon the
[Ti*k*Zposter](https://ctan.org/pkg/tikzposter) class.
Some dependencies:
- TeX engine: XeLaTeX
- Fonts: Fira Sans, Fira Math and STIX Two Math


## Examples

To run the examples, run:

```sh
$ xelatex -synctex=1 rcarticle-example
$ xelatex -synctex=1 rcbeamer-example
$ xelatex -synctex=1 rcposter-example
```

You can also use `latexmk`:

```sh
$ latexmk
```
