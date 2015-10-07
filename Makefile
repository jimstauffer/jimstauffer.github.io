all : clean build

clean :
	-@docker stop `docker ps -q` 2>/dev/null || true
	-@docker rm `docker ps -aq` 2>/dev/null || true
	-@docker rmi `docker images -aq` 2>/dev/null || true

build :
	docker build --rm -t jimstauffer .

run start : 
	-@docker stop jimstauffer
	-@docker rm jimstauffer
	docker run --name jimstauffer -p 8015:8000 --rm -t -v $(CURDIR):/jimstauffer jimstauffer &
#docker run -p 8015:8000 --rm -t -v $(CURDIR):/jimstauffer jimstauffer &

shell :
	docker run --rm -t -i -v $(CURDIR):/jimstauffer jimstauffer /bin/bash -l

exec :
	docker exec -t -i jimstauffer /bin/bash -l

stop :
	-@docker stop jimstauffer

init_docker :
	boot2docker up
	$(boot2docker shellinit)
