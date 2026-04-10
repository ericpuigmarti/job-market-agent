# Market Tracking & Trends

> Longitudinal view of design leadership job market signals. Updated weekly after each sweep. Use to identify patterns, shifts, and how your comp compares to market.

---

## Data Model

**File:** `/data/market-trends.csv`

Each row captures one metric from one sweep. Schema:
- `sweep_date` — YYYY-MM-DD of the sweep run
- `metric` — what we're measuring (see list below)
- `value` — the number or percentage for that metric
- `notes` — context or calculation details

This structure allows trend analysis: how are comp signals changing? Are more Director roles appearing? Is the market shifting to AI/SaaS?

---

## Tracked Metrics

### Volume & Fit

| Metric | What it tells you |
|---|---|
| `total_roles_tracked` | Total new + existing roles in the tracker |
| `avg_fit_score` | Average fit score (higher = better market alignment) |
| `pursue_count` | Roles scoring ≥7 (active pursuit candidates) |
| `monitor_count` | Roles scoring 5–6.9 (watch these) |
| `skip_count` | Roles that don't fit (FYI) |

### Location

| Metric | What it tells you |
|---|---|
| `location_remote_pct` | Percentage of roles that are remote or Canada-open (100% is ideal for you) |
| `location_canada_based_pct` | Percentage explicitly based in Canada |
| `location_us_remote_open_pct` | Percentage US-based but open to remote-Canada |

### Compensation

| Metric | What it tells you |
|---|---|
| `comp_signal_median_cad` | Median disclosed or estimated comp (CAD). If not disclosed in most roles, estimate conservatively from comps-tracker or market data |
| `comp_disclosed_pct` | % of roles with explicit comp info (higher signal) |
| `comp_estimated_pct` | % where comp was inferred from company size/stage (lower signal) |

### Titles & Seniority

| Metric | What it tells you |
|---|---|
| `title_director_pct` | % of roles titled "Director of..." |
| `title_head_pct` | % titled "Head of..." |
| `title_vp_pct` | % titled "VP of..." |
| `title_staff_ic_pct` | % titled "Staff / Lead / Principal Designer" (high-leverage IC track) |
| `title_manager_pct` | % titled "Design Manager" (lower seniority) |

### Company Stage

| Metric | What it tells you |
|---|---|
| `company_stage_seed_to_b` | % at Series A–B (early growth) |
| `company_stage_series_c_plus` | % at Series C or later (mature, proven product-market fit) |
| `company_stage_public` | % at public companies |

### Domain

Tracking what kinds of companies are hiring design leadership. Use this to see if health tech / AI / SaaS hiring is heating up or cooling down.

| Metric | What it tells you |
|---|---|
| `domain_health_tech_pct` | % in health tech (Eric's background) |
| `domain_ai_saaS_pct` | % in AI-enabled or SaaS product companies |
| `domain_fintech_pct` | % in fintech |
| `domain_legal_tech_pct` | % in legal tech |
| `domain_consumer_pct` | % in direct consumer products |
| `domain_marketplace_pct` | % in marketplaces |
| `domain_dev_tools_pct` | % in developer tools / infra |

### Sources

Helps you understand which job boards are most productive.

| Metric | What it tells you |
|---|---|
| `source_linkedin_pct` | % found via LinkedIn Jobs search |
| `source_vc_boards_pct` | % found via VC fund job boards (a16z, Sequoia, Designer Fund, etc.) |
| `source_direct_board_pct` | % found via Lever/Greenhouse direct company career pages |
| `source_aggregator_pct` | % found via job aggregators (Indeed, Wellfound, etc.) |

---

## How to Use This Data

### Weekly review
After each sweep, skim the new metrics. Are new roles coming in at higher fit scores? Is the median comp moving up?

### Monthly trends
Look at 4-week rolling windows. Example questions:
- Are more Director roles appearing (seniority trending up)?
- Is comp signal increasing month-over-month?
- Are health tech companies hiring less (domain shift)?

### Quarterly patterns
Compare Q1 vs Q2 vs Q3. Hiring often has seasonal patterns (post-funding spikes, year-end slowdowns).

### Benchmarking your comp
Your current TC is $165K CAD. The market median from this sweep is ~$175K. Over time, track:
- If median comp climbs above $185K, the market is shifting in your favour
- If it stays flat at $170–175K, your target of $185K is still slightly above median (but achievable for the right fit)
- If Director roles are 70%+ of hiring, that's your lane — use it in pitch conversations

---

## Notes on Data Quality

- **Comp signals are often unavailable.** Most job postings don't disclose salary. We estimate conservatively from company stage/size, or flag as "unknown" and note it
- **Company stage info may be stale.** Use Crunchbase or recent news to verify; flag if a company has had major news (funding, layoffs) since the job was posted
- **Domain classification is opinionated.** A "health tech + AI SaaS" company might be binned as health tech or AI SaaS depending on primary business model. Be consistent across sweeps
- **First sweep (2026-04-08) is a baseline.** Metrics will be noisy; patterns emerge over 4+ sweeps

---

## Future Enhancements

- Add `posting_staleness_pct` to track how old the average posting is (staleness signal)
- Add `design_maturity_signal` based on job language (does JD mention strategy, systems, research?)
- Add `leadership_level_pct` grouping (individual contributor vs 1+ reports vs org-wide leadership)
- Add `interview_data` after Eric interviews at pursue roles — feedback on culture, comp, scope
