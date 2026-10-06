---
title: "Ways to get Leads around Cloudflare KV vs workers"
date: 2026-10-04T15:20:21+01:00
draft: false
tags: ["RoadMap26","gotify vs ntfy","Supabase Auth vs PB","Mailtrap"]
description: 'How hard is to make waiting list that capture leads?'
---

**TL;DR**

What happenes after doing the `n ebooks` here and this tech about BRD development.

**Intro**

* WHY Im writting this post: *bc I got to know [CF KV for leads](https://github.com/JAlcocerT/multi-body/tree/master/z-learnings)*
* What [Ive learnt](#conclusions) with it: *Ive ended up reviewing oss notifications services*

Lifetime products are fine.

Providing that someone is interested in what you create.

DIS TRI BU TION


Using Resend mail API, together with Pocketbase to:

1. Get leads
2. Validate their mail
3. Send them an ebook


* https://resend.com/docs/api-reference/emails/send-email

### Capturing Leads with FastAPI x sqlite

I was putting sth together at the homelab: https://gitlab.com/fossengineer1/fossengineerpapermod/-/tree/main/custom-mail

## Capturing Leads with KV

The idea came while tinkering with mbsd here:

```sh
#claude --dangerously-skip-permissions 
#cd ./poc/multi-body/web-sleek
make leads-show
```

If the homelab is a consumer that pulls, enriches and analyses, it never has to be reachable from the internet, and the same pipeline can serve every site.

Pull-only, multi-site: what I'd do

1. One shared KV namespace, with the site in every key.
  LEADS (one namespace, bound in every site's Pages project)
    multibodysystemsdynamics.com:enquiry:2026-10-04T10:12:41Z:<uuid>
    fossengineer.com:newsletter:…
    jalcocertech.com:enquiry:…
  - The function stamps the site from the request's hostname, so the same code works on every site.
  - The homelab reads one stream, while kv key list --prefix fossengineer.com: still gives you a
    per-site view.
  - One read-only API token (Workers KV Storage: Read) on the homelab covers everything. Cloudflare's
    KV permissions are account-wide anyway, so separate namespaces wouldn't make the token any more
    restricted.
  - Your Pages projects for jalcocertech.com (jalcocert) and fossengineer.com (fossengineerpapermod)
    are on the same account, so they can bind the same namespace. leadarchitect.org isn't in that
    account's project list, so check where it's hosted.

  2. Let KV enforce your retention period. Write each lead with an expiry matching the privacy policy
  (24 months). KV then deletes old leads automatically, and the homelab keeps whatever you've decided
  to keep after enrichment.

  3. A simple pull job, run every 5–15 minutes on a timer: list the keys, skip those already in SQLite
  (the key is the primary key), fetch the new ones, insert them unchanged into a leads_raw table, then
  hand them to enrichment. It's idempotent, so outages need no special handling: it catches up on the
  next run. Volumes are tiny, so listing everything each time is fine; past a few thousand leads,
  compare by key prefix or time.

  4. Enrichment needs a privacy-policy update first. Today the policy promises the data is used only to
  reply to you. Enriching leads (looking up the company from the email domain, scoring, linking across
  sites) is a new purpose. Under GDPR it's usually fine under legitimate interest, but it has to be
  disclosed in the policy on every site before you start, along with any enrichment services that would
  receive the data. Keep leads_raw untouched and put enrichment in separate tables, so a deletion
  request is a clean delete in both places.

  5. Put the pipeline in its own repo (e.g. a private leads-hub), not inside multi-body, since it
  serves several sites. The sites only share the function code, the namespace and the key format.

  Why [ntfy](https://github.com/binwiederhier/ntfy) rather than Gotify, for this design specifically

  The deciding factor is where the notification is sent from. With pull-only, two places can send it:

  ┌────────────────┬─────────────┬────────────────────┬───────────────────────────────────────────┐
  │     Sender     │    Delay    │  Works during a    │             Homelab exposure              │
  │                │             │  homelab outage?   │                                           │
  ├────────────────┼─────────────┼────────────────────┼───────────────────────────────────────────┤
  │ Pages          │             │                    │ Gotify: the function must reach your      │
  │ Function, at   │ Instant     │ Yes                │ homelab (an inbound tunnel), which        │
  │ submit time    │             │                    │ defeats pull-only. ntfy: posts to hosted  │
  │                │             │                    │ ntfy.sh, so no exposure                   │
  ├────────────────┼─────────────┼────────────────────┼───────────────────────────────────────────┤
  │                │ Up to the   │ No alert until     │                                           │
  │ Homelab, after │ pull        │ it's back (the     │ None, with either tool                    │
  │  each pull     │ interval    │ lead is still safe │                                           │
  │                │             │  in KV)            │                                           │
  └────────────────┴─────────────┴────────────────────┴───────────────────────────────────────────┘

  - Gotify is self-hosted only. For instant alerts from Cloudflare, your homelab would have to accept
    inbound requests, exactly what pull-only avoids. Otherwise alerts arrive only after the pull.
  - ntfy has both modes: hosted ntfy.sh (private topic plus access token) for instant alerts sent from
    the function with no homelab involvement, and self-hosting if you later want it.
  - iPhone: ntfy has an iOS app; Gotify has none (Android and web only).
  - Simple and useful messages: a plain POST with headers for title, priority, tags and a click URL.
    You can tap the alert to open the lead in your homelab interface, or a mailto: to reply.

  When Gotify is just as good: you're Android-only, already run it, and you're happy to be notified
  after each pull (a few minutes' delay, with no alerts during homelab outages). Then the extra tool
  isn't worth it.

  So for "KV always on, homelab pull-only, instant alert": the function writes to KV, notifies hosted
  ntfy, and the homelab pulls on its timer and enriches.

  What I can build next

  1. Function changes in web-sleek: add the site to keys and metadata, add the 24-month expiry, add
     ntfy notification (NTFY_URL + NTFY_TOKEN secrets), and keep reading the old key format.
  2. A starter leads-hub repo: a pull script (Python + SQLite, idempotent), a systemd timer or
     docker-compose, a leads_raw table and a stub enrichment step.
  3. Privacy policy text describing enrichment, ready for each site.

  Shall I start with item 1? It's a small change that improves things immediately (instant alerts), and
  it fixes the key format before other sites start writing to the namespace.


### Multisite Lead pull

https://github.com/JAlcocerT/multi-body/blob/master/z-learnings/08-multisite-leads-pull.md


To do all this setup you need such [api and creds](https://github.com/JAlcocerT/multi-body/blob/master/z-learnings/09-credentials-and-apis.md)

```sh
npx wrangler login
```


Done today:
- The new site is live at multibodysystemsdynamics.com, with www redirecting to it permanently.
- The solver app is live at app.multibodysystemsdynamics.com, working offline and pinned to core
  v0.7.0.
- Leads are stored in KV, with instant ntfy alerts to your phone through your homelab, and make leads
  to read them.
- Web Analytics is on, matching the privacy policy.
- [Everything is documented](https://github.com/JAlcocerT/multi-body/tree/master/z-learnings) in z-learnings/01–11.

Still open:

1. Caching → "Respect Existing Headers" for the domain (optional, one toggle).
2. GitHub Actions deploys, whenever you want push-to-deploy.
3. The leads-hub pull and enrichment pipeline, plus the multi-site key format (z-learnings/08).
    Update the privacy policy before enrichment starts.
4. The virtual office address and NIP on the site (web-sleek/docs/legal-todo.md), before invoicing
    clients who come through the site.
5. The core grashof_class() fix for 0.8.
6. The app's gated validation report, the next step for turning tool usage into leads.


One detail: both jalcocertech.com and www.jalcocertech.com now serve the site, the same duplicate
  situation MBSD's www had. Here the direction is reversed: the jalcocertech site's canonical address
  is https://www.jalcocertech.com (its Astro site setting). So add a redirect rule on the
  jalcocertech.com zone, going from the apex to www:

  ┌────────────────────────┬───────────────────────────────────┐
  │         Field          │               Value               │
  ├────────────────────────┼───────────────────────────────────┤
  │ Request URL (wildcard) │ https://jalcocertech.com/*        │
  ├────────────────────────┼───────────────────────────────────┤
  │ Target URL             │ https://www.jalcocertech.com/${1} │
  ├────────────────────────┼───────────────────────────────────┤
  │ Status                 │ 301, Preserve query string ✓      │
  └────────────────────────┴───────────────────────────────────┘


The capture side now works on all three sites. The gap is the other half: what happens to leads after
  they arrive. You're collecting subscriptions on three sites, but unsubscribes are manual, there's no
  proper list to send your quarterly email from, and nothing checks consent before mail goes out.
  That's where I'd go next.

  1. Quick wins (an hour or so, mostly you):
  - Turn on Cloudflare Web Analytics for jalcocertech.com. Its privacy page says it's used, and you'll
    want per-post traffic next to per-post signups.
  - Webaudit's bundled consent checkbox. Split it into "send my report" (required) and "marketing"
    (optional), and stop tracking leads.csv / manual-leads/ in git. This is the last real legal issue
    from the audit on a live site.

  2. leads-hub phase 2, minimal version (my main recommendation): a homelab job that pulls from KV and
  turns raw leads into something you can operate.
  - The pull job (Python plus SQLite, on a timer, read-only KV token) as designed in z-learnings/08.
  - A subscriber list per site, with forget <email> (removes the person from SQLite and KV) and a
    suppression list, so someone who unsubscribes is never emailed again from any site.
  - Sending the quarterly email: I'd suggest listmonk, a self-hosted newsletter tool that suits your
    homelab. The pull job imports each site's subscribers into its own list. listmonk handles
    unsubscribe links, bounces and the "one-click unsubscribe" email headers properly, which manual BCC
    from Proton doesn't, and it gets harder to do by hand as lists grow.
  - A weekly ntfy digest: new leads per site, which pages converted, pending unsubscribes.

  Nothing in this step enriches or profiles anyone, so no privacy-policy changes are needed.

  3. The consulting funnel (your highest-intent leads):
  - Bookings as leads: Cal.com sends a webhook, the Worker verifies the signature and stores a booking
    lead.
  - A qualifier on your own form, replacing Formbricks. It would feed the same store and drop one
    third-party service from the policy.
  - The paid-call question needs settling first: either business address and NIP, terms (regulamin) and
    the consumer withdrawal checkbox, or "B2B only". An accountant can confirm this quickly.

Later:
- Turnstile if spam appears (there's been none so far).
- CI that runs the Worker's tests on every push.
- Enrichment for the growth site, but only after its privacy page says so.
- The MBSD items still open (core grashof_class() fix, the app's gated report).

If you agree with step 2, I'd start by laying out leads-hub phase 2 in core: the SQLite schema, the
pull and forget commands, the listmonk import, and an ADR for "homelab pulls, listmonk sends". After
that I'd build it in small commits, as we did with the Worker. Does listmonk work for you, or do you
already have a sending tool in mind?

The capture side is unified for the three main sites: one Worker, one store, one alert path, one consent model, attribution on every lead.

What's missing falls into four groups.

1. Properties not yet on the Worker

┌─────────────────────────────┬───────────────────┬──────────────────────────────────────────────┐
│          Property           │  Captures today   │                What it needs                 │
│                             │        via        │                                              │
├─────────────────────────────┼───────────────────┼──────────────────────────────────────────────┤
│                             │ Formbricks        │ Bookings via a Cal.com webhook into the      │
│ consulting.jalcocertech.com │ qualifier,        │ Worker (kind: booking, signature checked);   │
│                             │ Cal.com bookings, │ the qualifier as your own form, replacing    │
│                             │  OpenAI chatbot   │ Formbricks                                   │
├─────────────────────────────┼───────────────────┼──────────────────────────────────────────────┤
│ ebooks.jalcocertech.com     │ a Formbricks link │ A route plus a subscribe box, like the       │
│                             │                   │ jalcocertech articles                        │
├─────────────────────────────┼───────────────────┼──────────────────────────────────────────────┤
│                             │                   │ Its backend also posts the lead to the       │
│ webaudit.jalcocertech.com   │ its own Express + │ Worker (kind: audit), and the bundled        │
│                             │  PocketBase       │ consent checkbox gets split. That's the last │
│                             │                   │  real legal issue on a live site             │
├─────────────────────────────┼───────────────────┼──────────────────────────────────────────────┤
│                             │                   │ The forms.jalcocertech.com cross-origin      │
│ leadarchitect.org           │ (on Firebase)     │ entry point, which the Worker already        │
│                             │                   │ supports and just needs its hostname         │
└─────────────────────────────┴───────────────────┴──────────────────────────────────────────────┘

2. What happens to leads after capture (the biggest gap)

- Unsubscribe and "forget me": manual today (make lead-delete). There's no suppression list, so
  someone who unsubscribes on one site could still be emailed from another.
- Sending: the quarterly email would go out by hand with BCC from Proton. There are no proper
  unsubscribe links or bounce handling.
- Double opt-in: subscriptions are confirmed with a single checkbox. Anyone could type someone else's
  address. A confirmation email ("click to confirm") is best practice in the EU and the strongest
  proof of consent. It needs a sending tool first.
- Backup: KV is the only copy of every lead. It's durable, but a bug or a mistaken delete would be
  permanent.

The homelab pull job (leads-hub phase 2) solves all four:
- a nightly copy into SQLite (your backup);
- per-site subscriber lists and a shared suppression list;
- forget <email> across all sites;
- an import into listmonk, which handles double opt-in, unsubscribe links and bounces;
- a weekly ntfy digest.

3. Protection and monitoring

- Spam: only the hidden honeypot field today. Turnstile and a rate limit are ready to add if bots
  appear.
- CI: the Worker's 21 tests only run when someone runs them. A GitHub Action could run them on every
  push.
- Errors: the alert fires on new leads, but nothing alerts you if the Worker starts failing (for
  example, KV errors).

4. Small open items from earlier

- Turn on Cloudflare Web Analytics for jalcocertech.com (its privacy page says it's used).
- Consulting privacy policy: replace Umami with Cloudflare Web Analytics, add OpenAI, and decide on
  the paid call.
- Optional: ntfy failure alerts for the rebuild Worker.

My recommended order:
1. The quick legal items (webaudit checkbox, consulting policy, analytics toggle), about an hour.
2. leads-hub phase 2: pull job, SQLite backup, suppression list and forget, then listmonk with double
    opt-in.
3. Consulting bookings and qualifier.
4. ebooks and webaudit, then CI and spam protection as needed.

Shall I start with phase 2? First an ADR in core ("homelab pulls, listmonk sends, double opt-in"),
then the pull job in small commits, as with the Worker. You'd only need to create a read-only KV API
token for the homelab, and tell me where listmonk should run (your homelab with a tunnel, like ntfy).

#### Checking Leads

A new multibody enquiry came in today at 07:09 UTC (09:09 Polish time): project "2D / 3D dynamics advice", from a Gmail address.

Your own tests also used Gmail, so check the address in case it's you.

Read the full message, with name, email, details and the page it came from:
  
```sh
#cd ~/Desktop/mbsd-framework/multi-body/web-sleek && make lead KEY=multibodysystemsdynamics.com:enquiry:2026-10-05T07:09:10.148Z:2718ee99-ab0a-472c-ab32-ef2e835d0e64
```

On the homelab the same lead appears after the next pull:

```sh
docker compose run --rm hub status    # counts only
```

The hub has no "show one lead" command yet. For reading enquiries, make leads / make lead here is the tool.

The hub is the backup and the mailing engine.

Replying: write from Proton (hello@jalcocertech.com) to the address in the lead. 

{{< callout type="info" >}}
It's a reply to an enquiry, not marketing, so no consent or double opt-in is involved.
{{< /callout >}}

That's the unified workflow. Every site sends its forms through the same Worker:

  form on multibodysystemsdynamics.com / fossengineer.com / www.jalcocertech.com
    → leads-forms Worker  → KV (the inbox of record)
                          → ntfy (the notification you got)
  homelab hub  ── every 15 min ──► pulls KV → data/leads.db (+ daily backup)

  make leads on the laptop reads KV directly: the live inbox, with nothing in between. The homelab
  keeps a copy, synced automatically every 15 minutes by the hub container's loop
  (PULL_EVERY_SECONDS=900). You don't need to trigger anything.

Folder on the homelab: the one you ran docker compose up from, which was `~/jalcocertech-core/leads-hub/hub` in your earlier output:

```sh
#ssh jalcocert@192.168.1.2
cd ~/jalcocertech-core/leads-hub/hub
```

Check the sync:

```sh
docker compose logs --tail 5 hub
```

Look for a line like listed 13 · new 1 · … after 07:09 UTC; new 1 is today's enquiry arriving.

```sh
docker compose run --rm hub status
```

The multibodysystemsdynamics.com  enquiry  - count should be one higher than before, with last pull:

To confirm that exact lead is in the copy (prints only key, kind and time, no personal data):

```sh
docker compose exec hub python -c 'import sqlite3; c = sqlite3.connect("/data/leads.db"); print(c.execute("SELECT key, kind, received_at FROM leads WHERE key LIKE \"multibodysystemsdynamics.com:enquiry:2026-10-05%\"").fetchall())'
#docker compose exec hub sqlite3 /data/leads.db "SELECT key, kind, received_at FROM leads WHERE key LIKE 'multibodysystemsdynamics.com:enquiry:2026-10-05%';"
```

If status doesn't show it yet, either 15 minutes haven't passed since 07:09 UTC or the pull is failing; the logs will say which.

A leadshub show <key> command for reading a lead on the homelab is a small add-on if you want one.
Day to day, make lead on the laptop is enough.

 that's the full enquiry in the homelab database. It's a normal
  SQLite file on the homelab disk, mounted into the container:

  ~/jalcocertech-core/leads-hub/hub/data/
  ├── leads.db                ← the live copy (container sees it as /data/leads.db)
  └── backups/
      └── leads-20261005.db   ← one per day, newest 14 kept

  What's inside:

  ┌────────────────┬───────────────────────────────────────────────────────────────────────────────┐
  │     Table      │                                     Holds                                     │
  ├────────────────┼───────────────────────────────────────────────────────────────────────────────┤
  │                │ One row per form submission: site, kind, email, status, received_at, plus     │
  │ leads          │ raw, the complete JSON as the visitor sent it (name, message, project,        │
  │                │ consent, page, UTM)                                                           │
  ├────────────────┼───────────────────────────────────────────────────────────────────────────────┤
  │ suppressions   │ Unsubscribes, stored as hashes only                                           │
  ├────────────────┼───────────────────────────────────────────────────────────────────────────────┤
  │ enrollments,   │ Drip state (empty until drips are enabled)                                    │
  Reading an enquiry on the homelab. From the hub folder:

```sh
docker compose exec hub python -c 'import sqlite3, json; c = sqlite3.connect("/data/leads.db"); row = c.execute("SELECT raw FROM leads WHERE key LIKE \"multibodysystemsdynamics.com:enquiry:2026-10-05%\"").fetchone(); print(json.dumps(json.loads(row[0]), indent=2)) if row else print("No match found")'
```
  With the SQLite CLI installed on the homelab (sudo apt install sqlite3), you can open the file
  directly:

```sh
sqlite3 data/leads.db "SELECT received_at, site, kind, email FROM leads ORDER BY received_at DESC LIMIT 10;"
#sqlite3 -header -column data/leads.db "SELECT received_at, site, kind, email FROM leads ORDER BY received_at DESC LIMIT 10;"
```

Two things to know:

- It's a copy, not the inbox. The Worker writes to KV, the hub copies from it, and deleting a row
  here doesn't delete it in KV. Use forget for that.
- It holds personal data, so keep it private on the homelab: chmod 700 data makes it readable only by
  your user.

Those Python one-liners are clumsy. I can add two small hub commands, leadshub leads (latest leads in
a table) and leadshub show <key> (one lead in full), so on the homelab it's just docker compose run
--rm hub show <key>. Want me to add them?

### SMTP Transactional

• Your post recommends different tools by use case:

  - Transactional email: Mailtrap first, then Resend, then Mailjet (source (content/blog/dev-email.md:688)).
  - Newsletters/marketing: MailerLite, or Listmonk + Mailjet (source (content/blog/dev-email.md:690)).
  - Regular personal/domain email: Proton Mail or Gmail.
  - High-volume/AWS users: Amazon SES.
  - Local development/testing: MailHog.
  - Self-hosting a production mail server: generally not recommended.

> I talked before [about these mail APIs](https://jalcocert.github.io/JAlcocerT/emails-101/#conclusions): https://mailtrap.io/domains and https://resend.com/domains and https://app.mailjet.com/dashboard

 It's already verified in Mailtrap:
  its signing records (DKIM) and DMARC record are in place. For production, I agree with your instinct:
  one subdomain of jalcocertech.com for every brand.

  What the DNS shows:
  - jalcocertech.com and fossengineer.com are set up for Proton: mail servers, an SPF record allowing
    only Proton, and DMARC p=quarantine. If Mailtrap sent "from" those root domains, the messages would
    fail that check and land in spam. That's why the root domains should stay Proton-only, for your
    manual mail.
  - news.libreportfolio.fyi has Mailtrap's DKIM records and a DMARC record. It's ready to send today.
  - news.jalcocertech.com doesn't exist yet. It's free to set up.

  Recommendation: news.jalcocertech.com as the single sending domain for now.

  ┌────────────────┬───────────────────────────────────────────────────────────────────────────────┐
  │                │                                      Why                                      │
  ├────────────────┼───────────────────────────────────────────────────────────────────────────────┤
  │ Separate from  │ A subdomain gets its own authentication records, so your root domains' Proton │
  │ Proton         │  setup is untouched                                                           │
  ├────────────────┼───────────────────────────────────────────────────────────────────────────────┤
  │ Reputation     │ If a campaign ever gets spam complaints, the damage stays on news. and        │
  │ protection     │ doesn't hurt the mailbox you use daily                                        │
  ├────────────────┼───────────────────────────────────────────────────────────────────────────────┤
  │ One setup for  │ Each brand still has its own sender name: FOSS Engineer                       │
  │ all brands     │ <fossengineer@news.jalcocertech.com>, MBSD <mbsd@news.jalcocertech.com>,      │
  │                │ JAlcocerTech <hello@news.jalcocertech.com>                                    │
  ├────────────────┼───────────────────────────────────────────────────────────────────────────────┤
  │ Replies still  │ Reply-To is set to contact@jalcocertech.com / hello@jalcocertech.com, so a    │
  │ reach Proton   │ reply to any email lands in your Proton inbox                                 │
  ├────────────────┼───────────────────────────────────────────────────────────────────────────────┤
  │ Passes the     │ Mailtrap signs as news.jalcocertech.com, which matches the sender address.    │
  │ DMARC check    │ Your root p=quarantine also applies to subdomains, so proper signing is       │
  │                │ required, and Mailtrap provides it                                            │
  └────────────────┴───────────────────────────────────────────────────────────────────────────────┘

  The trade-off: fossengineer subscribers will see "jalcocertech" in the address. With the sender name
  set to "FOSS Engineer", that's a minor oddity, and you can add per-brand subdomains later without
  changing code; it's just configuration.

  One Mailtrap detail to use from the start: it has separate transactional and bulk sending streams.
  Confirmation emails go through transactional, newsletters and drips through bulk. That keeps your
  confirmation emails delivering reliably even if a campaign does badly.

  The plan:
  2. Test with news.libreportfolio.fyi: you subscribe with your own email, the confirmation arrives
     through Mailtrap, you click, and the lead becomes confirmed. Then we test unsubscribe the same
     way.
  3. Meanwhile you set up news.jalcocertech.com in Mailtrap. Add it as a sending domain, then copy the
     DNS records it shows (DKIM, DMARC, link tracking) into the jalcocertech.com zone in Cloudflare. I
     can't write DNS with my login. When it shows as verified, we switch the sender over with a config
     change.

  What I need from you for the test:
  - A Mailtrap API token with sending permission. Add it yourself so it stays out of the chat:
  cd ~/Desktop/mbsd-framework/jalcocertech-core/leads-hub/worker
  npx wrangler secret put MAILTRAP_TOKEN
  - The test sender address, e.g. test@news.libreportfolio.fyi. Mailtrap accepts any address on a
    verified domain.

  Before real subscribers get these emails (step 4), the privacy pages will need to name Mailtrap as
  the email provider. That's already on the ADR checklist.

```sh
curl --location --request POST \
'https://send.api.mailtrap.io/api/send' \
--header 'Authorization: Bearer <YOUR_API_TOKEN>' \
--header 'Content-Type: application/json' \
--data-raw '{"from":{"email":"hello@demomailtrap.com","name":"Mailtrap Test"},"to":[{"email":"some@mail.com"}],"subject":"You are awesome!","text":"Congrats for sending test email with Mailtrap!","category":"Integration Test"}'


curl --location --request POST \
'https://send.api.mailtrap.io/api/send' \
--header "Authorization: Bearer $MAILTRAP_API_TOKEN" \
--header 'Content-Type: application/json' \
--data-raw '{"from":{"email":"noreply@news.libreportfolio.fyi","name":"Mailtrap Test"},"to":[{"email":"some@mail.com"}],"subject":"You are awesome!","text":"Congrats for sending a test email with Mailtrap!","category":"Integration Test"}'
```


  One Mailtrap detail to use from the start: it has separate transactional and bulk sending streams.
  Confirmation emails go through transactional, newsletters and drips through bulk. That keeps your
  confirmation emails delivering reliably even if a campaign does badly.


  What's next, as listed before:
  1. news.jalcocertech.com in Mailtrap. You add the domain and the DNS records, and I can check them
     afterwards. Once that's done and the privacy pages name Mailtrap, double opt-in can go on for
     visitors.
  2. leads-hub v0 on the homelab: SQLite backup of leads and the do-not-send list, forget <email>, and
     Mailpit for testing.


  To run it on the homelab (steps in leads-hub/hub/README.md):
  1. Create a Cloudflare API token: dashboard → My Profile → API Tokens → Custom Token, with Account ·
     go with custom template and look for `Workers KV Storage` · Read. *Similar place where i created the R2 for slubne*
  2. Copy leads-hub/hub/ to the homelab and run cp .env.example .env (paste the token, then chmod 600
     .env).

```sh
git clone https://github.com/JAlcocerT/jalcocertech-core
cd ./jalcocertech-core/leads-hub/hub
cp .env.example .env
#curl -X GET "https://api.cloudflare.com/client/v4/accounts/abcd/tokens/verify" \
  #-H "Authorization: Bearer cfat_edfghijkl"
chmod 600 .env
```

3. Run mkdir -p data && docker compose up -d --build

After that, the next build step is the drip engine (ADR 0003 step 3).


● Step 2 of ADR 0003 is done: the leads mirror is running on the homelab. I've recorded that in the hub
  README, the leads-hub README, the ADR and z-learnings (88b7945, pushed).

  What runs now, with nothing for you to do:
  - Every 15 minutes it copies new and changed leads and the do-not-send list from Cloudflare into
    data/leads.db.
  - Once a day it writes a backup to data/backups/, keeping 14.
  - If pulls start failing, you get an ntfy alert, and another when they recover. That's only if you
    filled NTFY_TOKEN in .env; without it, failures appear only in the logs.

  Handy commands on the homelab, in ~/jalcocertech-core/leads-hub/hub:
  docker compose run --rm hub status                          # counts per site / kind / status
  docker compose run --rm hub subscribers fossengineer.com    # who may be emailed
  docker compose run --rm hub forget someone@x.com --dry-run  # erasure preview

  Updates later: git pull && docker compose up -d --build.

  What's left:
  1. Drip engine (ADR 0003 step 3): email sequences written as files in the repo, sent through the hub
     and tested against Mailpit first. Every email will carry an unsubscribe link signed with the same
     key as the Worker, so that key has to be copied to the homelab.
  2. Production email, on your side when you're ready: set up news.jalcocertech.com in Mailtrap, name
     Mailtrap on the privacy pages, then turn double opt-in on for visitors.

 I'd still keep it on the
  homelab, and use the laptop only for testing.

  ┌─────────────────┬─────────────────┬────────────────────────────────────────────────────────────┐
  │                 │     Homelab     │                           Laptop                           │
  ├─────────────────┼─────────────────┼────────────────────────────────────────────────────────────┤
  │ Pulls every 15  │ Always          │ Only while awake; catches up after sleep (nothing is lost, │
  │ min             │                 │  leads wait in KV)                                         │
  ├─────────────────┼─────────────────┼────────────────────────────────────────────────────────────┤
  │ Daily backup    │ Every day       │ Only on days the laptop runs                               │
  ├─────────────────┼─────────────────┼────────────────────────────────────────────────────────────┤
  │ Failure alerts  │ Meaningful      │ Noisy: offline or asleep looks like a failure              │
  ├─────────────────┼─────────────────┼────────────────────────────────────────────────────────────┤
  │ Personal data   │ Stays at home   │ A copy of every lead travels in your bag; needs disk       │
  │                 │                 │ encryption                                                 │
  ├─────────────────┼─────────────────┼────────────────────────────────────────────────────────────┤
  │ Drips (next     │ Sends on        │ Emails go out late or in bursts after sleep                │
  │ step)           │ schedule        │                                                            │
  └─────────────────┴─────────────────┴────────────────────────────────────────────────────────────┘

  The drips are the deciding factor. Once leads-hub sends sequences ("day 0, day 3, day 7"), it has to
  run on an always-on machine. And it must run in one place only, or people get every email twice.

  Suggested split:
  - Homelab: docker compose up -d, the real service; it's already built there.
  - Laptop: development and tests (uv run pytest), plus the occasional one-off command like status,
    pointed at a temporary database. No always-on container.

  If you want it working right away, while the homelab login gets sorted, running it on the laptop for
  now is fine; pulls are read-only, so nothing breaks. Then move it, and copy data/leads.db across or
  just let the homelab do a fresh pull, which rebuilds everything from KV.


the design I'm going with, following the ADR's rules:

  - Sequences are files in the repo: sequences/<id>.toml (Python reads TOML natively, so still no
    dependencies) plus one text file per email. Reviewing them is just reading a diff.
  - Never twice. Each (sequence, step, person) gets one row, written before the send. If a send crashes
    midway, that person misses the email instead of getting it twice.
  - Before every email: the person must still be a confirmed subscriber and not on the do-not-send
    list. The unsubscribe footer is added automatically, so no template can leave it out. The link is
    signed exactly as the Worker expects, and the headers allow one-click unsubscribe.
  - No blasting old lists: each sequence only enrolls people who confirm after its enroll_since date.
  - Swappable sender: SMTP for Mailpit, or Mailtrap's bulk API. Drips are off unless DRIPS_ENABLED=1,
    and --dry-run shows what would go out.
  - Re-confirmation email (from the ADR checklist): a special audience that sends legacy single-opt-in
    subscribers a Worker confirm link.

The drip engine (ADR 0003 step 3) is built and pushed as hub v0.2.0 (20ca693), but nothing will send
  yet. All three sequences are drafts and disabled, and sending also needs DRIPS_ENABLED=1. 29 tests
  pass.

  How it works:
  - Sequences are files. Each is a .toml plus one plain-text file per email, in
    leads-hub/hub/sequences/. Changing wording means editing text and committing.
  - Who gets them:
    - People who confirmed on that site and aren't on the do-not-send list.
    - Only people who confirm after the sequence's enroll_since date, so turning on a welcome series
      never emails your existing subscribers.
    - The reconfirm sequences instead target subscribers from before double opt-in. Their email carries
      a Worker confirm link for their own lead.
  - Checked right before every email: still confirmed, not unsubscribed. Unsubscribing stops the
    sequence.
  - Never twice: if a send crashes midway, that person misses the email rather than getting it twice. A
    refusal from the provider is retried up to 3 times. At most 50 emails go out per run.
  - Every email gets the unsubscribe footer added automatically, plus the one-click unsubscribe headers
    Gmail and Yahoo require.
  - Sender is set by SENDER: smtp goes to Mailpit (catches mail, delivers nothing), mailtrap uses
    Mailtrap's bulk API.

  Testing found two problems:
  - A real bug, fixed. Python's mail library encoded the long unsubscribe header (=?utf-8?q?=3Chttps…),
    which would have broken one-click unsubscribe. I only saw it by reading the headers Mailpit
    received. It's fixed, and a test now checks the raw bytes.
  - Cloudflare blocks Python's default client on all three sites. It returns 403 before the Worker
    runs. Browsers, curl and Google's crawler get through, so this shouldn't affect mail providers. I
    noted it in z-learnings.

  Verified end to end: links signed on the hub produce exactly the same signature as the Worker's code
  (a test enforces this). A preview's unsubscribe link opened the live Worker's "Unsubscribe me" page,
  branded for the right site; opening it doesn't unsubscribe anyone.

  What's drafted:
  - jt-welcome: a welcome email on day 0, "where to start" on day 3, and "what are you building?" on
    day 7.
  - reconfirm-foss and reconfirm-jt: one email each, asking older subscribers to confirm.

  I sign them "— JAlcocerTech" rather than guess your name.

  Your steps on the homelab:
  1. git pull && docker compose up -d --build. The database picks up the new tables automatically.
  2. Copy the signing key, so unsubscribe links there match the Worker's:
  ssh jalcocert@192.168.1.2 'mkdir -p ~/jalcocertech-core/leads-hub/hub/secrets'
  scp ~/.config/leads-hub/token_secret jalcocert@192.168.1.2:~/jalcocertech-core/leads-hub/hub/secrets/
  3. Read the drafts:
  docker compose run --rm hub drip-preview jt-welcome you@example.org
     This lands in the homelab's Mailpit, which you can reach with ssh -L 18025:localhost:8025 ….

  Still open:
  - Your review of the email wording.
  - Step 4, production email:
    - Verify news.jalcocertech.com in Mailtrap.
    - Add webhooks so bounces and spam complaints go on the do-not-send list. Not built yet.
    - Name Mailtrap on the privacy pages.
    - Then turn on double opt-in for visitors, and the sequences.
  - Automatic 30-day drop of subscribers who never re-confirm isn't built yet. It's noted in the ADR
    checklist.


  What we've done

  MBSD: framework, site and app

  - mbsd-core / mbsd-examples: reviewed for the 0.7.0 open-source release, which you published.
  - multi-body (private):
    - web-sleek/ is live at multibodysystemsdynamics.com: Astro, deployed by direct upload. web/ (v1)
      is untouched.
    - app/ is live at app.multibodysystemsdynamics.com: a Pyodide app that installs as a PWA, running
      mbsd-core from a pinned wheel.
    - make leads and related commands read leads from KV and show status and unsubscribed addresses.
    - The z-learnings/ notes record the build.

  Domains, alerts and operations

  - One address per site. Apex/www rules on each domain and redirects for the *.pages.dev addresses.
    The jalcocertech apex, which pointed at a LAN address, is fixed. architecture/check-redirects.sh
    checks every site.
  - ntfy runs on the homelab at ntfy.jalcocertech.com, closed to anonymous access, with a write-only
    user that posts alerts.
  - ops/site-rebuilds is a scheduled Worker that rebuilds Pages sites daily at 23:30 UTC, so
    future-dated posts appear on their day. fossengineer is the first site using it.
  - Analytics: Umami dropped in favour of Cloudflare Web Analytics.

  Lead capture: the forms Worker (leads-forms, v0.4.0)

  - One Worker handles the forms on all three sites: multibodysystemsdynamics.com, fossengineer.com and
    www.jalcocertech.com, at /api/forms/*.
    - Storage: each lead goes to KV, with retention per kind: questions 24 months, newsletter
      subscriptions without expiry.
    - Alerts: an ntfy alert for each lead, showing only the email domain.
    - Forms work without JavaScript.
    - Two site profiles: "respond" sites only answer what was asked; "growth" sites can also send
      updates, with consent.
  - fossengineer: contact and privacy pages, a question form, a quarterly newsletter box mid-post, and
    the Commento comments disclosed in the privacy page. Also fixed: the /apps/ chips, of which 25 out
    of 52 were empty.
  - jalcocertech: the formsubmit service is gone, replaced by the Worker forms; there's a growth-style
    privacy page, a mid-article newsletter box, and the Tello series published.
  - Double opt-in:
    - The confirmation email goes out through Mailtrap; confirm and unsubscribe links are signed.
    - Opening a link only shows a button, so mail scanners can't confirm or unsubscribe anyone.
    - One-click unsubscribe works.
    - Unsubscribes go on a do-not-send list that stores only a hash of the address.
    - Tested live: subscribe, confirm, unsubscribe. It's currently on for your test address only.

  leads-hub on the homelab (hub/, v0.2.1)

  - Running in Docker: it pulls from KV every 15 minutes, needs no tunnel, and writes a daily SQLite
    backup kept for 14 days.
  - What it does:
    - lists who may be emailed;
    - erases a person on request with forget;
    - applies the retention limits to its local copy;
    - stops if leads vanish in bulk, instead of wiping the copy;
    - sends an ntfy alert when pulls fail.
  - Drip engine: sequences as files, never the same email twice, the do-not-send list checked before
    every email, and an unsubscribe footer plus one-click headers on every email. It sends through
    Mailpit or Mailtrap. Its signed links match the Worker's exactly, and the live Worker accepts them.
  - Drafts, all off: jt-welcome (3 emails). The re-confirmation tooling is off and not needed.

  Documentation in jalcocertech-core

  - ADRs: 0001 (one central forms Worker), 0002 (retention per kind), 0003 (do-it-yourself email).
  - Notes: leads-hub/z-learnings.md (timeline and lessons), z-audits.md, the architecture playbooks,
    and READMEs for the Worker and the hub.

  What's next

  To switch on real email (ADR 0003 step 4), in this order:
  1. You: set up news.jalcocertech.com in Mailtrap and add its DNS records in Cloudflare. I can verify
     them afterwards.
  2. Me: bounce and spam-complaint webhooks from Mailtrap feeding the do-not-send list. This is the
     last unbuilt item on the ADR checklist.
  3. Me: name Mailtrap and describe double opt-in on the three privacy pages, and make jalcocertech's
     newsletter box show "check your inbox".
  4. Together: delete your test leads from KV, then turn double opt-in on (DOUBLE_OPT_IN_SITES = "*").
  5. You: review the jt-welcome emails. Then set enabled = true and enroll_since to that day, and
     DRIPS_ENABLED=1 on the homelab.

  Small loose ends:
  - On the homelab: git pull && docker compose up -d --build, and copy token_secret into secrets/ for
    drips.
  - Delete the old test emails from your local Mailpit, and rm ~/.config/leads-hub/unsub_test_link.

  Larger items, when you want them:
  - Consulting / ebooks / webaudit: the Cal.com booking webhook, a qualifier to replace Formbricks, the
    webaudit form, and the paid-call question (it conflicts with "no billing").
  - Spam protection: Turnstile, if spam starts arriving.
  - forms.jalcocertech.com for leadarchitect.org, which isn't hosted on Cloudflare.
  - Enrichment and a weekly summary for the growth site, once its privacy page covers it.
  - Before any billing: a virtual office address on the sites.

  My suggestion is to start with step 1, the Mailtrap domain. Nothing customer-facing can go live
  without it.

Here's what I'd write, grouped into series, each answering one concrete question like your current articles do. The working material is already
written: the z-learnings, ADRs and READMEs.

Series 1: Python in the browser (MBSD app)

1. "Ship a Python library as an installable web app with Pyodide": running mbsd-core from a pinned
    wheel, installing a wheel instead of raw source (the PackageNotFoundError trap), the service
    worker for offline use, the install prompt, and deploying it as a Pages subdomain.
2. "app.domain or domain/app? Where to put a lead-magnet PWA (and SEO)": the decision we took for
    MBSD: the site carries the SEO, the app carries the experience.

Series 2: Lead capture without a SaaS

3. "Contact forms with Cloudflare Workers KV and self-hosted ntfy alerts": the post you mentioned.
    Form → Worker → KV → phone notification, sent only after the lead is stored and never slowing the
    visitor. Alerts show only the email domain.
4. "One forms Worker for every site: same-origin routes over Pages": a zone route takes over the path
    while Pages serves the rest of the site, so there's no CORS. Covers going from Pages Functions to
    one Worker for Astro and Hugo sites, and forms that work without JavaScript.
5. "Retention as a KV TTL: privacy policy enforced by the platform": short; questions expire after 24
    months, newsletter subscriptions don't (ADR 0002).
6. "Self-hosting ntfy behind a Cloudflare Tunnel, locked down": closed to anonymous access, a
    write-only publisher user, and why the web UI login matters.

Series 3: Your own email stack (no listmonk)

7. "Double opt-in on Cloudflare Workers with signed links": stateless HMAC tokens, why links must not
    act on GET (mail scanners), and one-click unsubscribe per RFC 8058.
8. "A do-not-send list that stores no email addresses": hashed suppression entries, and why every
    sender checks them.
9. "A drip engine in ~400 lines of standard-library Python": sequences as TOML files, never sending
    twice, Mailpit vs Mailtrap behind one interface.
10. "The email header bug that silently breaks one-click unsubscribe": short and very searchable.
    Python folds the long List-Unsubscribe header into =?utf-8?q?…, and Mailpit is how we caught it.
11. "Mailpit vs Mailtrap vs listmonk: what each is actually for": a decision post built on ADR 0003.

Series 4: Homelab and Cloudflare operations

12. "A pull-only homelab: mirroring Cloudflare KV to SQLite without a tunnel": the backup copy
    follows the retention limits too, and a safety brake stops a wrong setting from wiping it.
13. "Publish future-dated posts on Cloudflare Pages with a cron Worker": deploy hooks plus a
    scheduled trigger. Hugo's buildFuture gotcha included.
14. "One canonical address per site: apex vs www and *.pages.dev redirects on Cloudflare": zone
    rules, Bulk Redirects, and the redirect check script.
15. "Debugging notes from a week on Cloudflare": a listicle of gotchas:
    - Pages secrets only apply after a redeploy.
    - The www 522 came from a missing Pages custom domain.
    - Cloudflare returns 403 to Python's default client.
    - Docker creates bind-mount folders as root.
    - Python in Docker hides print output in the logs.

Series 5: Process (fits the growth profile)

16. "Architecture Decision Records for a one-person business": how the ADRs and z-learnings kept this
    project coherent.
17. "GDPR-friendly lead capture for a small EU business": respond vs growth profiles, consent
    records, and the Polish e-communications law (PKE) requiring consent for B2B email. Framed as
    experience, not legal advice.

What I'd keep out of every article

- Your account ID, KV namespace ID, tokens, ntfy usernames and topic, homelab IP, personal email
  addresses.
- Anything that maps your infrastructure for an attacker. Generic placeholders instead.

Suggested order

1. Start with #1 (Pyodide PWA) and #3 (KV + ntfy): the two you asked for, and the most broadly
    useful.
2. Then #10, short and highly searchable.
3. Then #7 → #9, as a 3-part email series, each linking to the next.
4. Each one can carry the mid-article newsletter box, so the series feeds the pipeline it describes.


{{< callout type="info" >}}
Got to know about mailflare
{{< /callout >}}

* **Resend:** Mailflare has native API integration. Resend’s free tier gives you **3,000 emails/month** (100 emails/day limit).
* **Amazon SES:** Highly scalable and cheap ($0.10 per 1,000 emails), with free promotional tiers for new AWS accounts.
* **Other SMTP (Mailjet, SendGrid, Postmark):** If running Mailflare on Workers, provider choice is generally restricted to REST/HTTP API providers (like Resend or SES) because Cloudflare Workers cannot open arbitrary, long-lived raw TCP socket connections required for traditional port 25/587/465 SMTP unless an HTTP-to-SMTP bridge or HTTP API is used.

| Goal | Inbound | Outbound Provider | Cost |
| --- | --- | --- | --- |
| **All-in-One Cloudflare** | Cloudflare Email Routing | Cloudflare Email Sending | **$5/month** (Workers Paid) |
| **100% Free Setup** | Cloudflare Email Routing | Resend (Free API key) | **$0/month** (up to 3k emails/mo) |
| **High Volume / Cheap** | Cloudflare Email Routing | AWS SES (API credentials) | **~$0.10 / 1,000 emails** |

If you already pay $5/month for Workers Paid, you can run everything inside Cloudflare without touching third-party services. 

If you are on the free tier, grab a free Resend API key and paste it into Mailflare's domain settings.

| Feature | On Free Plan | On $5 Workers Paid Plan |
| --- | --- | --- |
| **R2 Free Allowance** | 10 GB storage, 1M writes, 10M reads | **Same** (Overages billed pay-as-you-go) |
| **R2 Egress Fees** | $0 | **$0** |
| **Cloudflare Web Analytics** | Basic traffic & Core Web Vitals | **Unchanged** (Tied to Zone plan, not Workers) |
| **Workers Analytics Engine** | 100k writes/day, 10k reads/day | **10M writes/month, 1M reads/month** |


## Improving the workflow

Adding a "what's next" section to the [overview](https://github.com/JAlcocerT/jalcocertech-core/blob/main/architecture/overview.md), then linking it from the indexes and committing:

I've added architecture/overview.md with five Mermaid diagrams and pushed it (89f2b73). 

It's linked as "Start here" from the architecture README and the root README, and GitHub renders the diagrams directly. I checked all five with mermaid's CLI and redrew the system map after the first render came out tangled.

1. System context: the sites on Pages, the forms and rebuild Workers, KV, Mailtrap, the homelab ([ntfy](https://fossengineer.com/selfhosting-ntfy-docker/), leads-hub, [Mailpit](https://fossengineer.com/selfhosting-mailpit/)), the laptop and your phone, plus who calls whom.
2. Capturing a lead: the order is store first, answer the visitor, then alert; a failed store sends no alert.
3. Double opt-in and unsubscribe: subscribe → "check your inbox" → button page → confirm, and the do-not-send entry on unsubscribe.
4. Subscription states: pending → confirmed → unsubscribed → subscribed again.
5. Homelab loop: pull → retention → daily backup → drips (only when enabled), with the safety brake.

{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/blob/main/gotify/" title="Gotify | Docker Config 🐋 ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/blob/main/mailpit/" title="Mailpit | Docker Config 🐋 ↗" >}}
{{< /cards >}}

It also has a table of where each piece runs, a status table, and the next steps below.

What's next for the multi-site lead pipeline

1. Go live with email. This is the main remaining milestone.
- You: verify news.jalcocertech.com in Mailtrap (DNS records in Cloudflare).
- Me: a webhook so bounces and spam complaints go on the do-not-send list; the last unbuilt item in ADR 0003.
- Me: update the three privacy pages to name Mailtrap and describe double opt-in.
- Together: delete your test leads from KV, then turn double opt-in on for all sites
  (DOUBLE_OPT_IN_SITES = "*").

2. First real drip. Review the 3 jt-welcome emails, set enroll_since to the go-live day, enable the sequence, and set DRIPS_ENABLED=1 on the homelab.

3. Small improvements:
- leadshub leads and leadshub show <key> on the homelab, replacing the Python one-liners.
- "Check your inbox" in jalcocertech's newsletter box. This matters before double opt-in goes on
  there.

4. More properties:
- consulting (Cal.com booking webhook);
- webaudit's form;
- ebooks;
- forms.jalcocertech.com for leadarchitect.org, which isn't on Cloudflare.

5. Later: Turnstile if spam shows up, then enrichment and a weekly summary for the growth site, once
its privacy page covers it.

Step 1 starts with you setting up the Mailtrap domain; I can build the bounce webhook and the
privacy-page changes in the meantime. And when you've read today's MBSD enquiry, reply from Proton.

---

## Conclusions

For places where i just accept inbound only: https://multibodysystemsdynamics.com/contact/

For the ones that will do outbound as well: `https://www.jalcocertech.com/contact/`

No excuses to get a waiting list or an Info Product with lead capture

Want this implemented for your ideas?

{{< cards >}}
  {{< card link="https://consulting.jalcocertech.com" title="Consulting Services" image="/blog_img/entrepre/tiersofservice/dwi/selfh-landing-astro-fastapi-bot.png" subtitle="Consulting - Tier of Service" >}}
  {{< card link="https://ebooks.jalcocertech.com" title="DIY via ebooks" image="/blog_img/web/1ton-webook.png" subtitle="Distilled knowledge via web/ooks to enable you to create" >}}
{{< /cards >}}


---

<!-- https://github.com/appwrite/appwrite
https://appwrite.io/docs/advanced/self-hosting
https://appwrite.io/

Your backend, minus the hassle. -->

<!-- open source backend as a service: firebase alternatives

https://pocketbase.io/
https://nhost.io/
https://supabase.com/ -->

## Supabase: A Powerful Open-Source Firebase Alternative

Supabase has emerged as a compelling open-source alternative to Google's Firebase, offering a comprehensive suite of tools for building web and mobile applications. 

It aims to provide developers with a similar feature set to Firebase, but with the added benefits of open-source transparency, flexibility, and self-hosting options.

This post explores what you can do with Supabase and whether it's a true Firebase replacement.

### What Can You Do with Supabase?

Supabase packs a punch with features designed to streamline the development process:

* **PostgreSQL Database:** At its core, Supabase uses PostgreSQL, a robust and industry-standard relational database.  This gives you the power and flexibility of SQL, along with features like ACID transactions and powerful querying.
* **Authentication:** Supabase provides built-in authentication services, allowing you to easily manage user accounts, sign-ups, sign-ins (including social logins), and user roles.
* **Edge Functions:**  These serverless functions, similar to Firebase Cloud Functions, let you run backend code without managing servers. They are ideal for tasks like data transformation, API endpoints, and background processing.
* **Storage:** Supabase Storage offers a cloud storage solution for files, images, and other assets.  It integrates seamlessly with the database and authentication services.
* **Realtime:**  Supabase Realtime allows you to build real-time applications with ease.  It uses WebSockets to push updates to clients as soon as data changes in the database.
* **API Library:** Supabase provides client libraries for various programming languages (JavaScript, Python, etc.), making it easy to interact with its services from your application's frontend.
* **Admin UI:** A user-friendly web interface lets you manage your Supabase project, view data, write SQL queries, and configure settings.

### Can You Self-Host Supabase?

Yes, one of the key advantages of Supabase is that it can be self-hosted. 

This gives you complete control over your data and infrastructure. 

You can deploy Supabase on your own servers, virtual machines, or even on platforms like Kubernetes. 

Self-hosting is attractive for reasons like data sovereignty, compliance, and potentially lower costs at scale.

However, self-hosting requires more technical expertise.

You'll be responsible for server maintenance, backups, and scaling.  

Supabase provides documentation and tools to assist with self-hosting, but it's a more involved process than using the hosted Supabase platform.

### Is Supabase a Full Firebase Alternative?

Supabase offers a very compelling alternative to Firebase, covering many of the same core functionalities.  Here's a comparison:

| Feature          | Supabase                               | Firebase                                  |
|-----------------|-----------------------------------------|-------------------------------------------|
| Database         | PostgreSQL                              | NoSQL (Firestore, Realtime Database)        |
| Authentication   | Built-in, social logins supported        | Built-in, social logins supported           |
| Serverless Functions | Edge Functions                           | Cloud Functions                            |
| Storage          | Cloud Storage                           | Cloud Storage                            |
| Realtime         | Realtime (WebSockets)                  | Realtime Database, Firestore              |
| Hosting          | Hosted platform, self-hosting options    | Hosted platform only                      |
| Pricing          | Usage-based, open-source self-hosting   | Usage-based                               |
| Open Source      | Yes                                     | No                                        |

**Strengths of Supabase:**

* **Open Source:**  Greater transparency, community support, and the ability to modify the platform.
* **PostgreSQL:**  Leverages the power and flexibility of a relational database.
* **Self-Hosting:** Offers control and flexibility for those who need it.

**Strengths of Firebase:**

* **Mature Platform:**  A well-established and widely used platform with extensive documentation and community resources.
* **Ease of Use:**  Firebase is often praised for its ease of use, especially for getting started quickly.
* **Integrated Services:**  Firebase offers a wide range of integrated services beyond the core features (e.g., Cloud Messaging, Crashlytics).

**Considerations:**

* **Maturity:** While Supabase is rapidly maturing, Firebase has a longer track record.
* **Ecosystem:** Firebase has a larger ecosystem of tools and integrations.
* **Complexity:** Self-hosting Supabase can be more complex than using the hosted Firebase platform.

### Conclusion

Supabase is a strong contender in the **backend-as-a-service** (BaaS) space.

Its open-source nature, PostgreSQL database, and self-hosting capabilities make it a very attractive option for developers who want more control and flexibility.  While Firebase has a more mature ecosystem and might be easier to get started with, Supabase is quickly gaining ground and is a serious alternative to consider for your next project.  The choice ultimately depends on your specific needs and priorities. If you are looking for an open-source, flexible and powerful backend, Supabase is definitely worth exploring.


## The Supabase Project

You can find **Supabase project details** and source code at:

* {{< newtab url="https://.github.io//" text="The  Official Site" >}}
* {{< newtab url="https://github.com/supabase/supabase" text="The  Source Code at Github" >}}
    * License: {{< newtab url="https://github.com/supabase/supabase?tab=Apache-2.0-1-ov-file#readme" text="aGPL 3.0" >}} ❤️

> The open source Firebase alternative. Supabase gives you a dedicated Postgres database to build your web, mobile, and AI applications.



{{< dropdown title="Pre-Requisites!! Just Get Docker 🐋" closed="true" >}}

Important step and quite recommended for any SelfHosting Project - [Get Docker Installed](https://fossengineer.com/docker-first-steps-guide-for-data-analytics/)

It will be one command, this one, if you are in Linux:

```sh
apt-get update && sudo apt-get upgrade && curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh && docker version
```

{{< /dropdown >}}


## Conclusions

Supabase can also be a Vector DB

Same as postgres.


* https://github.com/postgresml/postgresml

> Postgres with GPUs for ML/AI apps.



## Why Supabase?

Firebase but F/OSS


### Algolia and ElasticSearch

Supabase Overview

- **Description**: Supabase is an open-source alternative to Firebase, offering backend services.
- **Core Features**:
  - **Postgres Database**: Provided as a service.
  - **Authentication**: Supports secure user authentication.
  - **Storage**: Manages file storage.
  - **API Tools**: Facilitates API development.
- **Search Integration**: Lacks built-in search functionalities but supports integration with Algolia and Elasticsearch for enhanced search capabilities.

Search Integration Options

- **Algolia**:
  - **Type**: Cloud-based, managed service.
  - **Key Features**:
    - Fast and accurate with typo tolerance and instant search.
    - Developer-friendly APIs and libraries.
    - Enhances user experience with custom search interfaces and advanced features like faceted search.
  - **Pricing**: Various plans, paid service.
- **Elasticsearch**:
  - **Type**: Open-source and self-hosted.
  - **Key Features**:
    - Highly flexible and customizable, suitable for complex queries.
    - Rich in features with many plugins and extensions.
    - Requires more technical expertise to set up and manage.
  - **Pricing**: Free to use; paid subscriptions available for additional features and support.

Choosing Between Algolia and Elasticsearch with Supabase

- **Algolia + Supabase**:
  - Combines Algolia's ease of use and speed with Supabase's robust database capabilities.
  - Ideal for projects needing seamless search experiences with minimal setup.
- **Elasticsearch + Supabase**:
  - Offers more control and customization in search configurations.
  - Suitable for projects requiring complex search functionalities and where technical setup is feasible.


## FAQ
<!-- 
<https://www.youtube.com/watch?v=5psZ6LVbJfA> 
<https://github.com/jmlcas/gogs/tree/main>
-->

### What are some Free FireBase Alternatives?

* Firebase: A Google-backed platform, Firebase offers a comprehensive suite of tools for web and mobile application development, including real-time databases, authentication, analytics, and hosting. It's well-integrated with other Google services and is known for its scalability and ease of use.

* PocketBase: A newer, lightweight alternative, PocketBase focuses on providing a simple backend solution with features like real-time databases, file storage, and user authentication. It's designed for ease of setup and use, targeting smaller projects or those requiring a more straightforward approach.

* Appwrite: An open-source Backend-as-a-Service (BaaS) solution, Appwrite offers a variety of backend services such as databases, authentication, storage, and real-time capabilities. It aims to be a Firebase alternative with a focus on self-hosting, privacy, and customizability.

* You can be interested to [**Self-Host AppWrite**](https://appwrite.io/)
    * Appwrite is an open-source platform for building applications at any scale, using your preferred programming languages and tools: Appwrite's open-source platform lets you add Auth, DBs, Functions and Storage to your product and build any application at any scale, own your data, and use your preferred coding languages and tools.
    * BSD License https://github.com/appwrite/appwrite

* **PocketBase** - F/OSS Real Time Backend in one file <https://github.com/pocketbase/pocketbase>
    * <https://github.com/pocketbase/pocketbase> MIT

* AppSmith - <https://docs.appsmith.com/>
    * <https://docs.appsmith.com/getting-started/setup/installation-guides/docker>


```yml
version: "3"
services:
   appsmith:
     image: index.docker.io/appsmith/appsmith-ee
     container_name: appsmith
     ports:
         - "80:80"
         - "443:443"
     volumes:
         - ./stacks:/appsmith-stacks
     restart: unless-stopped
```

Appsmith is a low-code development platform designed for the rapid creation of web applications. It leverages a reactive binding architecture and an MVC-like separation, focusing on widgets, datasources, queries, and JavaScript. Widgets in Appsmith are visual components representing the 'views', while datasources encapsulate connections to databases and APIs. Queries and embedded JavaScript act as 'controllers', managing the flow of data between the views and models. Appsmith's framework is inherently reactive, automatically updating the application based on changes in its state, which simplifies the development process and enhances user experience efficiency.

## f/oss low code vs no code

* https://www.appsmith.com/
https://github.com/appsmithorg/appsmith

https://www.youtube.com/watch?v=hDzgO2FB_ms

### Learnings from mbsd

The new doc is z-learnings/07-leads-backends.md, and it's linked from the folder's README.md.

  What it covers:
  - A side-by-side table of the five options across 15 criteria, including setup effort, ongoing
    maintenance, cost, uptime, admin view, notifications, surveys and branching, data ownership and
    privacy-policy impact. The options:
    - KV (current);
    - Formbricks Cloud (your v1);
    - PocketBase;
    - Supabase;
    - FastAPI + SQLite.
  - The Formbricks column describes your actual v1 setup:
    - the 5-question qualifier with three endings;
    - the two action classes;
    - the Python provisioning CLI;
    - the dashboard steps that were never finished (routing logic, notification destinations);
    - the plan limit you hit on external-URL buttons.
  - Two ways to connect any backend to the static site:
    - the browser posts straight to the service;
    - or /api/contact stores the lead in KV first, then forwards it. This is the recommended one,
      because a homelab outage can then never lose a lead.
  - Homelab notes:
    - expose it through a Cloudflare Tunnel instead of open router ports;
    - accept requests only from the site's function, using a shared secret;
    - back up the SQLite file;
    - plan for home power or internet outages.

  Verdict:
  - Now: KV plus a notification webhook. Zero maintenance, and it's already live.
  - If you want a lead inbox with statuses and notes: keep KV as the safe inbox and also forward to
    PocketBase on the homelab. It gives the best interface for the least effort.
  - Formbricks only if you need surveys with branching or scoring again, not for basic capture.
  - Supabase or PocketBase once the app needs accounts, saved projects or a gated report. Leads and app
    data can then share one backend.
  - FastAPI + SQLite only if the API grows well beyond a form.

  The doc ends with a checklist for switching: add the forward, update the privacy policy's list of
  processors, store the secret, and confirm with make leads-test.

### OSS Notifications

I had to catch up with [gotify](https://fossengineer.com/selfhosting-gotify/) to and [ntfy](https://fossengineer.com/selfhosting-ntfy-docker/#faq)

{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/gotify" title="gotify | Docker Config 🐋 ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/ntfy" title="notify | Docker Config 🐋 ↗" >}}
{{< /cards >}}


I also brought ntfy up locally. It runs at:   `http://localhost:8099`

```sh
docker compose --env-file .env.sample config
docker compose --env-file .env.sample up -d
curl -s http://localhost:8099/v1/health

#Health returned:# {"healthy":true}
```

Then applied it to my homelab: https://github.com/JAlcocerT/multi-body/blob/master/z-learnings/09-credentials-and-apis.md#homelab-target


the current committed ntfy/docker-compose.yml will start, but it is not ready to expose publicly.

  With the current simple compose:

  - Will it spin up? Yes, assuming Docker works and port 8099 is free.
  - Will it use SQLite? Yes, for the message cache at /var/cache/ntfy/cache.db.
  - Will it have username/password? No. There is no default ntfy user/password. Without auth config, topic names are basically the only protection.

  For the exposed ntfy.jalcocertech.com setup, use the FAQ production shape first: server.yml, auth-file, and auth-default-access: "deny-all". ntfy supports an auth DB with admin/user roles and per-topic ACLs;
  deny-all makes anonymous access blocked by default. (docs.ntfy.sh)

  Minimum flow:

```sh
cd /home/jalcocert/Home-Lab/ntfy

mkdir -p config
nano config/server.yml
```

Use the production `server.yml` from the post FAQ, then start:

```sh
  sudo docker compose up -d
  sudo docker compose logs -f ntfy
```

Then create the admin user:

```sh
sudo docker compose exec ntfy ntfy user add --role=admin admin
sudo docker compose exec ntfy ntfy access
```

It should prompt you for the password. The admin user has full topic access; normal users need explicit topic permissions.

Test with auth:

```sh
  curl -u admin \
    -H "Title: ntfy auth test" \
    -d "homelab ntfy is working" \
    https://ntfy.jalcocertech.com/alerts-test
```

Also: do not put Cloudflare Access in front of `ntfy.jalcocertech.com`; use ntfy auth instead, because the phone app/function calls need direct HTTP access.



`ntfy:80`

```sh
  cd /home/jalcocert/Home-Lab/ntfy
  sudo docker compose -f docker-compose.prod.yml up -d
  sudo docker compose -f docker-compose.prod.yml exec ntfy ntfy user add --role=admin admin
# sudo docker compose -f docker-compose.prod.yml exec ntfy cat /etc/ntfy/server.yml
#   sudo docker compose -f docker-compose.prod.yml exec ntfy ntfy user add --role=admin admin
```


 What I need from you (on the homelab):

  1. Tidy up server.yml, then restart ntfy:

```yml
base-url: "https://ntfy.jalcocertech.com"
enable-login: true                    # web UI login (currently off)
behind-proxy: true
upstream-base-url: "https://ntfy.sh"  # only needed for iPhone push
```

  2. Create the publisher user and token. The site uses this, never your admin:

```sh
docker exec -it ntfy ntfy user add leads-publisher            # pick any password, it won't be used
docker exec -it ntfy ntfy access leads-publisher leads write-only
#docker exec -it ntfy ntfy access yosuaperro leads read-only   # only if yosuaperro isn't an admin
docker exec -it ntfy ntfy token add leads-publisher           # prints tk_…
```

3. Store the two secrets. Run these to **add the secrets to CF**

```sh
cd ~/Desktop/mbsd-framework/multi-body/web-sleek
npx wrangler pages secret put NTFY_URL   --project-name multibodysystemsdynamics   # value:https://ntfy.jalcocertech.com/leads
npx wrangler pages secret put NTFY_TOKEN --project-name multibodysystemsdynamics   # value: the tk_…token
```
4. On your phone: in the ntfy app, add the server https://ntfy.jalcocertech.com, log in as yosuaperro, and subscribe to leads.

  Then tell me, and I'll finish:

1. Redeploy the site. Pages only applies new secrets to new deployments, so this step is required.
2. Run make leads-test. It should return 202, and an alert should reach your phone within seconds.
3. Clean up the test lead and record it as done in z-learnings/09 and 04.



 You can leave server.yml as it is, with one exception if you use an iPhone.

  Setting: enable-login

What it does: Shows a login button in the web UI at ntfy.jalcocertech.com, so you can read alerts i  a
  browser

  Needed?: No. The phone app logs in through the API regardless, and the site publishes with its token.

  Only add it if you want to read alerts on a computer
  ────────────────────────────────────────
  Setting: behind-proxy
  What it does: Lets ntfy see real client IPs behind the tunnel, for per-IP rate limits
  Needed?: No, at your volume. Everything appears to come from the tunnel, so rate limits are shared,
  but a handful of alerts a day is far below the defaults
  ────────────────────────────────────────
  Setting: base-url
  What it does: Lets ntfy build its own public links (attachments, web push, email forwarding, the iOS
  relay)
  Needed?: Only for iPhone, where the relay depends on it. You use none of the other features
  ────────────────────────────────────────
  Setting: upstream-base-url
  What it does: Relays a wake-up through ntfy.sh, so iPhones get instant notifications from a
  self-hosted server
  Needed?: Only for iPhone

  So:
  - Android: leave it exactly as it is. Alerts will arrive instantly.
  - iPhone: add just these two lines and restart. Without them, iOS only checks for new messages
    occasionally, so alerts can arrive late or not at all:
  base-url: "https://ntfy.jalcocertech.com"
  upstream-base-url: "https://ntfy.sh"

The part you can't skip is the publisher user and its token (step 2), plus the two wrangler pages
  secret put commands (step 3). After that, tell me and I'll redeploy and send the test alert.


Check users:

```sh
cd /home/jalcocert/Home-Lab/ntfy
sudo docker compose -f docker-compose.prod.yml exec ntfy ntfy user list
```

or:

```sh
sudo docker compose -f docker-compose.prod.yml exec ntfy ntfy access
```

If you want an actual admin username, create or reset it:

```sh
sudo docker compose -f docker-compose.prod.yml exec ntfy ntfy user add --role=admin admin
```

If it already exists and you need to change password:

```sh
sudo docker compose -f docker-compose.prod.yml exec ntfy ntfy user change-pass admin
```

But functionally, yosuaperro is already authenticated and can publish.

› ive followed the setup, created an admin with a private pwd and still when i go to https://ntfy.jalcocertech.com/ i go directly to the admin panel, whats going on? why im not prompted with user/pwd?


• That is expected unless anonymous topic access still works.

  auth-default-access: "deny-all" does not necessarily put a browser login wall in front of the ntfy web UI shell. The web app can load at:

  https://ntfy.jalcocertech.com/

  The important question is whether anonymous users can read/write topics.

  Test from any machine:

```sh
  curl -i -d "anonymous test" https://ntfy.jalcocertech.com/alerts-test
```
  If auth is working, this should fail with unauthorized/forbidden.

  Then test with your admin user:
```sh
  curl -i -u admin \
    -H "Title: auth test" \
    -d "authenticated publish works" \
    https://ntfy.jalcocertech.com/alerts-test
```

That one should work.

 Lead alerts are live. Every enquiry or ebook request on the site now stores the lead in KV and sends
  a notification to your Android through ntfy.jalcocertech.com.

  What I did:
  - Checked your secrets: NTFY_URL and NTFY_TOKEN are both set on the production project.
  - Redeployed the site. Pages only applies secrets to new deployments, so this step was required.
  - Sent test leads while watching the function's live logs. Each returned 202, and no ntfy error was
    logged, which means your server accepted the alerts.
  - Fixed one detail along the way. The em dash in the alert title triggered a Cloudflare warning,
    because HTTP headers should be plain ASCII. The title is now New enquiry -
    multibodysystemsdynamics.com, and the latest logs show no warnings.
  - Deleted the 4 test leads. LEADS now holds only your two entries: your Gmail test enquiry and the
    porco@gmail.com ebook request.
  - Committed and pushed (dc4c585), and updated the docs:
    - z-learnings/09: secrets active; users yosuaperro and leads-publisher; why server.yml stays as-is.
    - 04: alert flow, the live-log command, plus two new gotchas (secrets need a redeploy; the live-log
      command needs an explicit deployment ID).
    - README: notifications open item marked done.

  Can you confirm on your phone? You should have received about four alerts in the last few minutes,
  like:

  ▎ New enquiry - multibodysystemsdynamics.com
  ▎ Something else · from @example.com · PL
  ▎ Details: make leads

  The first ones have an em dash in the title, the last one a plain hyphen. If nothing arrived, check
  that you're subscribed to leads on the server https://ntfy.jalcocertech.com (not ntfy.sh), logged in
  as yosuaperro.

  For real leads from now on: your phone pings, then make leads (in web-sleek/) shows the list and make
  lead KEY=… the full message.

  Still open:
  1. The www → apex 301 redirect rule.
  2. Cloudflare Web Analytics.
  3. GitHub Actions deploys.
  4. The leads-hub pull and enrichment pipeline, plus the multi-site key format (z-learnings/08).
  5. The virtual office address and NIP.


there is CLI support for tk_ tokens.

  On your server:

  cd /home/jalcocert/Home-Lab/ntfy

  Create a token for an existing user:

  sudo docker compose -f docker-compose.prod.yml exec ntfy ntfy token add yosuaperro

  Create one with a label:

  sudo docker compose -f docker-compose.prod.yml exec ntfy ntfy token add --label="android phone" yosuaperro

  Create one that expires:

  sudo docker compose -f docker-compose.prod.yml exec ntfy ntfy token add --expires=30d --label="android phone" yosuaperro

  List tokens:

```sh
sudo docker compose -f docker-compose.prod.yml exec ntfy ntfy token list
#list the for one particular user and get the tk_
#sudo docker compose -f docker-compose.prod.yml exec ntfy ntfy token list leads-publisher
```

Remove a token:

sudo docker compose -f docker-compose.prod.yml exec ntfy ntfy token remove yosuaperro tk_xxxxxxxxxxxxxxxxxxxxxxxxxxxxx

Important: ntfy docs say tokens currently grant full access to that user account, so the token inherits what the user can do. If yosuaperro is admin, its token is effectively admin-level. For narrower access,
create a limited user first, grant ACLs, then create a token for that user. (docs.ntfy.sh)

Example:

sudo docker compose -f docker-compose.prod.yml exec ntfy ntfy user add android
sudo docker compose -f docker-compose.prod.yml exec ntfy ntfy access android "alerts-*" rw
sudo docker compose -f docker-compose.prod.yml exec ntfy ntfy token add --label="android phone" android

Then use the returned tk_... token in apps/scripts instead of the password.