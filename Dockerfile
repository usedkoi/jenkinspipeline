FROM bellsoft/liberica-openjdk-alpine:17

# 빌드 단계
RUN ./gradlew clean build

# 결과 JAR 파일 복사
ARG JAR_FILE=build/libs/*.jar
COPY ${JAR_FILE} app.jar

# 포트 노출
EXPOSE 8080

# 앱 실행
ENTRYPOINT ["java", "-jar", "app.jar"]