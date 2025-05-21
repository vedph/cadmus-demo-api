# Cadmus Demo API

🐋 Quick Docker image build:

  docker buildx build . --platform linux/amd64,linux/arm64,windows/amd64 -t vedph2020/cadmus-demo-api:0.0.2 -t vedph2020/cadmus-demo-api:latest --push

(replace with the current version).

This is a Cadmus API layer customized for the demo project. Most of its code is derived from [shared Cadmus libraries](https://github.com/vedph/cadmus-api).

The demo project just includes some shared models to let you play with a more realistic Cadmus project. Still, its taxonomies are fake and incomplete, and the models used are just examples.

## History

### 0.0.2

- 2025-05-21: updated packages.

### 0.0.1

- 2025-05-15: updated packages.
- 2025-05-02:
  - updated packages (migration V3).
  - updated preview profile.
- 2025-04-30: updated packages and thesauri.
