# Evidence and reporting

Use these templates for multi-step or multi-target investigations. The point is to make findings reproducible and to keep observations separate from inferences.

## Scope record

Save as `scope.yaml` in the case folder:

```yaml
case_id: ""
created_at: ""
owner: ""
question: ""
lawful_basis: ""
targets:
  - type: username   # username | email | phone | domain | organization | url
    value: ""
allowed_actions:
  passive_only: true
  active_scanning: false
  crawling: false
  credential_use: false
  contact: false
data_handling:
  storage: ""
  retention: ""
  sharing: ""
notes: ""
```

Do not start active collection when `active_scanning` or `crawling` is false. If the scope changes, update this record before continuing.

## Source log

Save as `sources.csv` with these columns:

```csv
source_id,target,source_type,url,retrieved_at,collector,excerpt,confidence,notes
S001,example.com,official_page,https://example.com,2026-11-26T10:00:00+08:00,agent,Short exact quote,confirmed,First-party page
```

- `source_type`: official page, public profile, search result, archive, certificate log, code host, news article, dataset, etc.
- `excerpt`: a short exact quote or description, not a paraphrase presented as a quote.
- `confidence`: see the rubric below.
- Keep the original URL, not only a redirect or reader-proxy URL.

## Confidence rubric

- **Confirmed** — directly observed on a primary source, with a stable URL and clear context.
- **Probable** — supported by multiple independent signals, but the primary source cannot be fully verified.
- **Possible** — one plausible signal; unresolved conflicts or gaps remain.
- **Unverified** — a lead, snippet, or inference without adequate support.

When in doubt, lower the confidence. Do not turn “possible” into “probable” merely because several copies of the same claim exist.

## Identity attribution checklist

Before linking an account, email, phone, or domain to a person or organization:

- Is there a direct cross-link from a controlled/official profile?
- Does the profile contain stable, non-publicly-copied details that match independently?
- Are the timeline, language, location, and activity patterns consistent?
- Is there a second independent source, not a scraped copy of the first?
- Have you checked for a same-name person or a deleted/reassigned account?
- Can you state what would falsify the attribution?

At least two independent signals are required for an attribution in the final report. A shared username, photo, or email is not enough by itself.

## Notes file

Save as `notes.md`:

```markdown
# Case notes

## Open questions
- 

## Working hypotheses
- Hypothesis:
  - Supports:
  - Contradicts:
  - Next check:

## Negative results
- What was checked:
- Result:
- Implication:
```

Keep hypotheses explicitly labeled. Do not delete contradictory evidence.

## Report template

Save as `report.md`:

```markdown
# OSINT findings

## Scope and authorization
- Case:
- Question:
- Lawful basis:
- Authorized targets:
- Actions not authorized:

## Executive finding
One paragraph. State what is confirmed and what is still uncertain.

## Verified findings
| # | Finding | Confidence | Source | Retrieved |
|---|---|---|---|---|
| 1 |  | confirmed / probable / possible / unverified |  |  |

## Unverified leads
- 

## Conflicts and gaps
- 

## Method and limitations
- Channels unavailable:
- Rate limits or access failures:
- Assumptions:

## Recommended next step
- Only actions that remain within the stated scope.
```

## Data handling

- Collect the minimum needed to answer the question.
- Store raw personal data separately from the report when practical.
- Avoid retaining passwords, access tokens, cookies, or private messages.
- Do not redistribute breach data, dossiers, or unrelated personal information.
- Define a retention period and delete case material when it is no longer needed.
- Share findings on a need-to-know basis; redact identifiers that are not necessary to the decision.
