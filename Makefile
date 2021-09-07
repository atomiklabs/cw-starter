build:
	sh scripts/build_release.sh

test:
	cd integration && \
	make test
