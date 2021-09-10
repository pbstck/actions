# Pubstack Actions

Github actions to initialize various environments.

## Get Stage
### Description
Returns the environment depending on the current GITHUB_REF
It follows theses rules:
  - If the branch name is main or master => dev
  - If it's a tag with format YYYY-MM-DDTHH-mm-SSZ-beta => beta
  - If it's a tag with format YYYY-MM-DDTHH-mm-SSZ-prod => prod
### Usage
```yaml
  get_stage:
    outputs:
      target_env: ${{ steps.get_current_stage.outputs.target_env }}
    runs-on: ubuntu-latest
    steps:
      - uses: pbstck/actions/get-stage@v1
        id: get_current_stage
```

## Setup Cloud
### Description
It login to Gsuite artifactory and AWS CLI

### Usage
`- uses: pbstck/actions/setup-cloud@v1`

Make sur you have those environment variables (please use Secrets for storing them):
```yaml
env:
  AWS_DEFAULT_REGION: "eu-west-1"
  AWS_ACCESS_KEY_ID: ${{ secrets.CICD_TOOLING_FULL_ACCESS_KEY }}
  AWS_SECRET_ACCESS_KEY: ${{ secrets.CICD_TOOLING_FULL_ACCESS_SECRET }}
  CICD_ARTIFACTORY_KEY: ${{ secrets.CICD_ARTIFACTORY_KEY }}
```
## Setup Go
### Description
Install go with the desired version and cache go mod.
Caches the following directories:
- `~/.cache/go-build`
- `~/go/pkg/mod`

### Usage
```yaml
- uses: pbstck/actions/setup-go@v1
  with:
   go-version: '1.14.2'
```

## Setup Rust
### Description
Install Rust with the desired version and cache rust and target's project
You can specify the version with an input `rust-version`. If It's not provided there's a default values : `1.53.0`
Caches the following directories:
* `~/.cargo/bin/`
* `~/.cargo/registry/index/`
* `~/.cargo/registry/cache/`
* `~/.cargo/git/db/`
* `target/`

### Usage
```yaml
- name: Setup Rust
  uses: pbstck/actions/setup-rust@v1
    with:
    rust-version: '1.53.0'
```
## Setup Yarn
### Description
Install nodejs and yarn with the desired version and cache yarn's cache and node_module's project.
You can specify the version with an input `node-version`. If It's not provided there's a default values : `14.x`

### Usage
```yaml
- uses: pbstck/actions/setup-yarn@v1
```