FROM node:10

RUN npm i -g gulp@4.0.2 yo @microsoft/generator-sharepoint@1.11.0

VOLUME /usr/src/app
WORKDIR /usr/src/app
RUN useradd --create-home --shell /bin/bash app && \
  usermod -aG sudo app && \
  chown -R app:app /usr/src/app

USER app

EXPOSE 5432 4321 35729

CMD /bin/bash
