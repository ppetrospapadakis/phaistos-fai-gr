# 🏪 Phaistos FAI

**phaistos-fai.gr** — Η φανταστική εταιρεία τροφίμων της Αριάδνης & του Μπαμπά!

Φτιαγμένο με αγάπη 💖 από **Αριάδνη (7 ετών)** & **Πέτρο**

---

## 📁 Δομή Αρχείων

```
phaistos-fai/
├── index.html          # Αρχική σελίδα
├── products.html       # Προϊόντα
├── menu.html           # Τιμοκατάλογος
├── about.html          # Ποιοι Είμαστε
├── login.html          # Σύνδεση Υπαλλήλων
├── employees.html      # 🔒 Φόρουμ Υπαλλήλων (προστατευμένο)
├── style.css           # Κύριο stylesheet
├── supabase-config.js  # Supabase configuration (ΜΗΝ το ανεβάσεις στο Git!)
├── supabase-schema.sql # SQL schema για Supabase
├── vercel.json         # Ρυθμίσεις Vercel
└── package.json        # Project metadata
```

---

## 🚀 Setup — Βήμα προς Βήμα

### 1. Δημιούργησε Supabase Project

1. Πήγαινε στο [supabase.com](https://supabase.com) και κάνε Sign Up / Sign In
2. Κάνε κλικ **"New Project"**
3. Γράψε όνομα: `phaistos-fai`
4. Επέλεξε region: **Europe (Frankfurt)**
5. Βάλε έναν ισχυρό κωδικό και αποθήκευσέ τον
6. Περίμενε να ετοιμαστεί (1-2 λεπτά)

### 2. Τρέξε το SQL Schema

1. Στο Supabase dashboard → **SQL Editor**
2. Κάνε κλικ **"New Query"**
3. Αντέγραψε και επικόλλησε το περιεχόμενο του `supabase-schema.sql`
4. Κάνε κλικ **"Run"**
5. Θα δεις: `employees`, `topics`, `messages` tables στο **Table Editor**

### 3. Γέμισε το `supabase-config.js`

1. Στο Supabase dashboard → **Settings** → **API**
2. Αντέγραψε:
   - **Project URL** → βάλ' το στο `SUPABASE_URL`
   - **anon / public key** → βάλ' το στο `SUPABASE_ANON_KEY`
3. Άνοιξε το `supabase-config.js` και αντικατέστησε:

```js
const SUPABASE_URL = 'https://xxxx.supabase.co';
const SUPABASE_ANON_KEY = 'eyJhbGc...';
```

> ⚠️ **ΠΡΟΣΟΧΗ**: Μην ανεβάσεις το `supabase-config.js` στο GitHub!
> Πρόσθεσέ το στο `.gitignore` αν θέλεις.

### 4. Δημιούργησε λογαριασμούς Υπαλλήλων

1. Supabase dashboard → **Authentication** → **Users**
2. Κάνε κλικ **"Add User"**
3. Βάλε email και κωδικό για κάθε υπάλληλο
4. Αντέγραψε το **User UID** (UUID)
5. Πήγαινε στο **Table Editor** → `employees`
6. Κάνε κλικ **"Insert row"** και βάλε:
   - `user_id`: το UUID που αντέγραψες
   - `name`: π.χ. `Αριάδνη`
   - `surname`: π.χ. `Επώνυμο`
   - `role`: π.χ. `Διευθύντρια Γεύσεων`
   - `photo_url`: (προαιρετικό) URL φωτογραφίας

### 5. Deploy στο Vercel

1. Ανέβασε τον κώδικα στο GitHub (χωρίς το `supabase-config.js`!)
2. Πήγαινε στο [vercel.com](https://vercel.com)
3. Κάνε **"New Project"** → Import από GitHub
4. Επέλεξε το repository
5. Κάνε κλικ **"Deploy"** — έτοιμο! 🎉

---

## 🌐 DNS Setup — phaistos-fai.gr

1. Μετά το deploy στο Vercel, πήγαινε: **Project Settings** → **Domains**
2. Πρόσθεσε `phaistos-fai.gr` και `www.phaistos-fai.gr`
3. Στον DNS provider σου (όπου αγόρασες το domain), πρόσθεσε:
   - **A record**: `@` → IP που σου δίνει το Vercel
   - **CNAME record**: `www` → `cname.vercel-dns.com`
4. Περίμενε μέχρι και 48 ώρες για DNS propagation

---

## 💬 Σχετικά με το Forum

Το φόρουμ στο `employees.html` έχει:
- **Topics**: Θέματα συζήτησης
- **Messages**: Chat-style μηνύματα ανά θέμα
- **Refresh**: Χειροκίνητη ανανέωση (δεν είναι real-time)

### Πώς δουλεύει:
1. Ο υπάλληλος πηγαίνει στο `employees.html`
2. Αν ΔΕΝ είναι συνδεδεμένος → redirect στο `login.html`
3. Κάνει login με email/password
4. Βλέπει τη λίστα θεμάτων
5. Κάνει κλικ σε θέμα → βλέπει τα μηνύματα
6. Γράφει νέο μήνυμα κι αποστέλλει

---

## 🎨 Design

- **Χρώματα**: Πορτοκαλί `#F97316`, Πράσινο `#16A34A`, Κρεμ `#FEF3C7`
- **Font**: Nunito (Google Fonts) + Fredoka για τίτλους
- **Tailwind CSS**: CDN (χωρίς build step)
- **Mobile-responsive**: ✅

---

## 🛠️ Τεχνολογίες

| Τεχνολογία | Χρήση |
|------------|-------|
| HTML5 | Δομή σελίδων |
| Tailwind CSS (CDN) | Styling |
| Custom CSS (`style.css`) | Επιπλέον στυλ |
| Supabase JS SDK (CDN) | Auth + Database |
| Vercel | Static hosting |
| Google Fonts | Nunito, Fredoka |

---

*Φτιαγμένο με 💖 αγάπη από Αριάδνη & Πέτρο — Phaistos FAI 2024*
