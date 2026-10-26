# Scala Dockerfile for testing examples
FROM hseeberger/scala-sbt:8u222_1.3.5_2.13.1

WORKDIR /app

COPY jeff/scala/. /app/jeff/scala/

CMD ["bash", "/app/jeff/scala/test-scala.sh"]
