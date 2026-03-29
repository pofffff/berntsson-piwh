# berntsson-piwh

Baby monitor system with a Raspberry Pi WH.

- **`babymonitor/`** — Flutter mobile app (iOS & Android)
- **`raspberry-hub/`** — Python server running on the Raspberry Pi

---

## Prerequisites

- [Flutter](https://docs.flutter.dev/get-started/install)
- Python 3.11+
- A Raspberry Pi with camera and microphone

---

## Setup

### 1. Clone and configure secrets

```bash
git clone <repo-url>
cd berntsson-piwh
cp .env.example .env
```

Edit `.env` with your Pi's hostname, credentials, and WiFi info.

```bash
cp babymonitor/.env.example babymonitor/.env
```

Edit `babymonitor/.env` — set `HUB_HOST=localhost` for local dev or the Pi's IP for real hardware.

### 2. Backend

```bash
make backend-install   # install Python dependencies
make backend-run       # start the server at http://localhost:8000
```

### 3. Flutter app

```bash
cd babymonitor
flutter pub get        # install dependencies
cd ..
make app-run           # run the app on a connected device or simulator
```

---

## Development

Run backend and app against `localhost` — no Pi needed.

```bash
# Terminal 1
make backend-run

# Terminal 2 — from babymonitor/
flutter run
```

---

## Deploy to Raspberry Pi

```bash
make deploy   # rsync + restart service on Pi
make ssh-pi   # open SSH session to Pi
```

---

## Tests

```bash
make backend-test   # pytest
make app-test       # flutter test
```
