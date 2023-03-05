FROM alpine:3.16

RUN apk add --no-cache go hugo git make perl
RUN go install github.com/jackyzha0/hugo-obsidian@latest
ENV PATH="/root/go/bin:$PATH"
ENV HUGO_BASEURL=${SECRET_HUGO_BASEURL}
ENV HUGO_PORT=${SECRET_HUGO_PORT}
ENV HUGO_APPENDPORT=false
RUN git clone https://github.com/mohjohfox/quartz-blog /quartz

WORKDIR /quartz

CMD ["make", "serve"]
