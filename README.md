# DITA Bootstrap CSS Theme Switcher

<a href="https://www.dita-ot.org"><img src="https://www.dita-ot.org/images/dita-ot-logo.svg" align="right" height="55"></a>

[![license](https://img.shields.io/github/license/jason-fox/fox.jason.theme-switcher.svg)](http://www.apache.org/licenses/LICENSE-2.0)
[![DITA-OT 4.2](https://img.shields.io/badge/DITA--OT-4.2-green.svg)](http://www.dita-ot.org/4.2)

_DITA Bootstrap CSS Theme Switcher_ is a [DITA Open Toolkit plug-in](https://www.dita-ot.org/plugins) that extends the [DITA Bootstrap](https://infotexture.github.io/dita-bootstrap/) HTML output to add a switch mechanism for the CSS theme.

<!-- MarkdownTOC levels="2,3" -->

- [Installation](#installation)
  - [Installing DITA-OT](#installing-dita-ot)
  - [Installing the Plug-in](#installing-the-plug-in)
- [Usage](#usage)
- [License](#license)

<!-- /MarkdownTOC -->

## Installation

The _DITA Bootstrap CSS Theme Switcher_ plug-in has been tested with [DITA-OT 4.x](http://www.dita-ot.org/download). Use the latest version for best results.

### Installing DITA-OT

1.  Download the latest distribution package from the project website at
    [dita-ot.org/download](https://www.dita-ot.org/download).
2.  Extract the contents of the package to the directory where you want to install DITA-OT.
3.  **Optional**: Add the absolute path for the `bin` directory to the _PATH_ system variable.

    This defines the necessary environment variable to run the `dita` command from the command line.

See the [DITA-OT documentation](https://www.dita-ot.org/4.0/topics/installing-client.html) for detailed installation instructions.

```console
curl -LO https://github.com/dita-ot/dita-ot/releases/download/4.2/dita-ot-4.2.zip
unzip -q dita-ot-4.2.zip
rm dita-ot-4.2.zip
```

### Installing the Plug-in

- Run the plug-in installation commands:

```console
dita install https://github.com/jason-fox/fox.jason.extend.css/archive/master.zip
dita install https://github.com/dita-bootstrap/dita-bootstrap/archive/develop.zip
dita install https://github.com/dita-bootstrap/dita-bootstrap.theme-switcher/archive/develop.zip
```

## Usage

To add a switch to the header menu, include a list item with a `<button>`
with a `data-bs-css-href` attribute as shown. `data-bs-css-href` holds the link to the Bootstrap CSS.


```xml
<li>
  <button
    type="button"
    class="dropdown-item d-flex align-items-center"
    data-bs-css-href="https://cdn.jsdelivr.net/npm/bootswatch@5.3.3/dist/zephyr/bootstrap.min.css"
  >
    Zephyr
  </button>
</li>
```


To run, use the `html5-bootstrap` transformation and add the `css.theme.switcher` parameter.

```console
PATH_TO_DITA_OT/bin/dita -f html5-bootstrap -o out -i PATH_TO_DITAMAP \
  --css.theme.switcher=yes
```


## License

[Apache 2.0](LICENSE) © 2023 - 2024 Jason Fox

