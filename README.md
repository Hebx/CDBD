# CDBD SPL Token

The CoinDashboard Utility Token

### Prerequisites

Node.js [node](<[https://github.com/nvm-sh/nvm](https://nodejs.org/en)>)

Solana Tool Suite [solana](https://docs.solana.com/cli/install-solana-cli-tools).

Anchor [anchor](https://www.anchor-lang.com/docs/installation).

```
rustup --version
rustc --version
cargo --version
solang --version
```

### To build

```sh
git clone git@github.com:hebx/cdbd.git
cd cdbd
npm install
```

- set your wallet keypair path in `anchor.toml` file
- Start a local Solana node

```sh
solana-test-validator
```

- Build the anchor project

```sh
anchor build
```

- Fetch the project ID for the build:

```sh
anchor deploy
```

- Update the project ID in the solidity program and anchor.toml file and run command.

```sh
anchor build
```

- Run the tests

```sh
anchor test
```
