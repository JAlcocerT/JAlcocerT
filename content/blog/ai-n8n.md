---
title: "Just n8n and AI workflows"
date: 2025-09-21
draft: false
tags: ["n8n AI Chat","PlayWright MCP"]
description: '.'
url: 'n8n-with-ai'
---


**Intro**

I recently discovered about: https://chat.soula.ge/ and `https://vp.soula.ge/`

> Chat with Your n8n Workflows

> > Transform complex automation into natural conversations. Connect up to 9 webhooks and manage your workflows through an intelligent chat interface.

### n8n x FirefliesAI

Lately I was playing with [AI Audio here](https://jalcocert.github.io/JAlcocerT/audio-recap/#tools-for-meetings)

![Fireflies AI has n8n integration](/blog_img/GenAI/n8n/n8n-audio-fireflies.png)


To integrate Fireflies.ai with n8n, follow these general steps to automate meeting workflows, retrieve transcripts, and analyze meeting data:

1. **Get Fireflies API Access:**
   - Sign up or log into Fireflies.ai.
   - Obtain your Fireflies API key from the Fireflies developer or integration settings.

2. **Add Fireflies Node in n8n:**
   - In your n8n workflow editor, search for the Fireflies node (official Fireflies.ai integration exists).
   - Add the Fireflies node to your workflow.

3. **Configure Fireflies Node:**
   - Connect your Fireflies account by entering the API key.
   - Choose the desired Fireflies action, such as:
     - Fetch meeting transcripts.
     - Get meeting summaries.
     - Upload audio files for transcription.
     - Fetch meetings or speaker insights.

4. **Build Workflow Automation:**
   - Combine Fireflies actions with other n8n nodes (like Slack, Gmail, Notion, Google Sheets) to automate your work.
   - For example, set a trigger on meeting completion to automatically fetch the transcript and post a summary to Slack or save it to Notion.

5. **Test and Activate Workflow:**
   - Test the workflow to ensure connectivity and correct retrieval of data.
   - Activate the workflow for automatic processing.

There are also pre-built templates and community workflows on n8n.io that integrate Fireflies for common use cases, helping speed up setup.

This native integration allows meeting data from Fireflies.ai to flow seamlessly into other apps via n8n’s automation platform, boosting productivity.[1][2][3]

[1](https://guide.fireflies.ai/articles/4758387081-learn-about-n8n-x-fireflies-integration)
[2](https://github.com/firefliesai/n8n-nodes-fireflies)
[3](https://n8n.io/integrations/fireflies/)


### n8n x Perplexity

Yes, Perplexity can be integrated with n8n. n8n offers a dedicated Perplexity node that allows users to automate interactions with Perplexity's AI models within workflows. This integration supports sending prompts to Perplexity's large language models and receiving chat completions, enabling automation of tasks such as content generation, research, and data analysis directly within n8n.[1][2][3]

Integration Methods

- **Native Perplexity Node in n8n**: Provides easy setup for messaging models, customizing parameters, and managing API keys in n8n workflows.[3]
- **Community Node**: There is also a community-maintained n8n node for Perplexity available via npm, which supports multiple models and chat completion features.[4]
- **HTTP Request Node**: If the native node does not fulfill specific needs, you can use n8n’s HTTP Request node to make direct API calls to Perplexity using the official API key.[5]
- **Workflow Examples**: Tutorials and templates exist for building AI-powered research assistants and content generation workflows using the Perplexity-n8n integration.[6][7]

This integration allows users to combine Perplexity’s real-time AI insights with the broad automation capabilities of n8n, enhancing productivity and enabling complex automated workflows.[8][9]

[1](https://n8n.io/integrations/perplexity/)
[2](https://n8n.io/workflows/2824-query-perplexity-ai-from-your-n8n-workflows/)
[3](https://docs.n8n.io/integrations/builtin/app-nodes/n8n-nodes-langchain.perplexity/)
[4](https://github.com/watzon/n8n-nodes-perplexity)
[5](https://www.reddit.com/r/n8n/comments/1la3t1i/how_to_connect_perplexity_to_n8n/)
[6](https://ryanandmattdatascience.com/n8n-perplexity/)
[7](https://n8n.io/workflows/3673-ai-powered-research-assistant-with-perplexity-sonar-api/)
[8](https://www.linkedin.com/pulse/unlocking-automation-potential-perplexity-ai-n8n-peter-sigurdson-ewzfe)
[9](https://www.youtube.com/watch?v=VVutlm-avuI)
[10](https://www.youtube.com/watch?v=JnaEbfy1aqo)
[11](https://n8n.io/integrations/perplexity/and/read-ai/)
[12](https://www.youtube.com/watch?v=KKdiikp3UwI)
[13](https://pipedream.com/apps/perplexity/integrations/n8n-io)
[14](https://community.n8n.io/t/using-perplexity-api-with-the-ai-tools-agent/54308)
[15](https://www.youtube.com/watch?v=9Wo36LVLr3w)
[16](https://n8n.io/integrations/one-simple-api/and/perplexity/)
[17](https://n8n.io/workflows/2682-perplexity-research-to-html-ai-powered-content-creation/)
[18](https://www.youtube.com/watch?v=yOF7E4hmPkk)
[19](https://www.youtube.com/watch?v=_jm49FkBrUg)
[20](https://www.youtube.com/watch?v=LSPmrCX_cJI)

#### Perplexity x MCP

Yes, Perplexity does have an official MCP (Model Context Protocol) server.

It is called the "Perplexity Ask MCP Server" and serves as a bridge to connect Perplexity’s Sonar API with AI assistants and other AI frameworks, enabling seamless integration for real-time research, data access, and workflow automation.

This MCP server supports both local and remote contexts to allow AI systems to securely interact with external data sources, tools, and APIs within Perplexity’s platform.[1][2][3][4]

In summary, the Perplexity MCP server exists and is actively supported as part of their platform for enabling powerful AI integrations and enhanced context sharing.[2][3][1]

[1](https://docs.perplexity.ai/guides/mcp-server)
[2](https://github.com/perplexityai/modelcontextprotocol)
[3](https://www.perplexity.ai/help-center/en/articles/11502712-local-and-remote-mcps-for-perplexity)
[4](https://playbooks.com/mcp/laodev1-perplexity)



---

## FAQ


## Outro

### MCP x PlayWight

