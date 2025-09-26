# n8n Chatbot Integration for JAlcocerT Website

This guide explains how to set up and configure the n8n embedded chatbot for your Hugo website.

## Files Added/Modified

### 1. Hugo Configuration (`hugo.yaml`)
- Added chatbot configuration parameters
- Set webhook URL and chatbot settings

### 2. Layout Files
- `layouts/partials/chatbot.html` - Main chatbot component
- `layouts/partials/custom/head-end.html` - Loads the n8n script
- `layouts/partials/footer.html` - Includes chatbot in footer
- `layouts/_default/baseof.html` - Base template override

### 3. n8n Workflow
- `n8n-chatbot-workflow.json` - Sample workflow configuration

## Setup Steps

### Step 1: Install n8n (Choose one option)

#### Option A: n8n Cloud (Recommended for beginners)
1. Go to [n8n.cloud](https://n8n.cloud)
2. Sign up for a free account
3. Access your n8n instance through the web interface

#### Option B: Self-host with Docker
1. Use the provided `docker-compose-n8n.yml` file:
   ```bash
   # Update the password in the compose file first
   docker-compose -f docker-compose-n8n.yml up -d
   ```
2. Access n8n at `http://localhost:5678`
3. Login with admin/your-secure-password

#### Option C: Install with npm

```bash
npm install -g n8n
n8n
```

### Step 2: Configure n8n Instance

1. **Import the Workflow**:
   - Open your n8n instance
   - Import the `n8n-chatbot-workflow.json` file
   - Configure your OpenAI API credentials

2. **Set Up Webhook**:
   - The workflow creates a webhook at `/webhook/chatbot`
   - Note the full webhook URL:
     - **n8n Cloud**: `https://your-instance.n8n.cloud/webhook/chatbot`
     - **Self-hosted**: `https://your-domain.com/webhook/chatbot` or `http://localhost:5678/webhook/chatbot`

3. **Activate the Workflow**:
   - Enable the workflow in n8n
   - Test it with a sample message

### Step 2: Update Hugo Configuration

1. **Update `hugo.yaml`**:
   ```yaml
   params:
     chatbot:
       enable: true
       webhookUrl: "https://your-actual-n8n-instance.com/webhook/chatbot"
       label: "JAlcocerT Assistant"
       description: "Ask me anything about development, tech, or this site!"
   ```

2. **Replace the placeholder URL** with your actual n8n webhook URL

### Step 3: Test the Integration

1. **Build and serve your Hugo site**:
   ```bash
   hugo server
   ```

2. **Check the chatbot**:
   - Look for the chat icon in the bottom-right corner
   - Click it to open the chat interface
   - Send a test message

## Customization Options

### Chatbot Appearance
Edit `layouts/partials/chatbot.html` to customize:
- Colors and styling
- Position (bottom-right, bottom-left, etc.)
- Theme (light/dark)
- Auto-open behavior

### Chatbot Behavior
Modify the n8n workflow to:
- Add different AI models
- Implement conversation memory
- Add specific knowledge about your site
- Integrate with other services

### Advanced Features

1. **Session Management**:
   - The workflow includes basic session handling
   - You can enhance it for conversation continuity

2. **Knowledge Base Integration**:
   - Add nodes to search your blog content
   - Integrate with vector databases
   - Implement RAG (Retrieval Augmented Generation)

3. **Analytics**:
   - Track chatbot usage
   - Monitor conversation quality
   - A/B test different responses

## Troubleshooting

### Common Issues

1. **Chatbot not appearing**:
   - Check if `chatbot.enable` is set to `true`
   - Verify the webhook URL is correct
   - Check browser console for JavaScript errors

2. **Messages not sending**:
   - Verify n8n workflow is active
   - Check webhook URL accessibility
   - Test webhook directly with curl

3. **Styling issues**:
   - Check CSS custom properties
   - Verify theme compatibility
   - Test in different browsers

### Testing Commands

```bash
# Test webhook directly
curl -X POST https://your-n8n-instance.com/webhook/chatbot \
  -H "Content-Type: application/json" \
  -d '{"message": "Hello, test message", "sessionId": "test-session"}'

# Build and serve Hugo
hugo server --bind="0.0.0.0" --port=1313
```

## Security Considerations

1. **Rate Limiting**: Implement rate limiting in your n8n workflow
2. **Input Validation**: Validate and sanitize user inputs
3. **API Keys**: Keep your OpenAI API key secure
4. **CORS**: Configure CORS properly for your domain

## Next Steps

1. **Deploy to Production**: Update your production Hugo site
2. **Monitor Performance**: Set up monitoring for the chatbot
3. **Gather Feedback**: Collect user feedback and iterate
4. **Enhance Features**: Add more advanced capabilities over time

## Resources

- [n8n Embedded Chat Interface](https://github.com/symbiosika/n8n-embedded-chat-interface)
- [n8n Documentation](https://docs.n8n.io/)
- [Hugo Custom Layouts](https://gohugo.io/templates/lookup-order/)
- [Hextra Theme Documentation](https://hextra.imfing.com/)
