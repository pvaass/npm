FROM node:10

LABEL version="1.0.0"
LABEL repository="http://github.com/actions/npm"
LABEL homepage="http://github.com/actions/npm"
LABEL maintainer="GitHub Actions <support+actions@github.com>"

LABEL com.github.actions.name="GitHub Action for npm"
LABEL com.github.actions.description="Wraps the npm CLI to enable common npm commands."
LABEL com.github.actions.icon="package"
LABEL com.github.actions.color="red"
COPY LICENSE README.md THIRD_PARTY_NOTICE.md /
RUN apt-get update && \
    apt-get install -y xvfb libgtk2.0-0 libnotify-dev libgconf-2-4 libnss3 libxss1 libasound2 \
    && apt-get clean && apt-get autoremove
COPY "entrypoint.sh" "/entrypoint.sh"
ENTRYPOINT ["/entrypoint.sh"]
CMD ["help"]
