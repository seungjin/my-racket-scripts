# [Choice] Debian OS version (use bookworm, or bullseye on local arm64/Apple Silicon): bookworm, buster, bullseye
ARG VARIANT="bookworm"
ARG RACKET_INSTALLER_CHECKSUM="f73a5a1f4c3d5ef77f401d1e2e3f3294ad7d9075ff6fe8a16489c1eee91cd81c"
FROM rust:${VARIANT}

RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    # Remove imagemagick due to https://security-tracker.debian.org/tracker/CVE-2019-10131
    && apt-get purge -y imagemagick imagemagick-6-common

# [Optional] Uncomment this section to install additional OS packages.
# RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
#     && apt-get -y install --no-install-recommends <your-package-list-here>

RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
     && apt-get -y install --no-install-recommends $(cat packages | grep "^[^#;]")

## Install racket
RUN curl https://download.racket-lang.org/releases/8.13/installers/racket-minimal-8.13-x86_64-linux-cs.sh
RUN if $(echo "$RACKET_INSTALLER_CHECKSUM racket-minimal-8.13-x86_64-linux-cs.sh" | sha256sum --check --status) || [ $? -eq 0  ]; \
    then $(/bin/bash racket-minimal-8.13-x86_64-linux-cs.sh --unix-style --create-dir --dest /usr/local) ; fi
RUN rm -fr racket-minimal-8.13-x86_64-linux-cs.sh



