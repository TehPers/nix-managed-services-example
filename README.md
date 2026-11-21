# Example Nix-managed services

This repository contains a sample Nix flake for running Postgres and Adminer. It only exists to show how to create and run preconfigured services that can be shared via a flake (which could be accessed through a Git repository, for example).

To run the services, use `nix run .#<name>`, where `<name>` is either `postgres` or `adminer`. This requires the experimental `nix-command` and `flakes` features to be enabled.

Each services is its own derivation defined under [`packages`](./packages/). They take an existing service, wrap it in a bash script that sets up the environment and runs the service, then expose those as derivations in the flake's `packages`.

For the sake of simplicity, this repository uses `writeShellApplication`. For additional reproducibility, the services could be updated to use `resholve` instead.
