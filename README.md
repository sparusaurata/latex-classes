# Some personal (Xe)LaTeX classes


The **rcarticle** class is intended for articles.

The **rcbeamer** class is intended for presentations. It is based upon the
[Metropolis](https://github.com/matze/mtheme) theme.

The **rcposter** class is intended for posters. It is based upon the
[Ti*k*Zposter](https://ctan.org/pkg/tikzposter) class.


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
