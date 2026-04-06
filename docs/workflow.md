# Pipeline Workflow

> Defines how the job market agent operates end-to-end — from scheduled sweeps to saved outputs. Reference this when building automation or when the pipeline behaviour needs to change.

---

## Overview

The pipeline runs in two modes:

| Mode | Description |
|---|---|
| **Scheduled sweep** | Periodic market scan — searches for new roles, updates trackers, flags anything worth evaluating |
| **Deep dive** | Triggered manually or by sweep output — full evaluation of a specific role or company |

---

## Scheduled Sweep — Cadence & Scope

### Frequency
- **Weekly sweep** — every Monday morning
- Scope: new role discovery + tracker refresh

### What a weekly sweep does

1. **Search for new roles** matching Eric's target titles and filters (see `/docs/sources.md` for queries)
2. **Triage results** — filter out hard mismatches (location, seniority, execution-only) before full evaluation
3. **Quick-score new roles** — brief fit assessment (not a full evaluation) to flag high-potential opportunities
4. **Update `roles-tracker.csv`** — add new roles found; update status on previously tracked roles
5. **Flag** any roles scoring ≥7 for immediate deep dive
6. **Check company updates** — scan for funding news, layoffs, or notable changes at A-tier companies in tracker

### Monthly additions (first sweep of the month)
- Run a market trend report using `/templates/market-trend-report.md`
- Save to `/research/market-trends/YYYY-MM-market-trends.md`
- Update `/docs/eric-positioning.md` based on new signals

---

## Deep Dive — Trigger & Process

### Triggers
- A sweep flags a role with quick-score ≥7
- Eric manually requests evaluation of a specific role or company
- A company reaches out directly

### Role deep dive steps

1. **Fetch the job description** — full text from source URL
2. **Research the company** — check if a profile exists in `/research/companies/`; create or update using `/templates/company-profile.md`
3. **Score the role** — apply the full scoring rubric from `/docs/scoring-rubric.md`
4. **Write the evaluation** — fill `/templates/role-evaluation.md`; save to `/research/roles/YYYY-MM-DD-company-title.md`
5. **Update `roles-tracker.csv`** — add or update the row for this role
6. **Update `companies-tracker.csv`** — add or update the company record

### Company deep dive steps (standalone)

1. **Research the company** using all sources in `/docs/sources.md`
2. **Fill `/templates/company-profile.md`**; save to `/research/companies/company-name.md`
3. **Update `companies-tracker.csv`**
4. **Tag company tier** (A/B/C) based on profile assessment

---

## File Naming Conventions

| File type | Convention | Example |
|---|---|---|
| Role evaluation | `YYYY-MM-DD-company-title.md` | `2026-04-06-stripe-director-product-design.md` |
| Company profile | `company-name.md` | `stripe.md` |
| Market trend report | `YYYY-MM-market-trends.md` | `2026-04-market-trends.md` |
| Output / deliverable | `YYYY-MM-DD-description.md` | `2026-04-shortlist-q2.md` |

---

## Output Locations

| Output | Location |
|---|---|
| Role evaluations | `/research/roles/` |
| Company profiles | `/research/companies/` |
| Market trend reports | `/research/market-trends/` |
| Shortlists, memos, positioning drafts | `/outputs/` |
| Structured data | `/data/roles-tracker.csv`, `/data/companies-tracker.csv` |

---

## Triage Rules (Sweep → Deep Dive Gate)

Before spending time on a full evaluation, the agent should confirm:

- [ ] Role is viable for a Canada-based candidate (remote or Canada-open)
- [ ] Title indicates senior/leadership level (not execution-only IC)
- [ ] Company appears stable (not in obvious distress)
- [ ] Role was posted within the last 30 days
- [ ] Role is not a duplicate of one already in the tracker

Fail any of these → mark as `skip` in tracker, do not proceed to full evaluation.

---

## Tracker Maintenance

- Roles older than 90 days with no status update → mark as `stale`
- Roles at companies that have since folded or frozen hiring → mark as `closed`
- Company profiles older than 6 months → flag for refresh on next relevant sweep

---

## Refresh Cadence

| Item | Refresh when |
|---|---|
| Role evaluations | Roles don't change — re-evaluate only if JD is updated or new context emerges |
| Company profiles | Every 3–6 months for A-tier companies; on-demand for others |
| `eric-profile.md` | Whenever Eric's situation, goals, or positioning changes |
| `scoring-rubric.md` | If calibration feels off after 10+ evaluations |
| `eric-positioning.md` | After each monthly market sweep |
