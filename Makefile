.PHONY: all clean javadoc

GRADLE = ./gradlew
WORKER = build/install/sysmo-worker

release: clean
	@ git submodule update --init
	@ cd deps/pping; go build pping.go
	@ $(GRADLE) installDist
	@ mkdir $(WORKER)/etc
	@ mkdir $(WORKER)/ruby
	@ mkdir $(WORKER)/utils
	@ cp deps/pping/pping $(WORKER)/utils/
	@ cp deps/nchecks/defs/*.rb $(WORKER)/ruby/
	@ tar czvf sysmo-worker.tar.gz $(WORKER)
	@ echo "\n Release ready"

go_build:


clean:
	@ cd deps/pping; go clean pping.go
	@ $(GRADLE) clean
	@ rm -f sysmo-worker.tar.gz

doc:
	@ $(GRADLE) javadoc
