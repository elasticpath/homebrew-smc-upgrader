# homebrew-smc-upgrader
`brew` tap for `smc-upgrader`

## Create a release

1. Update `SMC_UPGRADER_VERSION` in `smc-upgrader.rb` to match the new release.
1. Update the `sha256` checksum in `smc-upgrader.rb` to match the checksum of the new release jar.
   This example works for 1.0.0.
   ```
	curl -sL https://github.com/elasticpath/smc-upgrader/releases/download/smc-upgrader-1.0.0/smc-upgrader-1.0.0.zip | sha256sum

   ```
1. Commit the changes and push.
