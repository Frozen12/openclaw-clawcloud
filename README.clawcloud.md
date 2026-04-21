# OpenClaw on ClawCloud

Deploy OpenClaw, a personal AI assistant gateway, on your ClawCloud container.

## Prerequisites

- A ClawCloud account with container deployment enabled
- Persistent storage volume attached
- API credentials for your preferred AI provider (OpenAI, Anthropic, etc.)

---

## Deployment

### 1. Pull the Image

Use the Docker image from DockerHub:

```
meshpotato/openclaw:latest
```

### 2. Configure Environment Variables

Set these in your ClawCloud dashboard:

| Variable | Required | Description |
|----------|----------|-------------|
| `OPENCLAW_GATEWAY_BIND` | Yes | Set to `lan` for external access |
| `OPENCLAW_GATEWAY_TOKEN` | Yes | Generate a secure token |
| `OPENCLAW_STATE_DIR` | Yes | Persistent volume mount path |

#### Recommended Settings

```
OPENCLAW_GATEWAY_BIND=lan
OPENCLAW_GATEWAY_TOKEN=<your-secure-token>
OPENCLAW_STATE_DIR=/data/openclaw
```

### 3. Mount Persistent Storage

Mount at: `/data/openclaw`

Stores: `openclaw.json`, `agents/`, `credentials/`, `media/`, `extensions/`

### 4. Startup Command

```bash
node openclaw.mjs gateway --allow-unconfigured
```

---

## Health Checks

```
GET http://<container>:18789/healthz
GET http://<container>:18789/readyz
```

---

## Initial Setup

1. Open `http://<container>:18789/` in browser
2. Enter `OPENCLAW_GATEWAY_TOKEN`
3. Complete onboarding wizard

---

## Troubleshooting

### Container Exits Immediately
- Check `curl http://localhost:18789/healthz`
- Verify `OPENCLAW_GATEWAY_TOKEN` is set
- Check persistent volume mount

### Permission Denied
- Image runs as root for ClawCloud compatibility

### Configuration Lost
- Mount persistent volume to `/data/openclaw`
- Set `OPENCLAW_STATE_DIR=/data/openclaw`

---

## Documentation

- [OpenClaw Docs](https://docs.openclaw.ai)
- [Getting Started](https://docs.openclaw.ai/getting-started)
- [Configuration](https://docs.openclaw.ai/configuration)