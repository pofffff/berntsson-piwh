from fastapi import FastAPI

app = FastAPI(title="raspberry-hub")


@app.get("/health")
async def health() -> dict:
    return {"status": "ok"}
