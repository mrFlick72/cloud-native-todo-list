build:
	rm static; \
	cd frontend; \
	npm install; \
	npm run-script build; \
	cd ..; \
	docker build --tag mrflick72/todo-list-website:latest .
