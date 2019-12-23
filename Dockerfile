FROM python:2.7-slim
MAINTAINER Damián Silvani <munshkr@gmail.com>

ENV LANG=C.UTF-8 \
    DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
        ca-certificates \
        unzip \
        wget \
    && rm -rf /var/lib/apt/lists/*

ENV TROOP_COMMIT_SHA=81ba76f45987dedb04b59b68e6307700f9ac8c65

RUN wget https://github.com/Qirky/Troop/archive/${TROOP_COMMIT_SHA}.zip -O troop.zip \
  && unzip -d troop troop.zip \
  && mv troop/Troop-${TROOP_COMMIT_SHA}/* troop/ \
  && rm -rf troop/Troop-${TROOP_COMMIT_SHA} \
  && rm troop.zip

EXPOSE 57890

ENTRYPOINT ["/usr/bin/env", "python", "troop/run-server.py"]
