# -------------------------------------------------------------------------------------
# Nautobot App Developement Dockerfile Template
# Version: 1.1.0
#
# Apps that need to add additional steps or packages can do in the section below.
# -------------------------------------------------------------------------------------
# !!! USE CAUTION WHEN MODIFYING LINES BELOW

# Accepts a desired Nautobot version as build argument, default to 1.6.0
ARG NAUTOBOT_VER="1.6.0"

# Accepts a desired Python version as build argument, default to 3.11
ARG PYTHON_VER="3.11"

# Retrieve published development image of Nautobot base which should include most CI dependencies
FROM ghcr.io/nautobot/nautobot-dev:${NAUTOBOT_VER}-py${PYTHON_VER}

# Runtime argument and environment setup
ARG NAUTOBOT_ROOT=/opt/nautobot

ENV prometheus_multiproc_dir=/prom_cache
ENV NAUTOBOT_ROOT=${NAUTOBOT_ROOT}
ENV INVOKE_NAUTOBOT_DB_DUMPS_LOCAL=true

COPY development/nautobot_config.py ${NAUTOBOT_ROOT}/nautobot_config.py
