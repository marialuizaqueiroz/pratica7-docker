# Stage de configuração
FROM ubuntu:latest as builder
ARG GIT_TOKEN
RUN apt-get update && apt-get install -y git
RUN git config --global user.name "usuario_test"
RUN git config --global user.token ${GIT_TOKEN}

# Stage final
FROM ubuntu:latest
RUN apt-get update && apt-get install -y git
COPY --from=builder /root/.gitconfig /root/.gitconfig