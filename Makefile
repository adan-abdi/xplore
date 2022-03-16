.PHONY: generate
generate:
	flutter pub run build_runner build --delete-conflicting-outputs 
	
.PHONY: sort
sort:
	flutter pub run import_sorter:main