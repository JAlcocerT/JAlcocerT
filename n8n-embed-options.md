# n8n Chat Embed Options (for Hugo)

Two supported ways to embed an n8n chatbot in your Hugo site. Both work fine with a static site; they load from a CDN and talk to your n8n webhook.

## 1) Official @n8n/chat embed (createChat)

- Loads a global floating bubble via a small script.
- Best for site‑wide use (add once in a partial).
- Simple theme controls and programmatic options.

Minimal snippet (already wired in this repo via `layouts/partials/chatbot.html` and `layouts/partials/scripts.html`):

```html
<link href="https://cdn.jsdelivr.net/npm/@n8n/chat/style.css" rel="stylesheet" />
<script type="module">
  import { createChat } from 'https://cdn.jsdelivr.net/npm/@n8n/chat/chat.bundle.es.js';

  createChat({
    webhookUrl: 'https://n8n.jalcocertech.com/webhook/XXXX/chat',
    title: 'JAlcocerT Assistant',
    defaultOpen: false,
    theme: { primary: '#3b82f6' }
  });
</script>
```

Where to place in Hugo:
- Put the snippet in a partial rendered near the end of `</body>`. This repo uses `layouts/partials/chatbot.html` and injects it via `layouts/partials/scripts.html`.

Pros:
- Single include for whole site
- Official package, maintained
- Easy theming and options

Cons:
- No custom HTML tag to place per-page (it’s global unless you gate it with front matter flags)

## 2) Web Component embed (`<n8n-embedded-chat-interface>`) 

- Use a custom element that you can drop into any page or partial.
- Good for per-page control or demos inside a single post.

Snippet:
```html
<script src="https://cdn.jsdelivr.net/npm/n8n-embedded-chat-interface@latest/output/index.js"></script>

<n8n-embedded-chat-interface 
  label="My AI Assistant" 
  hostname="https://n8n.jalcocertech.com/webhook/XXXX/chat" 
  open-on-start="false">
</n8n-embedded-chat-interface>
```

Where to place in Hugo:
- Per-page: paste in a Markdown file (works because `goldmark.renderer.unsafe: true` in `hugo.yaml`).
- Site‑wide: convert the snippet into a partial and include it in your templates.

Pros:
- Precise placement per page
- No extra code beyond the CDN script and tag

Cons:
- Slightly different API than @n8n/chat
- You must remember to include the matching script wherever you use the tag

## Choosing
- Want a single floating bubble everywhere? Use **@n8n/chat**.
- Want to place the widget only on certain pages/sections? Use the **web component**.

## Requirements
- Your n8n workflow must be Active.
- Webhook must be reachable over HTTPS in production (and CORS must allow your site origin).
- Hugo already allows raw HTML via `markup.goldmark.renderer.unsafe: true`.

## Expected I/O
- Request body sent by widget (example):
```json
{ "message": "Hello", "sessionId": "abc-123" }
```
- Response you should return from n8n:
```json
{ "output": "Hi there!", "sessionId": "abc-123" }
```

## Troubleshooting
- No bubble: check browser console for network/CSP errors; ensure the CDN script loads.
- 404 from webhook: activate the workflow; use the production URL (not test URL).
- CORS: add `Access-Control-Allow-Origin: *` (or your domain) in the webhook response headers.
- Per‑page embed not showing: verify the script tag is present on that page’s HTML and that the shortcode/markdown isn’t escaping it.
