#!/usr/bin/env bash
set -euo pipefail
name="${1:?usage: init_case.sh CASE_NAME [BASE_DIR]}"
base="${2:-$PWD}"
dir="$base/$name"
mkdir -p "$dir"
cat > "$dir/scope.yaml" <<'Y'
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
Y
echo 'source_id,target,source_type,url,retrieved_at,collector,excerpt,confidence,notes' > "$dir/sources.csv"
cat > "$dir/notes.md" <<'N'
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
N
cat > "$dir/report.md" <<'R'
# OSINT findings

## Scope and authorization
- Case:
- Question:
- Lawful basis:
- Authorized targets:
- Actions not authorized:

## Executive finding

## Verified findings
| # | Finding | Confidence | Source | Retrieved |
|---|---|---|---|---|

## Unverified leads
- 

## Conflicts and gaps
- 

## Method and limitations
- Channels unavailable:
- Rate limits or access failures:
- Assumptions:

## Recommended next step
- 
R
echo "Created $dir"
