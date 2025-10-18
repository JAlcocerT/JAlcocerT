---
title: "Website knowledge updates. Waiting / Landings with AI?"
date: 2025-10-17T10:20:21+01:00
draft: false
tags: ["just-ssg","Astro 101","Hugo 101","IG Gallery OSS","Landing Pages","BCMS vs PagesCMS"]
description: 'New ATH for my SSG knowledge. Landing 101 that convert. CodexCLI for idea validation.'
url: 'selling-with-a-landing-website'
---


![Streamlit Funnel with Plotly](/blog_img/apps/streamlit/streamlit-plotly-funnel.png)
https://jalcocert.github.io/JAlcocerT/ai-bi-tools/#pygwalker

## Web Front End - Theme

* https://github.com/LaB-CH3/astrobrew
    * https://astro.build/themes/details/astrobrew/

    
>  Astrobrew is a free and open-source elegant **landing page for Micro SaaS** products built with Astro & Skeleton CSS

**Tl;DR**

Last year I made couple of 101 guides for [HUGO](https://jalcocert.github.io/JAlcocerT/using-hugo-as-website/) and [ASTRO](https://jalcocert.github.io/JAlcocerT/using-astro-as-website/).

But it was time to put cool components like this [ig gallery](https://github.com/JAlcocerT/real-estate-moi/blob/main/moirealestate-astro-theme/src/components/InstagramGalleryLocalFolder.astro) used [on this mdxhere](https://github.com/JAlcocerT/real-estate-moi/blob/main/moirealestate-astro-theme/src/content/property/beachfront-paradise-instagram-gallery.mdx)

+++ People shared on reddit their [favourite minimalistic sites](https://www.reddit.com/r/webdev/comments/1gh38fz/whats_your_favorite_very_minimal_personal_website/)
+++ https://picsum.photos/ just in case you are tired of unsplash and just select what you want via https://picsum.photos/images

**Intro**

Making a Landing should be easy already, with tools like: https://github.com/wandb/openui

> OpenUI let's you describe UI using your imagination, then see it rendered live.




Ok, ok, you have embraced the power of SSGs and aware of how many cool things can be done *,statically'* aka [in browser with CSR](https://jalcocert.github.io/JAlcocerT/csr-and-js/).

And surprisingly, [Front End can do many cool things, *including authentication*](https://jalcocert.github.io/JAlcocerT/front-end-and-auth/#whats-forward-auth)

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/just-ssg" title="Just SSG Repository" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Making SSG look cool with shortcodes and components" >}}
{{< /cards >}}


**A Better Waiting2Landing** On [this post](https://jalcocert.github.io/JAlcocerT/waiting-list-pocketbase/) I thought Ill make a better version of the initial waiting2landing presented https://jalcocert.github.io/JAlcocerT/how-to-create-a-waiting-list/

![Astro Waiting List + Formbricks URL Link](/blog_img/web/waitingtolanding/waitinglist-formbricks-prefilled.png)

Time to create
```

```


```sh
git init
git branch -m main
git config user.name
git config --global user.name "JAlcocerT"
git config --global user.name
git add .
git commit -m "Initial commit: Waiting to Landing v2 with PB and Cloudflare Workers and Pages"

#sudo apt install gh
gh auth login
gh repo create waiting-to-landing-pb --private --source=. --remote=origin --push
```

There is one thing still stucked...

**How to make SSG edit friendly**?

Some WYSIWYG approach? 

Repurposing md note taking tools?

Or...giving a try to F/OSS CMS?

One more time, because I already gave a try to these from a [recent post](https://jalcocert.github.io/JAlcocerT/mailerlite-for-saas/#a-theme-to-test-this): [bcms](https://github.com/bcms/cms) and [pagescms](https://github.com/pages-cms/pages-cms)

This can be used to get [a cool ig like gallery](https://github.com/JAlcocerT/just-ssg/tree/main/astro-ssg/ig-gallery-folder) without importing each file independently, just the folder where they are saved:

![IG Gallery astro and jsx for beyondajourney](/blog_img/web/udf/ig-gallery-beyondajourney.png)

```mdx
<GalleryLocalFolder
  folder="content/articles/exploring-netherlands-by-bike/imgs"
  initialLoadCount={6}
/>
```

Place those youtube videos:

```mdx
<div style="display: flex; justify-content: center;">
    <iframe width="560" height="315" src="https://www.youtube.com/embed/hj0MfciILEc" title="Vistula near Kazimierz Dolny Video" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
</div>
```


## Potential Themes for a Landing

1. This cool astro theme: https://github.com/ctrimm/astro-payroll-solution-theme

```sh
git clone https://github.com/ctrimm/astro-payroll-solution-theme #MIT Licensed
#https://payflo.corytrimm.com/ #demo

npm run dev -- --host 0.0.0.0 --port 4321 #http://192.168.1.11:4321/
```

Sounds familiar?

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/fastapi-x-pocketbase/" title="Payroll Theme with PB as auth" image="blog_img/dev/FE/ssg-cfworkers-pocketbase.png" subtitle="SSG and CF Workers + Pocketbase | Post" >}}
  {{< card link="https://github.com/JAlcocerT/payroll-workers-pb/" title="Payroll Theme with PB as auth" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Source Code Astro Theme + CF Workers + PB users collections as Auth" >}}
{{< /cards >}}



---

## Conclusions


{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/linkstack" title="LinkStack Docker Config 🐋 ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/littelink" title="LittleLink Docker Config 🐋 ↗" >}}
{{< /cards >}}

Cool landings out-there: *these should be guiding slubnechwile.com.

Get a cool theme: https://www.builtatlightspeed.com/category/astro or from astro themes

1. `tydal.co`

2. `https://esim.holafly.com/` - landing with a very clear header

3. `purplepalm.ai` created [here](https://forocoches.com/foro/showthread.php?t=10455640&page=4) 

4. `https://operately.com/`

Those should be enough for some inspiration.


Resumen de los 3 puntos clave de emprendimiento:

1. **El marketing es más importante que la tecnología usada.** No pienses que un producto “molón” se venderá solo; a la empresa solo le importa que soluciones un problema real, sin importar cómo lo hagas (IA, Excel, etc.). Enfócate en B2B, ya que las empresas están más dispuestas a pagar por soluciones que resuelvan problemas concretos.

2. **Detecta un problema real.** Usa tu red de contactos y experiencia para identificar auténticas necesidades en empresas y luego dedícate a resolverlas, sin obsesionarte con la tecnología elegida.

3. **Valida la idea antes de programar o desarrollar nada.** Antes de ponerte a construir, crea una página de espera (waitlist) y comprueba si realmente hay interés (por ejemplo, recolectando correos de potenciales clientes). Solo si ves interés real, desarrolla la solución; si no, repite el proceso buscando otros problemas. Puedes hacer una pequeña demo simple con IA si es útil, pero manteniendo lo más básico posible.

> Which are inline with the BiP Recommendations from [product hunt, here](https://www.producthunt.com/products/build-in-public-cheatsheet?launch=build-in-public-cheatsheet) from [reddit](https://www.reddit.com/r/SaaS/comments/n42n8r/the_build_in_public_cheatsheet_how_people_go_from/)

Los puntos nuevos que aporta el post “Build In Public Cheatsheet” en Product Hunt son:

- **El enfoque consiste en compartir de forma transparente el desarrollo y el progreso de tu proyecto:** La idea es que construir en público no es solo marketing, sino crear una relación con potenciales usuarios y obtener feedback real durante todo el proceso.

- **Proporciona una lista práctica de tipos de publicaciones** que puedes hacer durante tu viaje de “build in public”: Ejemplos concretos como tuits, capturas de pantalla, avances, errores y aprendizajes.

- **Incluye una lista pública de otros emprendedores que construyen en público** y la opción de unirte a esa comunidad, facilitando networking y visibilidad.

- **Ofrece un tablero(pipeline) para planificar el viaje “Build in Public”**, permitiéndote organizar tus anuncios, lanzamientos y experimentos públicamente.

- **Enumera principios y buenas prácticas clave para construir en público**, ayudando a tener un marco ético y estratégico en tu comunicación.

- **Recomienda herramientas útiles para el proceso**, para facilitar desde publicación hasta análisis y seguimiento de comunidad.

- **El objetivo final es convertir la cheatsheet en un handbook más completo** basado en experiencia real y colectiva, con espacio para feedback y mejora constante por parte de los usuarios.

Esto añade elementos de comunidad, planificación estructurada y repertorio específico de acciones y herramientas al enfoque estándar de validar ideas y captar demanda antes de construir.[1]

La comunidad de Reddit en r/SaaS, en general, coincide con los enfoques de la cheatsheet “Build In Public” y las recomendaciones de validar una idea antes de desarrollarla. Los usuarios destacan estos puntos adicionales:

- **Validación real:** Recomiendan aprovechar la construcción en público no solo como marketing, sino como vía para obtener feedback genuino y rápido de la comunidad sobre el producto y sus características.[1]
- **Tipos de publicaciones útiles:** Compartir avances, errores, aprendizajes y ejemplos reales (tweets, capturas de pantalla, demos) ayuda tanto a validar ideas como a captar seguidores o potenciales usuarios.[1]
- **Herramientas y organización:** Se valora contar con una plantilla o board para planificar qué compartir públicamente y tener muy claro el objetivo de cada comunicación.
- **Contribución de la comunidad:** Algunos comentarios sugieren personalizar la cheatsheet, compartir ideas de mejora y usar el repositorio como un espacio para sumar prácticas eficaces.
- **Cuidado con el “eco-chamber”:** Algunos advierten del riesgo de obtener feedback solo de la comunidad builder/tech (ejemplo: Twitter, IndieHackers, Reddit) y no del público objetivo real del producto, por lo que insisten en no perder el foco en los auténticos clientes.[2]

En resumen, hay consenso sobre la utilidad de construir en público para tener feedback temprano, pero se recalca la importancia de hacerlo con propósito y orientar la validación hacia el público objetivo, no solo hacia otros emprendedores o comunidades tech. Esto agrega matices a la estrategia y refuerza lo aprendido en los recursos previos.[2][1]

[1](https://www.reddit.com/r/SaaS/comments/n42n8r/the_build_in_public_cheatsheet_how_people_go_from/)
[2](https://www.reddit.com/r/SaaS/comments/1l26yu8/dont_build_in_public_its_killing_your_startup_and/)
[3](https://www.reddit.com/r/developersIndia/comments/1hsmd13/whats_the_build_in_public_scenes_i_am_posting_on_x/)
[4](https://www.reddit.com/r/SaaS/comments/1levhf2/building_in_public_isnt_a_good_idea_heres_my/)
[5](https://www.reddit.com/r/startups/comments/rs850b/how_do_i_actually_build_in_public/)
[6](https://www.scribd.com/document/432955800/Top-Reddit-Threads-Cheat-Sheet)
[7](https://www.reddit.com/r/indiehackers/comments/1hcrick/best_way_to_build_in_public/)
[8](https://www.reddit.com/r/SideProject/comments/1gwi349/i_made_20k_in_2_months_by_building_in_public_on_x/)
[9](https://www.reddit.com/r/Entrepreneur/comments/123c67j/any_tips_for_building_in_public/)
[10](https://www.reddit.com/r/SaaS/comments/si9rqi/how_to_build_in_public/)
[11](https://www.reddit.com/r/SideProject/comments/1mxdrgk/build_in_public_day_1365_from_0_to_100k/)
[12](https://www.reddit.com/r/SaaS/comments/zzb5b2/thoughts_on_building_in_public_on_twitter/)
[13](https://www.reddit.com/r/SaaS/comments/1fy9shs/whats_the_best_strategy_to_build_community_around/)
[14](https://www.reddit.com/r/productivity/comments/1l53wli/i_summarized_top_reddit_selfhelp_posts_this_is/)
[15](https://www.reddit.com/r/ChatGPT/comments/10cgdcz/a_listcheat_sheet_with_lots_and_lots_of_prompts/)
[16](https://www.reddit.com/r/SaaS/comments/1f0z5bc/why_you_should_build_in_public_as_a_small_founder/)
[17](https://www.reddit.com/r/SaaS/comments/1k06lue/build_in_public_what_are_you_working_on/)
[18](https://www.reddit.com/r/SideProject/comments/1goijjv/thought_building_in_public_would_be_cool_until/)
[19](https://www.reddit.com/r/SaaS/comments/1dndfj3/is_building_in_public_worth_the_hype/)
[20](https://www.reddit.com/r/SideProject/comments/1gst45g/i_made_a_directory_of_people_who_build_in_public/)

### Example TinyHost

I got to know a very cool SaaS on twitter:


* https://tiiny.host/#pricing





{{< cards cols="3" >}}
  {{< card link="https://pagespeed.web.dev/" title="PageSpeed Insights" >}}
  {{< card link="https://search.google.com/search-console/" title="Google Search Console" >}}
  {{< card link="https://trends.google.es/trends/" title="Google Trends" >}}  
{{< /cards >}}


{{< cards cols="2" >}}
  {{< card link="https://www.websitecarbon.com/" title="Website Carbon Benchmark" >}}
  {{< card link="https://web-check.xyz/" title="Web Check Tool" >}}
{{< /cards >}}


---

## FAQ

### SSG Setup Installs

For Astro, see: https://stateofjs.com/en-US

```sh
#sudo apt install npm #this is ~180mb, but it will be an older version

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

nvm install --lts

node --version
npm --v
```

For HUGO, based in GO:

```sh
hugo version
```

> Be mindful about HUGO extended versions for some themes to work!

#### Testing SSG Themes Locally

```sh
npm run dev -- --host 0.0.0.0 --port 4321 #http://192.168.1.11:4321/

time npm run build

#npm install -g http-server
#http-server ./dist

#cd ./dist
#python3 -m http.server 8009

#npm run build
#npx serve -s dist
#rm -rf .git
```

```sh
#hugo server 
hugo server --bind="0.0.0.0" --baseURL="http://192.168.1.106" --port=1319
```


#### SSG with Containers

To put astro/hugo inside a container is as simple as: *and you can also develop in this way, inside a container, without installing node/hugo/whatever:

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/blob/main/ssg-hugo" title="HUGO SSG Selfhosted | Docker Config Setup 🐋 ↗"  >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/blob/main/ssg-astro" title="Astro SSG Selfhosted | Docker Config Setup 🐋 ↗"  >}}
{{< /cards >}}


### Checks before web delivery

The good thing about astro, is to plug that image optimization:

![alt text](/blog_img/web/astro-img-optim.png)