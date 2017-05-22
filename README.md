# bash-crawler

> Get a site links with bash

## Requirements

1. Get all the links from a website
2. For each link, get all links of the page

## Usage

```bash
$ crawler <site>

  Usage
    $ crawler [options] <site>

  Options
    --depth,    -d  Depth of the links searched   5
    --help,     -h  Prints this helps             false
    --list,     -l  Print a list formatted output false
    --verbose,  -v  Verbose output                false

  Examples
    $ crawler -d 5 www.github.com
```

## Tests

Tests were made using [bats][bats] framework, to run tests type:

```bash
$ bats --tap crawler.bats
```

## License

[MIT](/LICENSE)

[bats]: https://github.com/sstephenson/bats
