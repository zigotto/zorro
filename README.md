# Zorro

## Installation

    $ gem install zorro

## Usage

Without `.zorro.yml`

    $ zorro bitbucket --account zigotto --repo zorro
    $ zorro bitbucket --account zigotto --repo zorro --open branches
    $ zorro bitbucket --account zigotto --repo zorro --open pulls
    $ zorro bitbucket --account zigotto --repo zorro --open source

With `.zorro.yml`

```
bitbucket:
  :account: zigotto
  :repo: zorro
  :open: root
trello:
  :id: zZxXxXpt
```

    $ zorro
    $ zorro -o branches
    $ zorro -o pulls
    $ zorro -o source

## Contributing

1. Fork it ( https://github.com/zigotto/zorro/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
