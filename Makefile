SHELL := /bin/zsh -l

# ── Backend ────────────────────────────────────────────────────────────────────

backend-install:
	cd raspberry-hub && pip install -e ".[dev]"

backend-run:
	cd raspberry-hub && uvicorn src.main:app --reload --port $$(grep BACKEND_PORT .env | cut -d= -f2)

backend-test:
	cd raspberry-hub && pytest

# ── Flutter ────────────────────────────────────────────────────────────────────

app-install:
	cd babymonitor && flutter pub get

app-run:
	cd babymonitor && flutter run

app-test:
	cd babymonitor && flutter test

# ── Pi deployment ──────────────────────────────────────────────────────────────

deploy:
	$(eval include .env)
	rsync -av --exclude='.venv' --exclude='__pycache__' \
		raspberry-hub/ $(PI_USER)@$(PI_HOST):~/raspberry-hub
	ssh $(PI_USER)@$(PI_HOST) "cd ~/raspberry-hub && pip install -e . && sudo systemctl restart raspberry-hub"

ssh-pi:
	$(eval include .env)
	ssh $(PI_USER)@$(PI_HOST)
