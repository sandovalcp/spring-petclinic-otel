# Usa uma imagem oficial do Java 21 como base
FROM eclipse-temurin:21-jre-alpine

# Cria o diretório da aplicação
WORKDIR /app

# Copia os arquivos locais para dentro da imagem Docker
COPY spring-petclinic-4.0.0-SNAPSHOT.jar app.jar
COPY opentelemetry-javaagent.jar opentelemetry-javaagent.jar

# Expõe a porta padrão do Spring Boot
EXPOSE 8080

# Executa o Spring Boot já passando o agente do OpenTelemetry
ENTRYPOINT ["java", "-javaagent:/app/opentelemetry-javaagent.jar", "-jar", "/app/app.jar"]


