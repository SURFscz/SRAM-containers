# Etherpad Lite Dockerfile
#
# https://github.com/ether/etherpad-lite
#
# Author: muxator

FROM etherpad/etherpad
# plugins to install while building the container. By default no plugins are
# installed.
# If given a value, it has to be a space-separated, quoted list of plugin names.
#
# EXAMPLE:
#   ETHERPAD_PLUGINS="ep_codepad ep_author_neat"
ARG ETHERPAD_PLUGINS=ep_headerauth

ARG EP_DIR=/opt/etherpad-lite

USER etherpad

WORKDIR "${EP_DIR}"

RUN bin/installDeps.sh && rm -rf ~/.npm && rm -rf ~/.local && rm -rf ~/.cache && \
    if [ ! -z "${ETHERPAD_PLUGINS}" ]; then \
        pnpm run plugins i ${ETHERPAD_PLUGINS}; \
    fi

# EXPOSE 9001
# CMD ["node", "src/node/server.js"]
