# 🦞 OpenClaw for ClawCloud

<p align="center">
  <img src="https://openclaw.ai/logo.svg" alt="OpenClaw" width="120">
</p>

<p align="center">
  <strong>Personal AI Assistant Gateway</strong>
</p>

---

## 📋 Environment Variables

```
OPENCLAW_GATEWAY_BIND=lan
OPENCLAW_GATEWAY_TOKEN=your-secure-token
OPENCLAW_STATE_DIR=/data/openclaw
OPENCLAW_HOME=/data/openclaw
OPENCLAW_GATEWAY_PORT=18789
```

### Startup Command

```
node openclaw.mjs gateway --allow-unconfigured
```

---

## 💾 Persistent Storage

```
Mount Point: /data/openclaw
Size: 2GB+
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

### Runtime Locations

| Type | Location |
|------|----------|
| **App Data** | `/app/` (in image) |
| **User Data** | `/data/openclaw` (persistent volume) |
| **pnpm store** | `$OPENCLAW_HOME/.local/share/pnpm` |
| **npm cache** | `$OPENCLAW_HOME/.npm` |
| **uv cache** | `$OPENCLAW_HOME/.cache/uv` |

---

## 🔍 Health Checks

```
GET /healthz
GET /readyz
```

---

## ⚙️ ClawCloud Setup

| Container Path | Volume Name | Size |
|---------------|-------------|------|
| `/data/openclaw` | `openclaw-data` | **2GB+** |

---

## 🖥️ Initial Setup

1. Open `http://<container>:18789/` in browser
2. Enter `OPENCLAW_GATEWAY_TOKEN`
3. Complete the onboarding wizard

---

## 📱 Supported Channels

WhatsApp, Telegram, Discord, Slack, Matrix, Signal, iMessage, and more...

---

## 🔧 Troubleshooting

### Container Exits

```
curl http://localhost:18789/healthz
```

### Configuration Lost

Verify `OPENCLAW_STATE_DIR=/data/openclaw` and persistent volume is attached.

---

## 🤖 CI/CD

### Auto Deploy

Images are built automatically when OpenClaw releases a new version.

### Manual Deploy

1. Go to [Actions](https://github.com/Frozen12/openclaw-clawcloud/actions)
2. Click "Deploy to DockerHub"
3. Enter version (e.g., `2026.4.20`)

---

## 📦 Image Tags

| Tag | Description |
|-----|-------------|
| `latest` | Most recent build |
| `2026.4.20` | Specific version |

---

## 📚 Documentation

- [OpenClaw Docs](https://docs.openclaw.ai)
- [Getting Started](https://docs.openclaw.ai/getting-started)
- [Configuration](https://docs.openclaw.ai/configuration)

---

<p align="center">
  <a href="https://github.com/openclaw/openclaw">Source</a>
  <a href="https://discord.gg/openclaw">Discord</a>
</p>