# Data Schema

> Field definitions for all structured data files. Ensures CSV trackers are consistent and comparable across sessions.

---

## roles-tracker.csv

One row per evaluated role. A role can appear multiple times only if the company re-posts it (create a new row with updated date).

| Field | Type | Description | Allowed values |
|---|---|---|---|
| `date_found` | Date | Date the role was first discovered | YYYY-MM-DD |
| `date_evaluated` | Date | Date the full evaluation was completed | YYYY-MM-DD or blank |
| `company` | String | Company name | Free text |
| `title` | String | Exact title from job posting | Free text |
| `location` | String | Listed location/work mode | e.g. "Remote", "Toronto, ON", "US Remote" |
| `canada_viable` | String | Is this role open to Canada-based candidates? | `yes`, `no`, `unclear` |
| `source_url` | URL | Direct link to job posting | URL string |
| `fit_score` | Number | Fit score from evaluation (0–10) | 0.0–10.0 or blank if not evaluated |
| `recommendation` | String | Agent recommendation | `pursue`, `monitor`, `skip`, `pending` |
| `status` | String | Current application/research status | `new`, `evaluated`, `applied`, `interviewing`, `offer`, `closed`, `stale` |
| `evaluation_file` | String | Path to full evaluation markdown | e.g. `research/roles/2026-04-06-stripe-director.md` |
| `company_profile_file` | String | Path to company profile markdown | e.g. `research/companies/stripe.md` |
| `notes` | String | Short free-text note | Optional; max ~200 chars |

---

## companies-tracker.csv

One row per company. Updated in-place as research refreshes.

| Field | Type | Description | Allowed values |
|---|---|---|---|
| `company` | String | Company name | Free text |
| `website` | URL | Company website | URL string |
| `stage` | String | Funding stage | `seed`, `series-a`, `series-b`, `series-c`, `series-d+`, `public`, `unknown` |
| `last_funding` | String | Last funding round summary | e.g. "Series B, $40M, Jan 2025" |
| `headcount` | Number | Approximate total employees | Integer or blank |
| `design_team_size` | Number | Estimated design team size | Integer or blank |
| `design_leader_title` | String | Title of current design lead | Free text |
| `canada_hiring` | String | Does company hire in Canada? | `yes`, `no`, `unclear` |
| `tier` | String | Eric's priority tier | `A`, `B`, `C` |
| `date_first_researched` | Date | When company was first added | YYYY-MM-DD |
| `date_last_updated` | Date | When profile was last refreshed | YYYY-MM-DD |
| `profile_file` | String | Path to company profile markdown | e.g. `research/companies/stripe.md` |
| `active_roles` | Number | Number of currently open relevant roles | Integer |
| `notes` | String | Short free-text note or risk flag | Optional; max ~200 chars |

---

## Status Values (roles-tracker)

| Status | Meaning |
|---|---|
| `new` | Discovered but not yet evaluated |
| `evaluated` | Full evaluation complete; recommendation set |
| `applied` | Application submitted |
| `interviewing` | In process |
| `offer` | Offer received |
| `closed` | Role no longer available or process ended |
| `stale` | No update in 90+ days; likely expired |

---

## Notes on Data Integrity

- Do not modify fields retroactively unless correcting a factual error
- Compensation figures should be stored in the format `$X–$Y USD base` or `~$X CAD TC`
- Boolean-style fields use `yes` / `no` / `unclear` — not `true/false` or `1/0`
- Dates always use `YYYY-MM-DD` format
- Empty cells should be left blank — do not use "N/A", "none", or dashes
