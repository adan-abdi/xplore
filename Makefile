# Project short scripts

.PHONY: generate
generate:
	flutter pub run build_runner build --delete-conflicting-outputs 
	
.PHONY: formatSort
sort:
	flutter format lib/ && \
	flutter format test/ && \
	flutter pub run import_sorter:main

.PHONY: buildReleaseArtefacts
release:
	flutter build apk && flutter build appbundle && eytool -printcert -jarfile /home/adan/Projects/live/shamiri/shamiri/build/app/outputs/bundle/release/app-release.aab

.PHONY: syncRemote
syncRemote:
	git checkout master && \
	git branch | grep -v "master" | xargs git branch -D && \
	git pull origin master