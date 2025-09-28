---
title: "Automation for your Agency"
date: 2025-09-25
draft: false
tags: ["n8n","typebot","botpress","KB","Real Estate ChatBot"]
description: 'Getting leads fast towards your product landing'
url: 'pro-agency-automation'
---


**Intro** 

Just recently I covered how to [build a quick product with auth + a landing](https://jalcocert.github.io/JAlcocerT/micro-saas/)

Also, couple of [marketers show me a cool workflow](https://jalcocert.github.io/JAlcocerT/software-for-marketing-agencies/)

If you read me for some time already, you are also aware of APIs, Webhooks and automations (not only with n8n)

How can this all be put together?

I mean...a ,custom' solution that provides out of the box a UI for the final user.

### n8n


![alt text](/blog_img/selfh/automation/n8n-setup.png)

![alt text](/blog_img/selfh/automation/flaskcms2.png)

### BotPress


![alt text](/blog_img/selfh/automation/bot-press-setup.png)

![alt text](/blog_img/selfh/automation/botpress-dash.png)

<!-- https://www.youtube.com/watch?v=f17B1NLu8ho -->

  {{< youtube "f17B1NLu8ho" >}}

  <!-- https://www.youtube.com/watch?v=1EVE2jlFgOc&t=48s -->

    {{< youtube "1EVE2jlFgOc" >}}



### TypeBot

![alt text](/blog_img/selfh/automation/typebot.png)

---

## Conclusions

### Use Cases

#### eBook Creation

Just in case you are aware of Pandoc.

And how to convert .md to cool pdf or even to epub for ebooks.

#### Real Estate Chat Bot

The FlaskCMS v2 for real estate was a great idea.

But how about if you can just scrap + get the property added for your collaborations?

![alt text](/blog_img/selfh/automation/flaskcms2.png)

> Wasnt it cool that vibe coded gradient?

##### n8n x Github

> Sample wf https://github.com/JAlcocerT/Home-Lab/blob/main/n8n/sample-workflows/4-openai-github_posts.json


{{% details title="How to push OpenAI generated .md to github with n8n 🚀" closed="true" %}}

Creating this n8n workflow is straightforward. You'll use three main nodes: **Manual Trigger**, **OpenAI**, and **GitHub**.

Here is a step-by-step guide to building the workflow.

1\. Set Up the Workflow Structure

1.  **Create a New Workflow:** In your n8n dashboard, click **"New"** to start a blank workflow.

2.  **Add the Trigger Node:** Replace the existing **Start** node with the **Manual Trigger** node. This lets you manually input data (your message) when you execute the workflow.

      * Search for **"Manual Trigger"** and add it.

2\. Get User Input and Send to OpenAI

Next, you'll configure the trigger to accept your message and then pass it to OpenAI.

A. Configure Manual Trigger

1.  Click the **Manual Trigger** node.
2.  In the parameters pane, click **"Add Parameter"** and select **"Prompt List"**.
3.  Set the following values:
      * **Field Type:** `Long Text`
      * **Field Name:** `input_message`
      * **Display Name:** `Your Message to OpenAI`

B. Configure OpenAI Node

1.  Add an **OpenAI** node and connect it to the **Manual Trigger** node.
2.  **Credentials:** Select or create your OpenAI API credentials.
3.  **Operation:** Set to `Chat Completion` or `Generate Text`.
4.  **Model:** Choose a model like `gpt-4o` or `gpt-3.5-turbo`.
5.  **Messages:** This is where you pass your input.
      * Set the **Role** to `User`.
      * In the **Content** field, click the **'Expression'** button (the gear icon) and select the variable from your trigger node:
        ```
        {{ $json.input_message }}
        ```
      * *(Optional but Recommended):* Add a **System** message above the User message to instruct the model to produce output in Markdown format:
          * **Role:** `System`
          * **Content:** `Your task is to generate a comprehensive and well-structured response based on the user's message. Format all output using Markdown.`

3. Push the Markdown File to GitHub

The final step is taking the text output from the OpenAI node and creating a new file in your GitHub repository.

A. Configure GitHub Node

1.  Add a **GitHub** node and connect it to the **OpenAI** node.
2.  **Credentials:** Select or create your GitHub API credentials. (You'll need a Personal Access Token with **`repo`** scope permissions.)
3.  **Resource:** Set to `File`.
4.  **Operation:** Set to `Create`.

B. Configure File Details

1.  **Repository:** Enter the name of your GitHub repository (e.g., `my-content-repo`).
2.  **Branch:** Enter the target branch, typically `main` or `master`.
3.  **File Path:** Set the path and name for the new file. You can use an expression to generate a unique filename based on the current time and a `.md` extension:
    ```
    output/{{ new Date().toISOString().replace(/:/g, '-') }}.md
    ```
      * *This creates a file like `output/2025-09-25T13-02-21-345Z.md`.*
4.  **Content:** Click the **'Expression'** button to map the Markdown text from the OpenAI node. The path will typically be:
    ```
    {{ $json.choices[0].message.content }}
    ```
5.  **Commit Message:** Enter a message for the commit:
    ```
    New content generated by OpenAI for "{{ $json.input_message.substring(0, 30) }}..."
    ```

Test and Activate

1.  **Test Execution:** Click the **Manual Trigger** node and enter a test message (e.g., "Write a short article about self-hosting benefits.").
2.  Click **"Execute Workflow"**.
3.  Check the output of each node. The GitHub node should report success.
4.  Verify the new Markdown file appears in your GitHub repository.
5.  Once everything works, click the **"Active"** toggle in the top right to enable the workflow for future manual use.

{{% /details %}}

![Github Personal Access Token](/blog_img/selfh/automation/gh-pat.png)

![alt text](/blog_img/selfh/automation/gh-node-n8n.png)

So writting posts into Github so that the SSG+CI/CD workflow starts be like:

![alt text](/blog_img/selfh/automation/gh-n8n-post-openai.png)

See what they produce. [Sample md](https://github.com/JAlcocerT/morita-web/blob/main/src/content/sample-post2.md)


##### n8n x Scraping

Instead of having this cool [streamlit web scrapper](https://github.com/JAlcocerT/moi-realestate-pb/tree/master/ScrapPhotosWebApp)... and better than this [n8n tg scrap wf](https://github.com/JAlcocerT/Home-Lab/blob/main/n8n/sample-workflows/3-webhook_openai_tg.json)

1. With **BS4**

2. Just use...**FireCrawl** with n8n https://www.npmjs.com/package/@mendable/n8n-nodes-firecrawl

![n8n Firecrawl Setup](/blog_img/selfh/automation/n8n-firecrawl.png)

![alt text](/blog_img/selfh/automation/n8n-firecrawl-workflow.png)

> Lets use this Example [page for re to scrap](https://www.viviendasylocalesgranada.com/ficha/piso/granada/zaidin/4348/26643098/es/)

What a better chance than this to start trying the `when chat message received` aka `chat trigger` node?

```sh
#https://n8n.jalcocertech.com/webhook/926db831-364e-4cbf-968b-c4abf21c640b/chat
 curl -X POST https://n8n.jalcocertech.com/webhook/926db831-364e-4cbf-968b-c4abf21c640b/chat -H "Content-Type: application/json" -d '{"message": "Hello, test message", "sessionId": "test-session-123"}'
 ```


For the **chatbot interface to be rendered** into a website:

0. https://www.npmjs.com/package/@n8n/chat?activeTab=readme
1. https://github.com/symbiosika/n8n-embedded-chat-interface


Yes, n8n provides a script that can be added to the head of a website to embed an interactive chatbot interface that sends and receives messages from an n8n workflow.

The "N8N Embedded Chat Interface" is a native web component that you can easily integrate on any website with just a few lines of HTML and JavaScript. You include a script tag linking the chatbot interface library from a CDN, then add a custom HTML tag with attributes specifying the webhook URL of your n8n workflow that handles the chatbot logic.

Example snippet to add to your website:

```html
<script src="https://cdn.jsdelivr.net/npm/n8n-embedded-chat-interface@latest/output/index.js"></script>

<n8n-embedded-chat-interface 
  label="My AI Assistant" 
  hostname="https://your-n8n-webhook.com/webhook/:id-of-your-webhook-node" 
  open-on-start="false">
</n8n-embedded-chat-interface>
```

Your n8n workflow must have a webhook trigger node configured to receive POST requests from this widget, parse incoming chat messages, run your chatbot logic (e.g., calling an AI agent node like OpenAI), and respond with JSON containing the chatbot reply and session info.

The workflow should respond with JSON in this format:

```json
{
  "output": "Chatbot response",
  "sessionId": "session-id"
}
```

This setup allows you to embed a fully functional conversational chatbot powered by n8n workflows directly into your website, supporting real-time interaction with users without needing separate chatbot hosting.[1][2][3][4][5]

[1](https://www.softoneconsultancy.com/how-to-create-an-ai-website-chatbot-with-n8n/)
[2](https://github.com/symbiosika/n8n-embedded-chat-interface)
[3](https://blog.n8n.io/how-to-make-ai-chatbot/)
[4](https://community.n8n.io/t/help-how-to-embed-chatbot-on-my-website-via-cdn/33783)
[5](https://n8n.io/workflows/2786-create-a-branded-ai-powered-website-chatbot/)
[6](https://www.youtube.com/watch?v=xQ1tCQZhLaI)
[7](https://www.reddit.com/r/n8n/comments/1iwltgi/chatbot_embedded_into_own_website/)
[8](https://www.youtube.com/watch?v=mLTqabG0l7c)
[9](https://n8n.io/workflows/6290-company-website-chatbot-agent-rag-calendar-integrations/)
[10](https://community.n8n.io/t/create-a-branded-ai-powered-website-chatbot-with-n8n/73093)

##### n8n x APIFY

* https://www.npmjs.com/package/@apify/n8n-nodes-apify

![alt text](/blog_img/selfh/automation/apify-ui.png)

![alt text](/blog_img/selfh/automation/n8n-apify.png)

##### n8n x leads

#### Landing ChatBot with KB knowledge