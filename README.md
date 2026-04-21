# 🦞 OpenClaw for ClawCloud

<p align="center">
  <img src="https://openclaw.ai/logo.svg" alt="OpenClaw" width="120">
</p>

<p align="center">
  <strong>Personal AI Assistant Gateway</strong><br>
  Deploy OpenClaw on ClawCloud with persistent storage support
</p>

---

## 🚀 Quick Start

```bash
docker run -d \
  --name openclaw \
  -p 18789:18789 \
  -e OPENCLAW_GATEWAY_BIND=lan \
  -e OPENCLAW_GATEWAY_TOKEN=your-secure-token \
  -v openclaw-data:/data/openclaw \
  meshpotato/openclaw:latest \
  node openclaw.mjs gateway --allow-unconfigured
```

---

## 📋 Environment Variables

### Required

| Variable | Example Value | Description |
|----------|---------------|-------------|
| `OPENCLAW_GATEWAY_TOKEN` | `your-secure-token-here` | Authentication token |
| `OPENCLAW_STATE_DIR` | `/data/openclaw` | Persistent volume mount path |

### Recommended

| Variable | Default | Example Value | Description |
|----------|---------|---------------|-------------|
| `OPENCLAW_GATEWAY_BIND` | `loopback` | `lan` | Bind mode: `lan` (0.0.0.0) or `loopback` (127.0.0.1) |
| `OPENCLAW_GATEWAY_PORT` | `18789` | `18789` | Gateway port |
| `OPENCLAW_HOME` | `/home/node` | `/data/openclaw` | Home directory |

### Build-time Variables (for reference)

| Variable | Purpose |
|----------|---------|
| `OPENCLAW_IMAGE` | Use a remote image instead of building locally |
| `OPENCLAW_DOCKER_APT_PACKAGES` | Install extra apt packages during build (space-separated) |
| `OPENCLAW_EXTENSIONS` | Pre-install extension deps at build time (space-separated) |
| `OPENCLAW_EXTRA_MOUNTS` | Extra host bind mounts (comma-separated `source:target[:opts]`) |
| `OPENCLAW_HOME_VOLUME` | Persist `/home/node` in a named Docker volume |
| `OPENCLAW_SANDBOX` | Opt in to sandbox bootstrap (`1`, `true`, `yes`, `on`) |
| `OPENCLAW_DOCKER_SOCKET` | Override Docker socket path |

---

## 💾 Persistent Storage

```
Mount Point: /data/openclaw
```

### What Gets Stored

| Directory | Purpose |
|-----------|---------|
| `openclaw.json` | Gateway configuration |
| `agents/` | Agent state & sessions |
| `credentials/` | Channel/provider credentials |
| `media/` | Uploaded files |
| `extensions/` | Installed plugins |
| `workspace/` | Agent workspace |

### ClawCloud Volume Settings

| Container Path | Volume Name | Size |
|---------------|-------------|------|
| `/data/openclaw` | `openclaw-data` | **2GB+** |

---

## 🔍 Health Checks

```bash
# Liveness
curl http://localhost:18789/healthz

# Readiness
curl http://localhost:18789/readyz
```

---

## ⚙️ ClawCloud Configuration

### Environment Variables

```
OPENCLAW_GATEWAY_BIND=lan
OPENCLAW_GATEWAY_TOKEN=<your-secure-token>
OPENCLAW_STATE_DIR=/data/openclaw
```

### Startup Command

```bash
node openclaw.mjs gateway --allow-unconfigured
```

---

## 🖥️ Initial Setup

1. Open `http://<your-container>:18789/` in browser
2. Enter your `OPENCLAW_GATEWAY_TOKEN`
3. Complete the onboarding wizard:
   - Add AI provider API key
   - Configure messaging channels (optional)

---

## 📱 Supported Channels

After deployment, configure channels:

- **WhatsApp** - QR code login
- **Telegram** - Bot token
- **Discord** - Bot token
- **Slack** - App credentials
- **Matrix**, **Signal**, **iMessage**, and more...

---

## 🔧 Troubleshooting

### Container Exits Immediately

```bash
# Check health
curl http://localhost:18789/healthz

# Check logs
docker logs openclaw
```

### Permission Denied

- Ensure persistent volume is properly mounted
- Run container as root (default in this image)

### Configuration Lost

- Verify `OPENCLAW_STATE_DIR` is set correctly
- Check persistent volume is attached

---

## 📚 Documentation

- [OpenClaw Docs](https://docs.openclaw.ai)
- [Getting Started](https://docs.openclaw.ai/getting-started)
- [Configuration](https://docs.openclaw.ai/configuration)
- [Channels](https://docs.openclaw.ai/channels)

---

## 🤖 CI/CD

### Auto Deploy (Recommended)

Images are built automatically when OpenClaw releases a new stable version.

- Runs every 6 hours to check for new releases
- Builds and pushes to DockerHub automatically
- Creates a GitHub Release

### Manual Deploy

1. Go to [Actions](https://github.com/Frozen12/openclaw-clawcloud/actions)
2. Click "Deploy to DockerHub"
3. Enter version (e.g., `2026.4.20`)
4. Click "Run workflow"

---

## 📦 Image Tags

| Tag | Description |
|-----|-------------|
| `latest` | Most recent build |
| `2026.4.20` | Specific version (year.month.day) |

---

## ❓ FAQ

### Where are pnpm/uv caches stored?

The image disables Node.js compile cache (`NODE_DISABLE_COMPILE_CACHE=1`) to stay within ClawCloud's 100MB ephemeral storage limit. All persistent data is stored in the mounted volume at `/data/openclaw`.

---

<p align="center">
  <a href="https://github.com/openclaw/openclaw">
    <img src="https://img.shields.io/badge/Source-OpenClaw-blue?style=flat-square">
  </a>
  <a href="https://discord.gg/openclaw">
    <img src="https://img.shields.io/badge/Discord-Join-purple?style=flat-square">
  </a>
</p>