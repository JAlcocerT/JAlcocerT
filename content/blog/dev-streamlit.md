---
title: "Everything I enjoy about Streamlit"
date: 2025-03-01T10:20:21+01:00
draft: false
tags: ["Dev"]
description: 'Quick POC Web Apps with Python and Streamlit. Applied to a Real Estate Calculator with GenAI Powered recommentations.'
url: 'streamlit-is-cool'
---


## Features under a Wall

So far, Ive come across few ways (x4) to place **authentication on top of Streamlit Apps**:

1. The `st.login` built in feature: https://docs.streamlit.io/develop/api-reference/user/st.login

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/how-to-migrate-a-website/#for-the-real-estate-project" title="Real Estate Scrapping Photos - Post ↗" icon="book-open" >}}
  {{< card link="https://github.com/JAlcocerT/Streamlit-AIssistant/blob/main/Z_AIgents/WebMigrAItion/" title="MigrAItion Photos Script Source Code ↗" icon="book-open" >}}
{{< /cards >}}

### Provided Users and Pass

2. By using the `streamlit-authenticator` library, only my client can access it:

![Streamlit User Auth](/blog_img/biz/RE/re-tool-userauth.png)

Its all about: https://pypi.org/project/streamlit-authenticator/

{{< details title="There is a sample of this PoC authentication at MultiChat or RE Photo Tool 📌" closed="true" >}}

* https://github.com/JAlcocerT/Streamlit-MultiChat/blob/main/Streamlit_Pages/Auth_functions.py
* https://github.com/JAlcocerT/Streamlit-AIssistant/blob/main/Z_AIgents/WebMigrAItion/OpenAI_MigrateWebInfo_v4st.py


{{< /details >}}

{{< callout type="info" >}}
With this method, you can have several hardcoded user/passwords created!
{{< /callout >}}

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/create-streamlit-chatgpt/" title="MultiChat Post" image="https://raw.githubusercontent.com/JAlcocerT/Streamlit-MultiChat/main/streamlit-multichat.png" subtitle="Post where I explained the creation of the streamlit chatbot" >}}
  {{< card link="https://github.com/JAlcocerT/Streamlit-MultiChat/blob/main/Streamlit_Pages/Auth_functions.py" title="Multichat with Auth Source Code" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Users and passwords configuration Script " >}}
{{< /cards >}}

### Email Verification


Recently I got to know also about this project to verify emails:

* https://rapid-email-verifier.fly.dev/

> MIT | Privacy-first, Free, **Open Source email verifier**


{{< details title="How to use Rapid Email Verifier? 📌" closed="true" >}}


{{< /details >}}


3. You can also do the trick by passing the hard work to a 3rd party **subscription newsletter**, like `mailerlite`, and you will query its API.

4. Using **Stripe API**: if an user have an active subscription or free tier evalution, it can go ahead and use your Streamlit App

> Points 2 and 3 are features that I have explored with the AIssistant project:

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/ai-useful-yet-simple/" title="AIssistant Post" image="https://raw.githubusercontent.com/JAlcocerT/Streamlit-MultiChat/main/streamlit-multichat.png" subtitle="Post where I explained the creation of the streamlit AIssistant" >}}
  {{< card link="https://github.com/JAlcocerT/Streamlit-AIssistant" title="AIssistant Source Code" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Different auth options" >}}
{{< /cards >}}

![Streamlit User Auth](/blog_img/apps/streamlit/slidev-ghpages.png)

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/creating-presentations-with-ai/" title="MultiChat SliDev" image="https://raw.githubusercontent.com/JAlcocerT/Streamlit-MultiChat/main/streamlit-multichat.png" subtitle="MiltiChat SliDev" >}}
  {{< card link="" title="SliDev PPTs as Code" image="/blog_img/apps/gh-jalcocert.svg" subtitle="I Wrote a small PPT with SliDev for MultiChat and Published it with GHA" >}}
{{< /cards >}}