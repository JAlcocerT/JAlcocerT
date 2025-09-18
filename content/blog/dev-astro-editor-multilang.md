---
title: "Multilanguage blogs with a SSG Astro Editor"
date: 2025-09-14T15:20:21+01:00
draft: false
tags: ["Astro","Just-SSG","NextJS","ToastUI md editor"]
description: 'Understanding i18n websites with Astro Blog Themes.'
url: 'astro-i18'
---

**TL;DR** Finally getting to try **i18n languages with Astro SSGs**

+++ Plus adding interesting shortcodes / components : https://github.com/JAlcocerT/just-ssg

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/just-ssg" title="Just SSG Repository" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Making SSG look cool with shortcodes and components" >}}
{{< /cards >}}

**Intro**

I failed to understand properly i18n on [this *podcast* post](https://jalcocert.github.io/JAlcocerT/tech-for-podcast/).

> I got a way with a cool [Astro Pod Theme Fork though](https://github.com/JAlcocerT/astropod)

The

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/astro-editor" title="NEW - Astro Editor" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Editing astro posts md via NextJS + ToastUI " >}}
{{< /cards >}}

## An Editor for Astro Blog Posts

I know there are few ways to do markdown edits...

But after [trying react markdown](https://jalcocert.github.io/JAlcocerT/astro-journal-theme/) and [toast ui with the typography theme](https://jalcocert.github.io/JAlcocerT/nextjs-toast-ui-editor/), I stay with ToastUI:

![Gemini canva toastUI](/blog_img/web/nextjs-astro-editor/toastui-gemini.png)

{{< details title="My Initial requirements for the AstroEditor for Cursor 📌" closed="true" >}}

This document details the features and functionality for a local-first markdown editor.

The application should be built with a focus on an efficient content creation workflow for static sites, specifically for Astro themes.

Core Requirements - The following features are mandatory for the initial build of the application:

Folder Selection: The user must be able to select a local folder to scan for files inside `astro-themes`. This should be implemented via a visible input field or a file picker dialog.

File Tree/List: After selecting a folder, the application must display a list of all `.md` and `.mdx` files found within that folder and its subdirectories.

Side-by-Side Editor: When a file is selected from the list, the ToastUI Editor should open on the right-hand side of the screen, with the file list remaining visible on the left.

Editor Functionality: The ToastUI Editor must be fully functional, including markdown editing, saving the .md or .mdx to local storage and a live preview of the content.

Focus Mode: A button or toggle that hides the file list, expanding the editor to full width for a distraction-free writing experience.

File Saving: The application must have a clear mechanism to save the current editor content directly back to the selected local .md or .mdx file.

**My follow uP**

how have you managed to render the content of the slidev at 3030 inside the nextjs app at 3000? are we rebuilding slidev all the time or is it just life?

I have just moved the nextjs app to the repo root

I see one error when going to WYSIIWYG option (which id like to be defaults)
also, when hitting preview, can we go to a path the matches the name of the folder we are at?

and can we bring the frontmatter in the beginning of the .md ?

can you fix those and then try that the container setup?

**Good-to-Have Features** - I did not mentioned these on the first go

Real-time Saving: The application must automatically save the editor state locally as edits are made to prevent data loss.

Frontmatter Editor: A dedicated UI panel, separate from the main markdown content, for editing a file's frontmatter (e.g., title, date, tags, description). This prevents syntax errors and provides a structured way to manage metadata.

Asset Handling: The ability to drag and drop images directly into the editor. The application should handle placing the image file into a specified local directory (e.e., src/assets/images) and automatically insert the correct markdown link into the document.

File Management: Add basic file management capabilities such as creating new files, creating new folders, and deleting existing files directly from the UI.

Keyboard Shortcuts: Implement standard keyboard shortcuts for common actions, like saving (Ctrl + S), toggling focus mode, and opening the file picker.

Multi-Tab Editing: Allow users to open and switch between multiple files in a tabbed interface, similar to a code editor, without losing their editing state.

Git Integration: A basic UI for committing changes, viewing the file's Git status (e.g., modified, untracked), and pushing/pulling from a remote repository.

{{< /details >}}

After using 3 of my 4 monkey fingers with cursor.

I got this:

![alt text](/blog_img/web/nextjs-astro-editor/toastui-nextjs-1.png)



## Cool Blogging Themes

The Jekyll Chirpy theme is so cool that others have taken it as inspiration.

Which is kind of an improved jekyll theme that i used for the RPi: https://jalcocert.github.io/RPi/

1. [Fuwari](#fuwari)
2. [Frosti](#frosti)
3. HUGO has also *something* to say: [Hugo Theme Stack](#hugo-theme-stack)

* https://github.com/g1eny0ung/hugo-theme-dream
* https://github.com/onweru/compose

> Those helped me to make a better HUGO documentation Theme :)

### Fuwari

I wanted to try for long Fuwari Theme:

* https://github.com/saicaca/fuwari

```sh
#from the route of the astro editor
#git clone https://github.com/JAlcocerT/astro-editor


#Editing FUWARI via astro editor - Example
git clone https://github.com/saicaca/fuwari ./astro-themes/fuwari
#git clone https://github.com/JAlcocerT/jmodels-web
#https://github.com/JAlcocerT/j-models

cd ./astro-themes/fuwari
pnpm install && pnpm run dev
```

This can be combined with PB.

### Frosti

I got to know: 

* https://github.com/EveSunMaple/Frosti
    * https://github.com/JAlcocerT/frosti
    * https://astro.build/themes/details/frosti/

> MIT |  A clean, elegant, and fast static blog template! 🚀 Developed with Astro


### Hugo Theme Stack

I would say this is the Fuwari in Hugo :)

* https://github.com/CaiJimmy/hugo-theme-stack-starter
    * https://demo.stack.jimmycai.com/

> MIT |  A quickstart template to create a Hugo blog using hugo-theme-stack 

### Other Blog Themes

* https://github.com/cworld1/astro-theme-pure

> Apache v2 |  ⭐ A simple, fast and powerful blog & document theme built by Astro 

* https://github.com/artemkutsan/astro-citrus

> MIT

## Conclusions

Got that ToastUI editor working powered by NextJS for astro sites!

---

## FAQ


### How to create an Astro-Editor

```sh
git init
git branch -m main
git config user.name
git config --global user.name "JAlcocerT"
git config --global user.name
git add .
git commit -m "Initial commit: Starting astro editor via NextJS and ToastUI"

#sudo apt install gh
gh auth login
gh repo create astro-editor --private --source=. --remote=origin --push

#git init && git add . && git commit -m "Initial commit: Starting astro editor via NextJS and ToastUI" && gh repo create astro-editor --private --source=. --remote=origin --push
```