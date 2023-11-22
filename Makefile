
prep:
	@echo cleanup and dir creation
	./prep.sh

containers:
	@echo Starting the containers
	docker-compose up -d

addlatency:
	@echo add latency
	./latency.sh

uksetup:
	@echo Starting uk
	./uksetup.sh uk1 a
	./route.sh uk1

ukxsetup:
	./route.sh uk2
	./route.sh uk3
	./ukxsetup.sh uk2 b
	./ukxsetup.sh uk3 c

ausetup:
	@echo Starting au
	./ausetup.sh au1 a

auxsetup.sh:
	./auxsetup.sh au2 b
	./auxsetup.sh au3 c

zasetup:
	@echo Starting za
	./route.sh za1
	./zasetup.sh za1 a

zaxsetup:
	./route.sh za2
	./route.sh za3
	./zaxsetup.sh za2 b
	./zaxsetup.sh za3 c

clean:
	docker compose down

local:
	./local.sh
all: prep containers uksetup zasetup ukxsetup zaxsetup addlatency
