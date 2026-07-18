# homebrew-tap

> [!IMPORTANT]
> This tap is retired. The `macosdb` and `pinprick` casks have moved to
> [`starhaven-io/tap`](https://github.com/starhaven-io/homebrew-tap).

Existing installs need no action: [`tap_migrations.json`](tap_migrations.json)
redirects both casks, so `brew update` migrates them to `starhaven-io/tap`
automatically and `brew upgrade` keeps them current. Leave this tap in place
until that migration has run, then remove it:

```sh
brew untap p-linnane/tap
```

To install from the new tap directly:

```sh
brew tap starhaven-io/tap
```

## License

This tap is licensed under the [MIT License](LICENSE).
