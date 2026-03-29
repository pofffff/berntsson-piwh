# AGENTS.md

Guidelines for AI agents working in this repository.

---

## Project Overview

A baby monitor system consisting of:
- **`babymonitor/`** — Flutter mobile app (iOS & Android)
- **`raspberry-hub/`** — Python server running on a Raspberry Pi

The Pi handles camera and microphone capture and exposes a streaming API. The Flutter app connects to the Pi over a local network (home WiFi, mobile hotspot, or Pi access point mode).

---

## Repository Structure

```
/
├── babymonitor/                # Flutter application
│   ├── lib/
│   │   ├── core/               # Shared utilities, constants, error types
│   │   ├── design/             # Design tokens, theme, typography, colors
│   │   └── features/           # One folder per feature
│   │       └── <feature>/
│   │           ├── data/       # Repository implementations, data sources, DTOs
│   │           ├── domain/     # Entities, use cases, repository interfaces
│   │           └── presentation/ # Pages, widgets, state management
│   └── test/
│       └── features/<feature>/ # Mirrors lib/features structure
│
├── raspberry-hub/              # Python server (runs on Raspberry Pi)
│   ├── src/
│   │   ├── api/                # Route handlers, request/response schemas
│   │   ├── domain/             # Business logic, use cases, domain models
│   │   ├── infrastructure/     # Hardware access: camera, microphone, GPIO
│   │   └── services/           # Application services wiring domain + infra
│   └── tests/
│       └── <mirrors src/>
│
├── AGENTS.md
└── README.md
```

---

## General Principles

- **Clean architecture**: dependencies point inward. `domain` has no knowledge of `data`, `api`, or `infrastructure`.
- **Clean code**: small focused functions, meaningful names, no magic numbers, no dead code.
- **Test everything non-trivial**: aim for unit tests on domain/business logic, integration tests on boundaries.
- **No premature abstractions**: only generalize when there are two or more real uses. One-off helpers live inline.
- **No extra features**: implement exactly what is asked. Do not add configuration options, fallbacks, or convenience wrappers that were not requested.

---

## Flutter App

### Architecture

Follow feature-first clean architecture:

- **`domain/`** — pure Dart, no Flutter imports. Contains:
  - Entities (plain data classes)
  - Repository interfaces (abstract classes)
  - Use cases (single-responsibility classes with a `call()` method)
- **`data/`** — implements domain interfaces. Contains:
  - Repository implementations
  - Data sources (HTTP, WebSocket, local storage)
  - DTOs with `fromJson`/`toJson`
- **`presentation/`** — Flutter widgets and state. Contains:
  - Pages (screen-level widgets)
  - Widgets (reusable UI components)
  - State management (prefer Riverpod or Bloc — pick one and stay consistent)

### Design Tokens

All visual constants live in `lib/design/tokens.dart`. No hardcoded colors, sizes, spacing, or typography anywhere else in the codebase.

Tokens are organized into:
- `AppColors` — all color values
- `AppSpacing` — spacing scale (e.g. `xs`, `sm`, `md`, `lg`, `xl`)
- `AppTypography` — text styles and font sizes
- `AppRadius` — border radius values
- `AppDurations` — animation durations

The app theme (`lib/design/theme.dart`) is built from tokens. Widgets use tokens directly or via the theme — never raw values like `Color(0xFF...)` or `EdgeInsets.all(16)`.

### Testing

- Unit test all use cases in `domain/`
- Unit test repository implementations with mocked data sources
- Widget test pages and complex widgets
- Use `mocktail` for mocking
- Test file mirrors the source path: `test/features/camera/domain/use_cases/start_stream_test.dart`

### Code Style

- Follow [Effective Dart](https://dart.dev/effective-dart)
- Prefer `const` constructors wherever possible
- Use `sealed` classes for result/error types
- No `dynamic` types
- All public APIs have doc comments

---

## Python Backend

### Architecture

Follow layered clean architecture:

- **`domain/`** — pure Python, no framework imports. Contains:
  - Domain models (dataclasses)
  - Use case functions or classes
  - Repository/service interfaces (abstract base classes)
- **`infrastructure/`** — hardware and OS access. Contains:
  - Camera capture (picamera2 or v4l2)
  - Microphone capture (pyaudio)
  - Any GPIO or hardware-specific code
- **`api/`** — HTTP and WebSocket route handlers (FastAPI). Thin layer: validates input, calls a use case, returns response.
- **`services/`** — wires domain + infrastructure together. No business logic here.

### Framework

Use **FastAPI** with **uvicorn**.

### Testing

- Use `pytest`
- Unit test domain logic with no framework or hardware dependencies
- Mock hardware in infrastructure tests
- Use `pytest-asyncio` for async tests
- Tests mirror `src/` structure under `tests/`

### Code Style

- Follow PEP 8
- Use type hints everywhere
- Use `dataclasses` or `pydantic` models for data
- No mutable global state
- Functions do one thing

---

## What Not To Do

- Do not add logging, metrics, or error reporting unless explicitly asked
- Do not add environment-based config switches unless explicitly asked
- Do not create base classes or mixins for a single subclass
- Do not write comments that restate what the code does — only comment *why*
- Do not add `TODO` or `FIXME` comments — raise them with the user instead
