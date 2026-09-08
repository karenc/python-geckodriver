ARG base_image=python:3.14
FROM $base_image

ARG firefox_version=140.15.0esr
ENV FIREFOX_VERSION=$firefox_version
ARG TARGETPLATFORM
ENV TARGETPLATFORM=$TARGETPLATFORM

RUN apt-get update -y && \
    apt-get install -y python3-dev gcc
RUN FIREFOX_PLATFORM=$(bash -c 'if [[ "$TARGETPLATFORM" == "linux/arm64" ]]; then echo "linux-aarch64"; else echo "linux-x86_64"; fi') && \
    wget "https://ftp.mozilla.org/pub/firefox/releases/$FIREFOX_VERSION/$FIREFOX_PLATFORM/en-US/firefox-$FIREFOX_VERSION.deb" && \
    dpkg -i firefox-$FIREFOX_VERSION.deb || apt-get -f -y install && dpkg --configure -a && \
    rm firefox-$FIREFOX_VERSION.deb
RUN GECKODRIVER_PLATFORM=$(bash -c 'if [[ "$TARGETPLATFORM" == "linux/arm64" ]]; then echo "linux-aarch64"; else echo "linux64"; fi') && \
    wget "https://github.com/mozilla/geckodriver/releases/download/v0.37.1/geckodriver-v0.37.1-$GECKODRIVER_PLATFORM.tar.gz" && \
    tar xf geckodriver*.tar.gz && \
    rm geckodriver*.tar.gz
