# Expense Splitter – Naye Features & Ideas

## 🔥 High priority (sabse useful)

### 1. **Settle-up / Kisne diya kisne nahi**
- Har expense ke liye participants list me **“Paid” / “Pending”** flag
- Summary me dikhao: **“Rahul owes you ₹500”**, **“You owe Priya ₹200”**
- Simple **who owes whom** calculation (total paid vs total share)
- **Mark as paid** button – jab koi apna hissa de de to mark kar do

### 2. **Edit & Delete expense**
- Summary page par har row me **Edit** / **Delete** button
- Edit: same form pre-filled, update database
- Delete: confirmation dialog, phir delete

### 3. **Filters & search**
- **Date range:** “Last 7 days”, “This month”, “Custom range”
- **Trip filter:** dropdown – “Goa Trip”, “Office Lunch”, etc.
- **Category filter:** Food, Travel, etc.
- **Search:** description ya trip name se search

### 4. **Dashboard pe quick stats**
- Index page par: **Total spent (this month)**, **No. of expenses**, **Top category**
- Chhota chart: category-wise ya trip-wise bar/doughnut

### 5. **Profile / Settings**
- **Profile page:** name update, email (read-only), change password
- **Settings:** default currency (₹), date format

---

## ⭐ Medium priority (nice to have)

### 6. **Groups**
- **Create group:** “Roommates”, “Goa 2025”
- Add members (email ya name)
- Expenses group ke andar add ho – sirf group members dekhenge
- Summary group-wise bhi ho sakta hai

### 7. **Export & print**
- **Export to PDF** – summary + table
- **Print-friendly** page – clean layout, no nav/ads

### 8. **Who owes whom (simplified)**
- Algorithm: sab debts ko simplify karke dikhao  
  e.g. “A → B: ₹300, B → C: ₹200” ko “A → C: ₹200, A → B: ₹100” jaisa
- Page: **“Settle up”** – list: “Rahul should pay Priya ₹500”

### 9. **Recurring expenses**
- “Monthly rent”, “Internet bill” – har month auto-add (optional amount change)
- Reminder: “Rent due in 3 days”

### 10. **Dark mode**
- Toggle on navbar – theme switch (light/dark), localStorage me save

---

## 🚀 Future / Advanced

### 11. **Forgot password**
- “Forgot password?” link → email bhejo → reset link (SMTP config chahiye)

### 12. **Email reminders**
- “X has not paid their share for Goa Trip” – optional email (cron + SMTP)

### 13. **Multi-currency**
- Expense add karte waqt currency select (₹, $, €)
- Summary me convert to one “base” currency (optional)

### 14. **Budget per category**
- “Food: budget ₹5000 this month” – progress bar / warning jab exceed ho

### 15. **PWA (Progressive Web App)**
- “Add to home screen” – mobile par app jaisa
- Offline: last viewed summary cache me

### 16. **Hindi / English toggle**
- UI text language switch (labels, buttons, messages)

### 17. **Charts upgrade**
- Line chart: spending over time (daily/weekly)
- Compare trips: Trip A vs Trip B total

### 18. **Activity log**
- “You added expense – Dinner ₹1200”, “Rahul marked as paid”
- Simple timeline on dashboard or profile

---

## Implementation order (suggested)

| Step | Feature              | Effort | Impact |
|------|----------------------|--------|--------|
| 1    | Edit & Delete expense| Medium | High   |
| 2    | Filters (date, trip, category) | Medium | High |
| 3    | Dashboard quick stats + small chart | Low–Medium | High |
| 4    | Settle-up (who paid / who owes) | High | Very High |
| 5    | Profile (name, change password) | Low | Medium |
| 6    | Export PDF / Print   | Low    | Medium |
| 7    | Dark mode           | Low    | Medium |
| 8    | Groups              | High   | Very High |

---

## Quick wins (1–2 din me)

- **Edit & Delete** expense (servlet + JSP buttons)
- **Date filter** on view summary (from date, to date)
- **Dashboard stats** (total count, total amount) – already data hai, bas display
- **Print** button – window.print() + print CSS
- **Dark mode** – CSS variables + toggle

Agar batao kaun sa feature pehle chahiye (e.g. “Settle-up” ya “Edit/Delete”), to us hisse ka design + DB changes + code steps bata sakta hoon.
