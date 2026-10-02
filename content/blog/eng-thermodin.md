---
title: "Thermodynamics"
date: 2026-05-09
draft: false
tags: ["Trip Planner v4 x Go-Solar x Aerotermia PoC","HeatraPy vs PyScipe"]
description: 'Carnot, heat transfer. Solar plan B.'
url: 'thermodynamics'
math: true
---
  
**Tl;DR**

[Lisa](https://www.youtube.com/watch?v=oygSFCZZyoU), in this house we obey the laws of thermodynamics!

**Intro**

* WHY Im writting this post: *bc energy analysis is everywhere, from [home utility bills](https://github.com/JAlcocerT/poc/blob/main/aerothermics/z-facturas/z-costs-summaries.md) to [SAHP simulations](https://jalcocert.github.io/JAlcocerT/how-to-check-hot-pump-viability/#the-experiment)*
* WHAT [Ive learnt](#conclusions) with it: *with a recap of [enthropy](#what-it-is-enthropy), [exergy](#what-it-is-exergy)*

Guess what happens when you take [trip planner v4](https://github.com/JAlcocerT/Py_Trip_Planner/tree/main/poc-trip-planner-v4), the `go solar` with the batteries and rainny days, with...

```sh
git clone /poc
cd poc/ #z-trip-planner-v4
```

What Happens is that you can validate the [PV + Aerothermic results of ppl in forums](https://forocoches.com/foro/showthread.php?t=9806597), aka SAHP solar assisted heat pump systems.

Or just create a way to check if aerothermics applies to you from such [dev plan](https://github.com/JAlcocerT/poc/blob/main/aerothermics/dev-plan.md):

![alt text](/blog_img/apps/aerotermia.png)

## Thermodynamics


A primera vista parece que la aerotermia es una máquina de "energía infinita" o un movimiento perpetuo al darte **4 kWh** de calor por cada **1 kWh** que pagas.

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

### 3. Eficiencia vs. COP

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

La **entropía** es la que dicta las reglas del juego, pero es la **entalpía** la que nos permite llevar la contabilidad de la energía que entra y sale de tu casa.

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

Estás pensando en la relación **$T \cdot \Delta S$**.

Esta combinación aparece principalmente por dos motivos fundamentales: *para calcular el **calor** en procesos reversibles y para entender la **exergía** (la energía que realmente es útil)*.

#### 1. La definición de Calor ($Q$)

En un proceso reversible, el calor transferido se define mediante la temperatura absoluta ($T$) y el cambio de entropía ($dS$):

$$dQ = T \cdot dS$$

Si integramos esto, tenemos que el calor total es:


$$Q = \int T \, dS$$

**¿Para qué sirve en tu aerotermia?**

En el diagrama de tu ciclo (específicamente en un diagrama **T-s**, Temperatura vs Entropía), el área encerrada bajo la curva representa el calor que estás moviendo. 

Multiplicar la temperatura por el cambio de entropía te da la cantidad de energía en forma de calor que has logrado "bombear" desde el aire de la calle hacia tus fancoils.

---

#### 2. La Energía Libre de Gibbs ($G$)

Esta es quizás la ecuación más famosa que utiliza ese término:


$$G = H - T \cdot S$$

O, en su forma de cambio:


$$\Delta G = \Delta H - T \cdot \Delta S$$

* **$\Delta H$ (Entalpía):** Es la energía total que se mueve.
* **$T \cdot \Delta S$:** Es la energía "degradada" o "impuesto de la naturaleza". Representa la energía que se pierde inevitablemente debido al desorden (entropía).
* **$\Delta G$:** Es el trabajo útil que nos queda disponible.

En tu aerotermia, el término **$T \cdot \Delta S$** representa la energía que se gasta simplemente en "vencer" las leyes de la física para mover el calor de un sitio frío a uno caliente.

Cuanto mayor sea este término, más electricidad tendrán que aportar tus placas para compensar esa ineficiencia.

---

#### 3. El Trabajo Perdido (Teorema de Gouy-Stodola)

Hay una ecuación específica para calcular cuánto estás desperdiciando en tu sistema debido a las irreversibilidades (fricción en el compresor, turbulencias del gas, etc.):

$$W_{perdido} = T_{ambiente} \cdot \Delta S_{universo}$$

Esta ecuación te dice que por cada grado de entropía que generas, multiplicas esa pérdida por la temperatura exterior.

* **Dato curioso:** Esto explica por qué en **Polonia** (con una $T_{ambiente}$ muy baja) el sistema es tan sensible. Cualquier ineficiencia se paga cara porque la termodinámica es mucho más implacable cuando intentas "ordenar" energía en ambientes muy fríos.

Resumen visual:

Si la **Entalpía ($H$)** es todo el dinero que tienes en la cartera, el término **$T \cdot S$** es la parte de ese dinero que la inflación (la entropía) hace que no puedas gastar en nada útil.

Lo que te queda para comprar (calentar la casa) es lo que realmente importa.

¿Te suena haber visto estos diagramas de **Temperatura-Entropía (T-s)** en algún momento de tu reforma o cuando investigabas la Panasonic? Son los que tienen forma de "campana".

---

## Conclusions

{{< callout type="info" >}}
Entropy describes energy degradation (the penalty of the Second Law of Thermodynamics).
{{< /callout >}}

{{< callout type="info" >}}
Exergy describes energy quality or work potential (how much useful value energy actually has).
{{< /callout >}}

I havent put together any *stirling engines*... yet

![alt text](/blog_img/mechanics/stirling_engine.gif)

But **experimenting with thermodynamics** have been great.

![alt text](/blog_img/mechanics/vapor_compression_fridge.gif)

Looking for similar **decision intelligence** tools?

Reach out for throughput and outcomes, ~~not availability~~:

{{< cards >}}
  {{< card link="https://consulting.jalcocertech.com" title="Consulting Services" image="/blog_img/entrepre/consulting.png" subtitle="Consulting - Tier of Service" >}}
  {{< card link="https://ebooks.jalcocertech.com" title="DIY via ebooks" image="/blog_img/entrepre/ebooks.png" subtitle="Distilled knowledge via web/ooks with free value." >}}
{{< /cards >}}

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

* 3-4 AM: coolest, 22.08°C, RH peaks ~40%
* 5-9 AM: warming kicks in, 22.6 → 23.5°C
* 13-14 PM: warmest, 24.10°C, RH lowest ~35%
* 17-22 PM: gentle cooldown to 22.5°C

There are [some next steps](https://github.com/JAlcocerT/poc/blob/main/aerothermics/z-next-steps.md) for the end of this year :)

Will this ever become a `energysolutions.jalcocertech.com`?

Someone told me a long time ago that I would end up doing sth around energy and engineering, so who knows :)

---

## FAQ

### What it is Enthropy

**The Carnot limit does not apply to a water turbine.**

A hydroelectric setup converts **mechanical potential energy** directly into **mechanical work**, whereas Carnot efficiency applies exclusively to **heat engines** that convert **thermal energy** (heat) into work.

1. Why Carnot Does Not Apply to Your Turbine

* **Hydroelectric generation is a mechanical process:** The water stored at $h = 20\text{ m}$ possesses gravitational potential energy ($E_p = mgh$). As it falls, this potential energy converts into kinetic energy ($\frac{1}{2}mv^2$), which pushes the turbine blades. No combustion, heating, or phase change takes place.
* **Theoretical efficiency is 100%:** Because mechanical energy can, in principle, be completely converted into other forms of mechanical or electrical work without thermodynamic dissipation, the theoretical limit is $100\%$. Real-world hydroelectric plants routinely achieve **85% to 95%** efficiency, limited only by friction, fluid turbulence, and generator resistance.


2. Why Does Carnot Efficiency Depend Only on Temperature?

The Carnot efficiency formula:

$$\eta_{\text{Carnot}} = 1 - \frac{T_C}{T_H}$$

governs heat engines (like steam turbines, car engines, or coal plants). It depends only on the absolute temperatures of the heat source ($T_H$) and sink ($T_C$) because of the nature of **entropy** and the **Second Law of Thermodynamics**.

**Heat is Disordered Energy**

* **Mechanical energy** (like falling water) is ordered motion: all water molecules move in the same coherent direction.
* **Thermal energy** is microscopic, chaotic, random motion of atoms and molecules.

**The "Entropy Tax"**

When heat flows out of a hot reservoir at $T_H$, the entropy removed is:

$$\Delta S_{\text{in}} = \frac{Q_H}{T_H}$$

By the Second Law of Thermodynamics, the total entropy of the universe cannot decrease. Even in a theoretically perfect, reversible engine, you cannot simply convert all of that heat $Q_H$ into work, because doing so would destroy the entropy $\Delta S_{\text{in}}$.

To reset the engine cycle and carry that entropy away, the engine **must dump some heat ($Q_C$)** into a cold reservoir at $T_C$:

$$\Delta S_{\text{out}} = \frac{Q_C}{T_C} \ge \frac{Q_H}{T_H}$$

For a reversible engine ($\Delta S_{\text{net}} = 0$):

$$\frac{Q_C}{T_C} = \frac{Q_H}{T_H} \implies Q_C = Q_H \left(\frac{T_C}{T_H}\right)$$

Since Work ($W$) is the difference between heat in and heat rejected ($W = Q_H - Q_C$):

$$\eta = \frac{W}{Q_H} = \frac{Q_H - Q_C}{Q_H} = 1 - \frac{T_C}{T_H}$$

Because entropy transfer scales directly with $\frac{Q}{T}$, the working substance (whether water, steam, helium, or air) does not matter. The fundamental limit is determined entirely by the temperatures between which the heat flows.

| Feature | Your Hydroelectric Pool ($20\text{ m}$) | Heat Engine (e.g., Steam Plant) |
| --- | --- | --- |
| **Energy Source** | Gravitational potential energy ($mgh$) | Thermal energy / Heat ($Q$) |
| **Microscopic State** | Ordered bulk motion | Disordered, random molecular motion |
| **Entropy Rejection Required?** | No | Yes (must dump waste heat) |
| **Governing Efficiency** | Fluid mechanics ($\sim 90\%$ practical limit) | Carnot limit ($\eta = 1 - T_C / T_H$) |

### What it is Exergy

Storing excess solar energy as heat in water is one of the most practical and cost-effective energy storage methods for a home. 

Instead of gravitational energy, you are tapping into the **specific heat capacity of water** ($c = 4{,}184\text{ J/(kg}\cdot\text{K)}$ or $\approx 1.163\text{ Wh/(kg}\cdot^\circ\text{C)}$).

Water absorbs an enormous amount of thermal energy per degree of temperature increase.

#### Petela-Landsberg radiation exergy

From a thermodynamic perspective, sunlight hitting your roof is exceptionally high-grade, low-entropy energy, while hot water—even near boiling—is low-grade, highly degraded energy.

1. The Thermodynamic Quality (Exergy Content)

The "quality" of radiation is determined by the temperature of its emitter. The photons striking your solar panel originated from the Sun’s photosphere at roughly **5,800 K (~5,500°C)**.

Using the **Petela-Landsberg radiation exergy equation**:

$$\psi \approx 1 - \frac{4}{3}\left(\frac{T_{ambient}}{T_{sun}}\right) + \frac{1}{3}\left(\frac{T_{ambient}}{T_{sun}}\right)^4$$

For an ambient temperature of $T_0 = 300\text{ K}$ (27°C) and $T_{sun} = 5{,}800\text{ K}$:

$$\psi \approx 1 - \frac{4}{3}\left(\frac{300}{5{,}800}\right) \approx \mathbf{93.1\%}$$

* **Sunlight has ~93% exergy content.** Out of every 100 Joules of raw solar photons hitting your panel, **93 Joules** represent theoretically extractable work.
* **90°C Water ($363\text{ K}$) has ~19% exergy content.** If ambient air is 20°C ($293\text{ K}$), Carnot limits dictate that at most **19 Joules** per 100 Joules can ever be converted back to work.

A photon from the Sun carries **almost 5 times more work quality** than the thermal energy inside hot water.

2. Why Photons Carry So Much Quality

* **Extremely High Energy per Particle:** Visible light photons have energies between **1.8 eV and 3.1 eV**. By comparison, the average thermal kinetic energy ($k_B T$) of a water molecule vibrating at 90°C is just **~0.03 eV**—nearly 100 times weaker.
* **Directed, Ordered Momentum:** Sunlight arrives in a coherent, directional beam of electromagnetic wave packets traveling at the speed of light.
* **Quantum Excitation Capability:** A single solar photon carries enough concentrated energy to kick an electron entirely out of a silicon atom's valence band across the bandgap into a conduction state, generating a clean electrical potential difference.

When you take that 93% exergy sunlight, convert it to 100% exergy electricity on your roof, and dump it into an electric water heater, you are carrying out an **extreme thermodynamic downgrade**:

$$\text{Pure Work (Electricity)} \xrightarrow{\text{Resistive Heating}} \text{Random Molecular Collisions (Heat)}$$

You lose zero energy (the First Law of Thermodynamics is satisfied), but you irreversibly destroy over **80% of the exergy** (the Second Law penalty), locking that energy into molecular vibrations that can never be fully reconstituted.

### Energy Density Calculation

In domestic systems, water is kept below boiling to avoid dangerous steam pressures—typically heating from cold tap water (**~20°C**) to hot storage (**~90°C**), giving a temperature differential of $\Delta T = 70^\circ\text{C}$.

$$\text{Energy per kg} = 1.163\text{ Wh/(kg}\cdot^\circ\text{C)} \times 70^\circ\text{C} \approx \mathbf{81.4\text{ Wh/kg (or Wh/L)}}$$

If pushed from **15°C up to near-boiling (95°C)** ($\Delta T = 80^\circ\text{C}$):

$$\text{Energy per liter} \approx \mathbf{93\text{ Wh/L}}$$

**Thermal water storage achieves roughly $80\text{ to }95\text{ Wh/L}$**—nearly identical to the volumetric density of a finished residential LFP battery pack (~$90\text{–}110\text{ Wh/L}$), and orders of magnitude higher than pumped hydro.

**10 kWh Comparison**: Pumped Hydro vs. LFP vs. Hot Water

| Metric | Pumped Hydro (20m drop) | LFP Battery Bank | Hot Water Tank ($\Delta T = 70^\circ\text{C}$) |
| --- | --- | --- | --- |
| **Medium Size / Mass** | **334,000 Liters** (334 tons) | ~100 kg | **~125 Liters** (125 kg) |
| **Reservoir / Unit Footprint** | Olympic diving pool scale | Mini-fridge size (~100 L) | Standard small domestic boiler (~125 L) |
| **Round-Trip / Conversion Cost** | Very high (pumps, generator) | Moderate ($150–$300/kWh) | **Extremely cheap** (immersion resistor) |
| **Output Form** | Electricity | Electricity | **Thermal (Heat)** |

To absorb 10 kWh of excess solar generation, you only need an ordinary **125-liter to 150-liter domestic hot water tank**.

**The Big Catch**: Electricity vs. Heat (The Exergy Problem)

While the numbers look incredible, the difference lies in **entropy and energy utility**:

1. **Converting Electricity to Heat is ~100% efficient:** An electric immersion heater or solar diverter (like a *Myenergi eddi* or similar solar power diverter) transfers almost 100% of excess solar electrons straight into hot water.

2. **Converting Heat BACK to Electricity is impractical at home:** You cannot realistically convert that 90°C water back into AC power to run your TV or lights. 

Thermal power generation (like a steam turbine or Stirling engine) operating across a tiny 90°C to 20°C drop has a **Carnot theoretical maximum efficiency** of only ~19%, and a real-world conversion efficiency under 5%.

### Gases

PV=nrT

And i could feel that while riding my bicycle during winter.


### What it is Boyles Law
https://en.wikipedia.org/wiki/Boyle%27s_law


### What it is VPD

Got to know [about VPD here](https://jalcocert.github.io/JAlcocerT/plants-102-and-iot/#from-t-and-h-to-vpd) while measuring how to make my living room a good home for tomatoes to grow.

### Heat Transfer
