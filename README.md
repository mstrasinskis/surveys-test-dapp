# DRAFT: surveys-test-dapp
- 🚧 Running survey feature -- under construction

## Initial Steps
- source [create-ic-app/template-svelte-ts](https://github.com/MioQuispe/create-ic-app/tree/main/template-svelte-ts)
- dfx canister create surveys
- dfx generate
- add generated types to tsconfig/compilerOptions/pathes/"canister/surveys"

## Canister test
- dfx deploy
- dfx canister call surveys get
