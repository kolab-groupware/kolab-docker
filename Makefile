clean:
	for container in $$(docker ps -q); do \
		docker kill $$container ; \
	done
	for container in $$(docker ps -aq); do \
		docker rm $$container ; \
	done
	for image in $$(docker images -q --filter dangling=true); do \
		docker rmi $$image ; \
	done

pull:
	for image in $$(find . -mindepth 2 -maxdepth 2 -type f -name "Dockerfile" -exec dirname {} \; | sort); do \
		docker pull kolab/$$(basename $$image) ; \
	done

push:
	for image in $$(find . -mindepth 2 -maxdepth 2 -type f -name "Dockerfile" -exec dirname {} \; | sort); do \
		docker push kolab/$$(basename $$image) ; \
	done

all:
	for image in $$(find . -mindepth 2 -maxdepth 2 -type f -name "Dockerfile" -exec dirname {} \; | sort); do \
		docker build -t kolab/$$(basename $$image) $$image ; \
	done
