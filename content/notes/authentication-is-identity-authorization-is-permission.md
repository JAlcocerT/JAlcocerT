---
title: "Authentication is identity, authorization is permission"
date: 2025-08-23
tags: ["authentication", "authorization", "security"]
description: "Login proves who the user is, but the product still needs a separate rule for what that user can do."
---

Authentication and authorization solve different problems.

Authentication answers: who is this user? Authorization answers: what can this user do now? 

Mixing them creates weak products: a logged-in user is not automatically allowed to edit, buy, publish, export, or access every record.

The useful pattern is to centralize identity, then enforce permissions at the backend or gateway where the real action happens.

Frontend checks can improve UX, but they should not be the source of truth for access.

Login is the start of the security model, not the whole model.

Related:

- [FrontEnd 101. SPAs and ways to do Auth]({{< relref "/blog/dev-fe.md" >}})
- [Authentication]({{< relref "/docs/Dev/authentication.md" >}})
- [Serverless Invoices repo](https://github.com/JAlcocerT/serverless-invoices)
- [Streamlit Authenticator example](https://github.com/JAlcocerT/Streamlit-MultiChat/blob/main/Streamlit_Pages/Auth_functions.py)
- [Streamlit auth experiments](https://github.com/JAlcocerT/Streamlit-AIssistant/tree/main/Z_Auth_Ways)
- [Make Podcast repo](https://github.com/JAlcocerT/make-podcast)
