.PHONY: all clean javadoc

GRADLE = ./gradlew

all:
	$(GRADLE) installDist

clean:
	$(GRADLE) clean

doc:
	$(GRADLE) javadoc
