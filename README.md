# drosam/homebrew-tap

Homebrew formulae and casks by [@drosam](https://github.com/drosam).

```sh
brew install drosam/tap/hyperkey
brew services start hyperkey

brew install --cask drosam/tap/gitpulse
```

## Formulae

| Formula | Description |
| --- | --- |
| [hyperkey](https://github.com/drosam/hyperkey) | Turn caps lock into a hyper key on macOS |

## Casks

| Cask | Description |
| --- | --- |
| [gitpulse](https://github.com/drosam/gitpulse) | Track your GitHub pull requests and review requests from the macOS menu bar |

GitPulse is not notarized. The cask removes the quarantine flag on install, so it opens without a Gatekeeper prompt.

## Updating and removing

```sh
brew upgrade hyperkey
brew upgrade --cask gitpulse

brew uninstall --zap --cask gitpulse
```

## Troubleshooting

**`Refusing to load ... from untrusted tap`.** Homebrew 6 only loads third-party taps you trust. Run `brew trust drosam/tap`, then retry.

Formulae and casks are bumped automatically by each project's release workflow.
