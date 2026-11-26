---
name: osint-investigation
description: Plan and run authorized OSINT investigations for a username, email, domain, phone, organization, or public profile. Combines public-platform collection with a specialist tool catalog, source logging, and verification rules. Use for security research, due diligence, fraud triage, brand protection, journalism, or self-audit; requires a lawful basis and explicit scope, and must not be used for stalking, doxxing, or harassment.
metadata:
  short-description: Authorized OSINT workflow and toolchain
---

# OSINT Investigation

Combine public-platform collection with a disciplined investigation workflow: scope, passive collection, pivots, verification, and evidence. The objective is a defensible answer, not maximum data collection.

## Gate on scope

Before collecting, confirm:

- **Target**: the exact username, email, domain, phone, organization, or URL.
- **Question**: the claim or decision the investigation should inform.
- **Lawful basis**: ownership, written authorization, a client engagement, public-interest journalism, fraud/incident response, or another applicable basis.
- **Allowed actions**: passive public-source review only, or also active enumeration/crawling? May anyone be contacted?
- **Handling**: where findings will be stored and who can see them.

If the target is a private person and no lawful basis is stated, stop. OSINT tools do not create permission. Offer a safer path: self-check, own-account audit, defensive review, or reporting to the platform or authorities.

Do not help locate, monitor, expose, or profile a person for stalking, harassment, doxxing, intimate-partner surveillance, or retaliation.

## Choose the investigation shape

- **Username or public profile** → platform collection, then Level 1 tools.
- **Email** → registration and breach checks only with authorization; Level 2.
- **Phone** → ownership or registration checks only with authorization; Level 2.
- **Domain or organization** → passive DNS, certificate, and archive review first; active enumeration only if in scope; Level 3.
- **Internet-wide exposure** → Shodan, Censys, and urlscan only for explicitly in-scope assets; Level 4.
- **Long-running case** → SpiderFoot, Recon-ng, Maltego, or sn0int with a maintained case log.

Read only the references needed for the current target:

- [references/collection.md](references/collection.md) for platform commands.
- [references/toolchain.md](references/toolchain.md) for the specialist-tool catalog.
- [references/evidence.md](references/evidence.md) for scope, source logging, confidence, and reporting.

## Collect in phases

1. **Passive public sources**: web search, official pages, public profiles, archives, certificate transparency, and public code.
2. **Corroboration**: open each source yourself; capture the URL, retrieval time, and exact excerpt; compare independent signals.
3. **Specialist pivots**: use only the tools needed for the current question.
4. **Active actions**: obtain explicit confirmation immediately before scanning, crawling, enumerating, using credentials, or contacting a target.

Prefer official APIs and CLIs. If using the installed `agent-reach` skill, read its upstream references for fuller channel details. Check availability before relying on a channel:

```bash
agent-reach doctor
```

If a channel is unavailable, record it as a gap and use a documented fallback. Do not invent results or present an unavailable source as checked.

## Verification rules

- A username hit is not an identity.
- A registration or breach hit is not ownership.
- A certificate hostname is not a live host.
- An archived URL is not current content.
- Require at least two independent signals before attributing an account to a person or organization.
- Separate **observed fact**, **source claim**, and **your inference**.
- Record negative results; they are findings too.
- Stop when the question is answered. Do not expand into unrelated people or assets.
- Do not paste personal data into arbitrary chatbots or unknown lookup sites.

## Output

Default to a short findings memo:

- Scope and lawful basis
- Question
- Verified findings, each with source and retrieval date
- Unverified leads and confidence
- Gaps, conflicts, and limitations
- Recommended next step, only if still in scope

For multi-day or multi-target work, create a case folder containing `scope.yaml`, `sources.csv`, `notes.md`, and `report.md` using the templates in [references/evidence.md](references/evidence.md).

## Hard boundaries

- No credential theft, session hijacking, login bypass, or access to private accounts.
- No downloading or redistributing breached personal datasets.
- No facial recognition or covert surveillance.
- No contacting a target, employer, family, or platform unless explicitly authorized.
- Public availability does not automatically make processing lawful.
- This skill is not legal advice; escalate unclear cases to the responsible legal or compliance owner.
