---
title: "Thermodynamics"
date: 2026-05-09
draft: false
tags: ["Trip Planner v4 x Go-Solar x Aerotermia PoC","HeatraPy vs PyScipe"]
description: 'Carnot, thermodynamics. Solar plan B.'
url: 'thermodynamics'
math: true
---

  
**Tl;DR**

[Lisa](https://www.youtube.com/watch?v=oygSFCZZyoU), in this house we obey the laws of thermodynamics!

**Intro**

Guess what happens when you take [trip planner v4](https://github.com/JAlcocerT/Py_Trip_Planner/tree/main/poc-trip-planner-v4), the go solar with the batteries and rainny days, with...

```sh
git clone /poc
cd poc/ #z-trip-planner-v4

```

What Happens is that you can validate the [results of ppl in forums](https://forocoches.com/foro/showthread.php?t=9806597).

Or just create a way to check if aerothermics applies to you from such [dev plan](https://github.com/JAlcocerT/poc/blob/main/aerothermics/dev-plan.md):

![alt text](/blog_img/apps/aerotermia.png)


Es una pregunta excelente, porque a primera vista parece que la aerotermia es una máquina de "energía infinita" o un movimiento perpetuo al darte **4 kWh** de calor por cada **1 kWh** que pagas.

Sin embargo, no violamos absolutamente ninguna ley; de hecho, la aerotermia es un ejemplo perfecto de cumplimiento estricto de la termodinámica. 

El truco está en que la gente suele confundir **eficiencia** con **rendimiento**.

Aquí te explico por qué no estamos rompiendo el universo:

### 1. Primera Ley: Conservación de la Energía

> "La energía no se crea ni se destruye, solo se transforma".

Si tu Panasonic entrega **$4\text{ kW}$** térmicos dentro de tu casa consumiendo solo **$1\text{ kW}$** de electricidad, parece que hemos "creado" $3\text{ kW}$ de la nada. **Falso.**

* **Balance:** $1\text{ kW}$ (Electricidad) + $3\text{ kW}$ (Calor extraído del aire exterior) = **$4\text{ kW}$** (Calor entregado en casa).
* La energía total se conserva perfectamente. La máquina no "crea" calor, simplemente lo **transporta** de un lugar a otro usando la electricidad como vehículo.

### 2. Segunda Ley: La Entropía y el Flujo de Calor

> "El calor fluye espontáneamente de lo caliente a lo frío".

Esta ley dice que no puedes enfriar algo que ya está frío para calentar algo que está caliente sin "pagar un peaje".

* Para mover calor "cuesta arriba" (del aire frío de la calle a tu casa caliente), la naturaleza exige un **trabajo externo**.
* Ese trabajo es el que realiza tu **compresor**. Si intentaras hacer esto sin electricidad, sería imposible. La aerotermia "paga" el peaje termodinámico con los vatios que generan tus placas solares.

### 3. El concepto de Eficiencia vs. COP

En un radiador eléctrico tradicional, el rendimiento es del **100%** (1 kW luz = 1 kW calor). Ahí estás limitado por la Primera Ley de forma directa.

En la aerotermia no hablamos de rendimiento térmico, sino de **$COP$ (Coefficient of Performance)**. No es una medida de creación de energía, sino una medida de **capacidad de bombeo**. Es como una bomba de agua:

* No necesitas la energía de 1000 litros de agua para mover 1000 litros de agua.
* Solo necesitas la energía necesaria para vencer la fricción y la gravedad.

### 4. El Ciclo de Carnot: El límite real

Existe un límite teórico máximo de eficiencia que ninguna máquina puede superar (el Ciclo de Carnot).


$$COP_{max} = \frac{T_{caliente}}{T_{caliente} - T_{fria}}$$


*(Nota: Las temperaturas deben estar en Kelvin).*

Si en Barcelona hace $10\text{°C}$ ($283\text{ K}$) y quieres tu casa a $20\text{°C}$ ($293\text{ K}$), el límite termodinámico teórico sería un **$COP$ de $29,3$**. Como tu máquina tiene un **$COP$ real de $4$**, estás lejísimos de violar las leyes de la física; de hecho, ¡todavía hay mucho margen de mejora tecnológica!

**En conclusión:** Tu sistema es tan eficiente no porque rompa las reglas, sino porque es lo suficientemente inteligente para dejar que la naturaleza (el aire exterior) haga la mayor parte del trabajo pesado, mientras tus placas solares solo se encargan de empujar ese calor hacia dentro.

¿Te habías fijado que cuando la máquina calienta tu casa, el aire que sale de la unidad exterior está mucho más frío que el ambiente? Ahí es donde ves físicamente cómo le estás "robando" la energía a la calle.


---

¡Exacto! Has dado en el clavo. La **entropía** es la que dicta las reglas del juego, pero es la **entalpía** la que nos permite llevar la contabilidad de la energía que entra y sale de tu casa.

Para entender tu aerotermia como un físico, hay que mirar el **Ciclo de Rankine** de refrigeración. Aquí tienes las ecuaciones clave:

### 1. La Primera Ley y la Entalpía ($H$)

En termodinámica, cuando trabajamos con fluidos en movimiento (como el refrigerante R32 de tu Panasonic), no usamos solo la energía interna, sino la **entalpía** ($h = u + Pv$), que mide la energía total de un sistema incluyendo el trabajo necesario para desplazar el fluido.

El balance de energía en cada componente de tu máquina se define por la diferencia de entalpías:

* **En el Compresor (Consumo eléctrico):**

$$w_c = h_2 - h_1$$



*(Donde $h_1$ es la entalpía al entrar al compresor y $h_2$ al salir).*
* **En el Condensador (Calor que calienta tu casa):**

$$q_{out} = h_2 - h_3$$


* **En el Evaporador (Calor que robas de la calle):**

$$q_{in} = h_1 - h_4$$



### 2. La Segunda Ley y la Entropía ($S$)

Aquí es donde entra la **entropía**. En un mundo ideal (adiabático e irreversible), el compresor sería **isentrópico** ($s_1 = s_2$), es decir, la entropía no cambiaría.

Sin embargo, en tu máquina real, el compresor genera fricción y calor interno, por lo que:


$$s_2 > s_1$$


Ese aumento de entropía es lo que hace que tu sistema no sea "perfecto" y necesites más electricidad de tus placas de la que dictaría la teoría pura.

### 3. La ecuación del COP (El resumen de tu ahorro)

Combinando las entalpías, podemos calcular el rendimiento real de tu instalación:

$$COP_{calefacción} = \frac{q_{out}}{w_c} = \frac{h_2 - h_3}{h_2 - h_1}$$

Esta ecuación explica por qué tu sistema es tan eficiente: la diferencia de entalpía que obtienes en el condensador ($h_2 - h_3$) es mucho mayor que el trabajo que le pides al compresor ($h_2 - h_1$).

### 4. El Diagrama $P\text{-}h$ (Presión-Entalpía)

Los ingenieros no usan fotos para ver cómo funciona tu Panasonic, usan este diagrama. Es el "mapa" de lo que ocurre dentro de los tubos:

* **Eje Vertical:** Presión ($P$).
* **Eje Horizontal:** Entalpía ($h$).

En este gráfico se ve claramente cómo la válvula de expansión reduce la presión sin cambiar la entalpía (proceso **isentálpico**, $h_3 = h_4$), pero el compresor aumenta tanto la presión como la entalpía para poder soltar el calor dentro de tu salón.

---

### Resumen termodinámico para tu caso:

* **Entalpía:** Es el **"cuánto"**. Te dice cuántos Julios de calor estás moviendo realmente.
* **Entropía:** Es el **"por qué"**. Te explica por qué necesitas un compresor eléctrico y por qué el calor no entra solo a tu casa desde el frío exterior (la naturaleza prohíbe que la entropía del universo disminuya sin realizar un trabajo).

¡Exacto! Tienes una memoria termodinámica excelente. Estás pensando en la relación **$T \cdot \Delta S$**.

Esta combinación aparece principalmente por dos motivos fundamentales: para calcular el **calor** en procesos reversibles y para entender la **exergía** (la energía que realmente es útil).

### 1. La definición de Calor ($Q$)

En un proceso reversible, el calor transferido se define mediante la temperatura absoluta ($T$) y el cambio de entropía ($dS$):

$$dQ = T \cdot dS$$

Si integramos esto, tenemos que el calor total es:


$$Q = \int T \, dS$$

**¿Para qué sirve en tu aerotermia?**
En el diagrama de tu ciclo (específicamente en un diagrama **T-s**, Temperatura vs Entropía), el área encerrada bajo la curva representa el calor que estás moviendo. Multiplicar la temperatura por el cambio de entropía te da la cantidad de energía en forma de calor que has logrado "bombear" desde el aire de la calle hacia tus fancoils.

---

### 2. La Energía Libre de Gibbs ($G$)

Esta es quizás la ecuación más famosa que utiliza ese término:


$$G = H - T \cdot S$$

O, en su forma de cambio:


$$\Delta G = \Delta H - T \cdot \Delta S$$

* **$\Delta H$ (Entalpía):** Es la energía total que se mueve.
* **$T \cdot \Delta S$:** Es la energía "degradada" o "impuesto de la naturaleza". Representa la energía que se pierde inevitablemente debido al desorden (entropía).
* **$\Delta G$:** Es el trabajo útil que nos queda disponible.

En tu aerotermia, el término **$T \cdot \Delta S$** representa la energía que se gasta simplemente en "vencer" las leyes de la física para mover el calor de un sitio frío a uno caliente. Cuanto mayor sea este término, más electricidad tendrán que aportar tus placas para compensar esa ineficiencia.

---

### 3. El Trabajo Perdido (Teorema de Gouy-Stodola)

Hay una ecuación específica para calcular cuánto estás desperdiciando en tu sistema debido a las irreversibilidades (fricción en el compresor, turbulencias del gas, etc.):

$$W_{perdido} = T_{ambiente} \cdot \Delta S_{universo}$$

Esta ecuación te dice que por cada grado de entropía que generas, multiplicas esa pérdida por la temperatura exterior.

* **Dato curioso:** Esto explica por qué en **Polonia** (con una $T_{ambiente}$ muy baja) el sistema es tan sensible. Cualquier ineficiencia se paga cara porque la termodinámica es mucho más implacable cuando intentas "ordenar" energía en ambientes muy fríos.

### Resumen visual:

Si la **Entalpía ($H$)** es todo el dinero que tienes en la cartera, el término **$T \cdot S$** es la parte de ese dinero que la inflación (la entropía) hace que no puedas gastar en nada útil. Lo que te queda para comprar (calentar la casa) es lo que realmente importa.

¿Te suena haber visto estos diagramas de **Temperatura-Entropía (T-s)** en algún momento de tu reforma o cuando investigabas la Panasonic? Son los que tienen forma de "campana".


---

## Conclusions

Looking for similar **decision intelligence** tools?

Reach out throughput and outcomes, ~~not availability~~:


### Aerotermia PoC x RPi DHT22

What if...you would actually have data for your in home temp and humidity?

> yes, [your home](https://github.com/JAlcocerT/poc/blob/main/aerothermics/z-home-check.md)

oh, it seems we [did that](https://jalcocert.github.io/JAlcocerT/plants-102-and-iot/#current-setup-mqtt-dht22-pgsql) already :)

```sh
cd ./RPi/Z_MicroControllers/RPiPicoW/picow-dht-webapp
```

so...lets pull from pgsql

```sh
#docker ps | grep timescaledb
docker exec -it timescaledb psql -U pico -d sensors -c "SELECT topic, count(*) AS rows, min(ts) AS first_seen, max(ts) AS last_seen FROM readings GROUP BY topic ORDER BY count(*) DESC;"
```

With

```sh
docker exec -i timescaledb psql -U pico -d sensors -c "\COPY (SELECT time_bucket('1 hour', ts) AS timestamp, avg(value) FILTER (WHERE topic = 'pico/temperature/dht22') AS T_indoor_C, avg(value) FILTER (WHERE topic = 'pico/humidity/dht22') AS RH_indoor_pct, count(*) FILTER (WHERE topic = 'pico/temperature/dht22') AS samples FROM readings WHERE topic IN ('pico/temperature/dht22', 'pico/humidity/dht22') AND ts >= NOW() - INTERVAL '1 year' GROUP BY 1 HAVING count(*) FILTER (WHERE topic = 'pico/temperature/dht22') > 0 ORDER BY 1) TO STDOUT WITH (FORMAT CSV, HEADER true)" > dht22_hourly.csv

git commit -m "Add DHT22 hourly data"
git push
```

Diurnal pattern (clean as a textbook):

3-4 AM:   coolest, 22.08°C, RH peaks ~40%
5-9 AM:   warming kicks in, 22.6 → 23.5°C
13-14 PM: warmest, 24.10°C, RH lowest ~35%
17-22 PM: gentle cooldown to 22.5°C

There are [some next steps](https://github.com/JAlcocerT/poc/blob/main/aerothermics/z-next-steps.md) for the end of this year :)

Will this ever become a `energysolutions.jalcocertech.com`?

Someone told me a long time ago that I would end up doing sth around energy and engineering, so who knows :)