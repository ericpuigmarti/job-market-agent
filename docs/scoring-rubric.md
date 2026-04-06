# Fit Scoring Rubric

> Used by the agent to assign consistent, defensible fit scores (/10) for every role evaluated. A score only means something if it's calibrated — use this rubric every time.

---

## Scoring Dimensions

Each role is scored across 6 dimensions. Each dimension is scored 1–5, weighted, then normalised to /10.

| Dimension | Weight | What it measures |
|---|---|---|
| **Scope & Seniority** | 25% | Is the role genuinely senior? Does it match Eric's trajectory? |
| **Strategic Influence** | 20% | Can Eric shape product/company direction, not just design execution? |
| **Compensation** | 20% | Does TC (base + equity + bonus) meet or beat Eric's floor? |
| **Growth Potential** | 15% | Is there a credible path up from this role? |
| **Culture & Team Fit** | 10% | Is design valued? Is the team healthy? Is the company stable? |
| **Mission & Product Fit** | 10% | Does the product domain align with Eric's interests and strengths? |

---

## Dimension Anchors

### Scope & Seniority (25%)

| Score | Description |
|---|---|
| 1–2 | Execution-only IC role; no leadership scope; title inflation likely |
| 3 | Senior IC or lead with limited team influence |
| 4 | Manager or lead with real scope but small team or narrow mandate |
| 5 | Director/Head/VP with genuine org influence; or staff IC at meaningful scale |

### Strategic Influence (20%)

| Score | Description |
|---|---|
| 1–2 | Design as service layer; no seat at the table |
| 3 | Design consulted but not driving decisions; reports to mid-level PM or Eng |
| 4 | Design has meaningful input on product direction; reports to CPO or VP Product |
| 5 | Design is a first-class strategic partner; reports to C-suite; shapes company direction |

### Compensation (20%)

| Score | Description |
|---|---|
| 1–2 | Well below Eric's floor; no realistic path to target TC |
| 3 | At or near floor; possible with equity upside |
| 4 | Meets floor comfortably; approaching target |
| 5 | Meets or exceeds target TC; strong equity story or meaningful upside |

### Growth Potential (15%)

| Score | Description |
|---|---|
| 1–2 | Role is a ceiling; company is flat or shrinking |
| 3 | Some growth possible but unclear timeline or path |
| 4 | Credible next step visible (e.g., VP track, expanded org) |
| 5 | High-growth company; role designed to scale; explicit upward trajectory |

### Culture & Team Fit (10%)

| Score | Description |
|---|---|
| 1–2 | Red flags: high Glassdoor churn signals, founder culture misalign, weak product values |
| 3 | Neutral signals; not enough data or mixed reviews |
| 4 | Positive signals; design-friendly culture; healthy team indicators |
| 5 | Strong design culture; trusted leadership; low churn; Eric-aligned values |

### Mission & Product Fit (10%)

| Score | Description |
|---|---|
| 1–2 | Domain misalign; product Eric would not care about or learn from |
| 3 | Neutral; could be fine but not energising |
| 4 | Interesting product; adjacent to Eric's interests (health, AI, SaaS, etc.) |
| 5 | Strong alignment; health tech, AI-enabled, high-quality product craft environment |

---

## Score Calculation

```
Raw score = (Scope × 0.25) + (Influence × 0.20) + (Comp × 0.20) + (Growth × 0.15) + (Culture × 0.10) + (Mission × 0.10)

Fit score /10 = (Raw score / 5) × 10
```

**Example:** Scope=4, Influence=3, Comp=3, Growth=4, Culture=4, Mission=4
→ Raw = (1.0 + 0.6 + 0.6 + 0.6 + 0.4 + 0.4) = 3.6
→ Fit score = (3.6 / 5) × 10 = **7.2 → 7/10**

---

## Hard Filter Overrides

If any of these are true, the fit score is **capped at 4/10 regardless of other dimensions**:

- Role is not viable for a Canada-based candidate
- Role is execution-only with no leadership pathway
- Title is clearly inflated relative to actual scope
- Company shows significant instability signals (mass layoffs, founder conflict, legal issues)
- Compensation is demonstrably below floor with no upside case

---

## Reference Points

| Score | What it means |
|---|---|
| 9–10 | Exceptional match — pursue immediately |
| 7–8 | Strong fit — worth pursuing with energy |
| 5–6 | Moderate fit — monitor or apply selectively |
| 3–4 | Weak fit or hard filter applied — skip unless context changes |
| 1–2 | Clear misalign — skip |

---

## Uncertainty Handling

- If compensation data is unavailable: assume neutral (score: 3) and flag explicitly
- If company culture data is thin: assume neutral (score: 3) and note low confidence
- If seniority is ambiguous from JD: research reporting line and team size before scoring; if still unclear, cap Scope at 3 and flag
- Always separate **fact**, **inference**, and **speculation** in the written evaluation
