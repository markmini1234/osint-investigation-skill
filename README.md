# OSINT Investigation Skill

Authorized OSINT investigation workflow for Codex and other skill-compatible coding agents.

This skill combines:

- a scope and evidence workflow for username, email, domain, phone, organization, and public-profile investigations;
- a catalog of 29 specialist OSINT tools;
- public-platform collection commands adapted from [agent-reach](https://github.com/Panniantong/Agent-Reach);
- source logging, confidence levels, identity-attribution checks, and report templates.

The tool catalog is based on [osinttools.beacon.host](https://osinttools.beacon.host/). The skill does not bundle credentials, cookies, API keys, or personal data.

## Install

Clone this repository directly into the Codex skills directory:

```bash
git clone https://github.com/markmini1234/osint-investigation-skill.git \
  ~/.codex/skills/osint-investigation
```

If your agent loads skills from `~/.agents/skills`, clone there instead:

```bash
git clone https://github.com/markmini1234/osint-investigation-skill.git \
  ~/.agents/skills/osint-investigation
```

Start a new agent session, then invoke it as `$osint-investigation` or describe an authorized OSINT task naturally.

## Use

The skill starts with a scope gate. Before collecting anything, it asks for the exact target, the question, the lawful basis, the allowed actions, and the data-handling boundary.

It then routes work through:

1. passive public sources;
2. platform collection;
3. specialist CLI/API tools;
4. source verification and confidence scoring;
5. a findings memo or case folder.

Read [SKILL.md](SKILL.md) for the operating rules. Detailed material is split into:

- [references/collection.md](references/collection.md) — public-platform commands;
- [references/toolchain.md](references/toolchain.md) — 29-tool catalog;
- [references/evidence.md](references/evidence.md) — scope, source log, confidence, and report templates.

## Optional dependencies

Planning and reporting work without external tools. Collection channels need the relevant executables, for example:

```bash
agent-reach doctor
command -v mcporter gh yt-dlp bird
```

Some channels require a login, cookies, API key, or paid service. The skill records unavailable channels as gaps rather than fabricating results.

## Boundaries

Use this skill only for your own accounts, authorized security work, lawful due diligence, journalism, fraud/incident response, or other legitimate purposes. Do not use it for stalking, doxxing, harassment, covert surveillance, credential theft, login bypass, or redistributing breached personal data.

Public availability does not automatically make processing lawful. This skill is not legal advice.
