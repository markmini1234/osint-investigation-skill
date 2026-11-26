# OSINT Investigation Skill

Authorized OSINT investigation workflow for Codex and other skill-compatible coding agents.

This skill combines:

- a scope and evidence workflow for username, email, domain, phone, organization, and public-profile investigations;
- a catalog of 29 specialist OSINT tools;
- public-platform collection commands adapted from [agent-reach](https://github.com/Panniantong/Agent-Reach);
- source logging, confidence levels, identity-attribution checks, and report templates.

The tool catalog is based on [osinttools.beacon.host](https://osinttools.beacon.host/). The skill does not bundle credentials, cookies, API keys, or personal data.

## Features

### Scope gate before any collection
Every investigation starts by confirming the exact target, the question to answer, the lawful basis, the allowed actions (passive only, or also crawling/enumeration/contact), and where findings are stored. Self-audits of your own assets need only one confirmation; third-party targets need all five items, recorded in `scope.yaml`. If the target is a private person with no lawful basis, the skill stops and offers safer alternatives.

### 29 specialist tools in four levels
| Level | Focus | Tools |
|---|---|---|
| 1 | Usernames and public profiles | OSINT Framework, Sherlock, Maigret, social-analyzer, Blackbird, socialscan |
| 2 | Emails and phones | holehe, h8mail, GHunt, Mosint, Have I Been Pwned, PhoneInfoga, Ignorant |
| 3 | Domains, history, files | theHarvester, Amass, waybackurls, gau, waymore, Wayback Machine, crt.sh, ExifTool, Photon |
| 4 | Internet-wide search and frameworks | Shodan, Censys, urlscan.io, SpiderFoot, Recon-ng, Maltego Community, sn0int |

A quick-reference table marks which tools are passive, which need keys or logins, and which send traffic to the target. Active tools need explicit per-run confirmation.

### Public-platform collection
Commands adapted from agent-reach cover web pages and search (Jina Reader, Exa), X/Twitter, Reddit, GitHub, YouTube, Bilibili, WeChat articles, Weibo, Xiaohongshu, Douyin, V2EX, Xiaoyuzhou podcasts, Xueqiu, LinkedIn and RSS. Unavailable channels are logged as gaps, never presented as checked. A 403, CAPTCHA or login wall is treated as a stop signal.

### Verification rules
- A username hit is not an identity; a breach or registration hit is not ownership.
- Attribution needs at least two independent signals.
- Observed fact, source claim and inference are kept separate.
- Negative results are recorded as findings.

### Evidence and reporting
A four-level confidence rubric (confirmed, probable, possible, unverified), an attribution checklist, a source log with URL, retrieval time and exact excerpt, and a findings-memo template. `scripts/init_case.sh` generates the case folder in one command.

### Chinese-language triggers
The skill also activates on requests such as 背调, 尽调, 查账号, 查域名, 查邮箱, 小红书, 微博 and B站.

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

## Case folder

For third-party or multi-step work, create a case folder with the four templates (`scope.yaml`, `sources.csv`, `notes.md`, `report.md`):

```bash
bash scripts/init_case.sh CASE_NAME [BASE_DIR]
```

Self-audits of your own assets only need a single confirmation of target and ownership.

## Dependencies

Platform collection depends on the `agent-reach` skill; run `agent-reach doctor` at the start of each investigation. Planning and reporting work without external tools. Collection channels need the relevant executables, for example:

```bash
agent-reach doctor
command -v mcporter gh yt-dlp bird
```

Some channels require a login, cookies, API key, or paid service. The skill records unavailable channels as gaps rather than fabricating results.

## Login sessions

Use only your own accounts and sessions, and only to read public content. Never use a session to view a target's private content, contact a target, or bypass a login wall.

## Boundaries

Use this skill only for your own accounts, authorized security work, lawful due diligence, journalism, fraud/incident response, or other legitimate purposes. Do not use it for stalking, doxxing, harassment, covert surveillance, credential theft, login bypass, or redistributing breached personal data.

Public availability does not automatically make processing lawful. This skill is not legal advice.
