FROM busybox:latest AS builder

ENV JASYPT_VERSION "1.9.3"

ADD https://github.com/jasypt/jasypt/releases/download/jasypt-${JASYPT_VERSION}/jasypt-${JASYPT_VERSION}-dist.zip /

RUN unzip jasypt-${JASYPT_VERSION}-dist.zip
RUN mv /jasypt-${JASYPT_VERSION}/lib/jasypt-${JASYPT_VERSION}.jar /jasypt.jar

FROM openjdk:8-jre-alpine

ENV ALGORITHM PBEWithMD5AndDES
ENV JASYPT_PASSWORD secret
ENV MY_PASSWORD supersecret

COPY --from=builder /jasypt.jar /app/jasypt.jar

# To encrypt using jasypt
CMD java -Djava.security.egd=file:/dev/./urandom -cp /app/jasypt.jar org.jasypt.intf.cli.JasyptPBEStringEncryptionCLI input="$JASYPT_PASSWORD" password="$MY_PASSWORD" algorithm="$ALGORITHM" verbose=false

# To Decrypt using jasypt
#CMD java -Djava.security.egd=file:/dev/./urandom -cp /app/jasypt.jar org.jasypt.intf.cli.JasyptPBEStringDecryptionCLI input="$JASYPT_PASSWORD" password="$MY_PASSWORD" algorithm="$ALGORITHM" verbose=false
