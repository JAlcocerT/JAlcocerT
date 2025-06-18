---
title: "Buying a Car being in Data Analytics"
date: 2021-10-03T23:20:21+01:00
draft: false
tags: ["Outro"]
description: 'What to keep in mind, what NOT to do...When buying a second hand car. The data behind a Honda Civic 6.'
url: 'buying-car-data-analytics'
---

It was a **Honda Civic 6**, born on 1997 (1995-2000).

> NA / In Line 4 cilinders / 1.4L

<!-- 
![Honda Civic 6](/blog_img/outro/honda-road.jpg)
 -->

{{< cards >}}
  {{< card link="https://en.wikipedia.org/wiki/Honda_Civic_(sixth_generation)" title="Civic 6" image="/blog_img/outro/honda-road.jpg" subtitle="Features of the beast" >}}
{{< /cards >}}


{{< details title="Honda Civic EJ9 1996–2000 (EU) 📌" closed="true" >}}


D14A3 1.4 i (vs D14A4 1.4iS 90cv)

* **Cilindrada:** 1,396 cc (85.2 cu in)
* **Diámetro y carrera:** 75 mm (295 pulgadas) × 79 mm (311 pulgadas)
* **Compresión:** 9.1:1
* **Código ECU:** P3X
* **Potencia:** 75 CV (55 kilovatios) a 6,000 rpm
* **Torque/Par:** 109 Nm (11.1 kgm; 80 lb-ft) a 3,000 rpm
* **Tren de válvulas:** SOHC, cuatro válvulas por cilindro, sin VTEC
* **Línea roja:** 6,800 rpm
* **Corte de inyección:** 7,200 rpm
* **Control de combustible:** OBD2-A, DPFI (SFi – Simplified Fuel injection), Los inyectores abastecen por parejas (1+3 y 2+4)
* **Transmisión:** S40
* **Neumáticos:**
    * 175/65 R14
    * 175/70 R13
* **Torque máximo:** @ 108Nm
* **Depósito:** 45l
* **Maletero:** 225 a 600 litros
* **Peso:** 1030 a 1500kg

**Diferencias entre D14A3 y D14A4:**

* Los motores D14A3 y D14A4 son idénticos, la única diferencia es una pequeña junta bajo el acelerador en el D14A3 que restringe la toma de aire del motor (esto ocurre solo en algunos países europeos).
* También varía la relación de compresión y algunos componentes montados son diferentes.
```

{{< /details >}}



## Car Costs Analytics

So far, this is the **split of the costs**:


![Car Init](/blog_img/data-experiments/Car_initial.JPG)

When sold, the car expenses looked like:

```mermaid
pie title Car Expenses Breakdown
         "Gas" : 537
         "Maintenance" : 831
         "Insurance" : 865
         "Car's Price" : 2180
```

> Making **0,5$ per km**


<!--
 ![Car End](/blog_img/data-experiments/Car_after.JPG) 
 -->

**New Car vs Used Car** How about a Mondeo mk3?

```mermaid
pie title Car Expenses Breakdown
         "Gas" : 10000
         "Maintenance" : 4000
         "Insurance" : 9000
         "Car's Price" : 20000
```

> Making **~0,25$ per km**


**Renting?**

It of course depends, I have observed them to be from 0,38$/km to...1.54$/km.

> On average, when renting **~0,68$/km**.

Remember that not everywhere you can rent without a credit card.

For me, it worked with sixt, budget and avis.


## The costs of a Car

As mentioned, from my experience, this is the **cost split that I got:**

{{< chart 100 200 >}}
{
  "type": "bar",
  "data": {
    "labels": ["Category A", "Category B", "Category C", "Category D", "Category E"],
    "datasets": [{
      "label": "Sales Figures",
      "data": [45, 62, 38, 75, 51],
      "backgroundColor": [
        "rgba(255, 99, 132, 0.8)",
        "rgba(54, 162, 235, 0.8)",
        "rgba(255, 206, 86, 0.8)",
        "rgba(75, 192, 192, 0.8)",
        "rgba(153, 102, 255, 0.8)"
      ],
      "borderColor": [
        "rgba(255, 99, 132, 1)",
        "rgba(54, 162, 235, 1)",
        "rgba(255, 206, 86, 1)",
        "rgba(75, 192, 192, 1)",
        "rgba(153, 102, 255, 1)"
      ],
      "borderWidth": 1
    }]
  },
  "options": {
    "scales": {
      "y": {
        "beginAtZero": true
      }
    },
    "plugins": {
      "title": {
        "display": true,
        "text": "Sample Bar Chart"
      },
      "legend": {
        "display": true
      }
    }
  }
}
{{< /chart >}}




---

## How to buy a Car...

I mean an **used car**.

### What to Look when buying a second hand car

1. No water in the space where there should be oil (and biceversa)
2. Tires Equally used across the contact patch

I kind of had a file with these...

![alt text](/blog_img/data-experiments/coches.png)

<!-- 
https://www.youtube.com/watch?v=UINEmTO0LCY
 -->

{{< youtube "UINEmTO0LCY" >}}

Having a look to the spark plugs after changing them can tell you a lot of the engine status:

![Honda Civic 6 Spark Plugs](/blog_img/outro/hondacivic-sparkplugs.jpg)

## Conclusions

This project started as a test to see the costs of owning a car.

And in the meantime I saw an interesting post: https://forocoches.com/foro/showthread.php?t=9203326&highlight=

> Some people are doing cool adventures with old card *Salgo para Dakar para intentar vender un Mercedes viejo. Haremos seguimiento*

---

## FAQ

https://www.spritmonitor.de/de/suche.html




### In Germany

Steps for **buying a car in Germany**.

* [Importar coche de alemania a nivel particular](https://forocoches.com/foro/showthread.php?t=7264922).

* Find one:
  * [Mobile.de](https://suchen.mobile.de/fahrzeuge/search.html?cn=DE&isSearchRequest=true&ms=9000%3B%3B39%3B&od=up&pageNumber=4&ref=srpNextPage&refId=f5035f63-2646-3531-69d5-c28f462839dd&s=Car&sb=p&vc=Car)

* https://forocoches.com/foro/showthread.php?t=6139690&highlight=alemania


### In Netherlands

* [IMPORTACION Vehículos HOLANDA](https://forocoches.com/foro//showthread.php?p=439130711)

* [MarktPlaats](https://www.marktplaats.nl/l/auto-s/#q:vito)
* [IMPORTACION Vehículos HOLANDA](https://forocoches.com/foro/showthread.php?t=4950996)
* https://forocoches.com/foro/showthread.php?t=3791337
* https://forocoches.com/foro/showthread.php?t=1098678

> https://www.hypotheekrente.nl/

### In Spain

* https://www.historialvehiculo.com/
* https://www.carfax.eu/es
  * [Example](https://www.carfax.eu/es/vhr?reportId=11bd37fd-859c-45f4-9d7b-e30a53704bf1)

* [DGT Info about a car](https://sede.dgt.gob.es/es/vehiculos/informacion-de-vehiculos/informe-de-un-vehiculo/#:~:text=Para%20obtener%20el%20informe%20de,directamente%20desde%20la%20propia%20app.)

* furgoneta
    * https://forocoches.com/foro/showthread.php?t=7244645 - Quiero Vivir en una Furgoneta +Proyecto+Consejos
    * https://forocoches.com/foro/showthread.php?t=6536967&highlight=vivo+autocaravana - Vivo en una autocaravana y respondo preguntas +HD


{{< details title="Tricks | Car in Spain 📌" closed="true" >}}

Comprar un vehículo de segunda mano en España implica una serie de pasos y consideraciones importantes para garantizar una transacción segura y sin contratiempos. Aquí te presento una guía detallada:

**1. Verificación del estado del vehículo:**

* **Inspección mecánica:**
    * Es fundamental revisar el estado general del vehículo, incluyendo motor, frenos, neumáticos, luces y otros componentes.
    * Considera llevar el coche a un taller de confianza para una revisión profesional.
* **Historial del vehículo:**
    * Solicita un informe de historial en la Dirección General de Tráfico (DGT) para verificar la titularidad, historial de inspecciones técnicas (ITV), posibles cargas o embargos, y otros datos relevantes.
    * También puedes obtener informes de empresas especializadas que ofrecen datos adicionales sobre el vehículo.

**2. Documentación necesaria:**

* **Contrato de compraventa:**
    * Elabora un contrato de compraventa que incluya los datos del comprador y vendedor, la descripción del vehículo (marca, modelo, matrícula), el precio de venta, la fecha y hora de la transacción, y las condiciones de la venta.
* **Permiso de circulación y ficha técnica:**
    * Asegúrate de que el vendedor te entregue el permiso de circulación y la ficha técnica del vehículo.
* **Justificante del pago del Impuesto sobre Vehículos de Tracción Mecánica (IVTM):**
    * Verifica que el vendedor esté al corriente de pago de este impuesto.

**3. Trámites administrativos:**

* **Cambio de titularidad:**
    * Debes realizar el cambio de titularidad del vehículo en la DGT en un plazo de 30 días desde la firma del contrato de compraventa.
    * Puedes realizar este trámite de forma presencial en las oficinas de la DGT o de forma telemática a través de su sede electrónica.
* **Pago del Impuesto de Transmisiones Patrimoniales (ITP):**
    * Este impuesto se paga en la comunidad autónoma donde resides y varía según la comunidad.
    * El importe se calcula aplicando un porcentaje sobre el valor del vehículo según tablas oficiales.

**4. Impuestos:**

* **Impuesto de Transmisiones Patrimoniales (ITP):**
    * Este es el principal impuesto a pagar al comprar un vehículo de segunda mano.
    * El porcentaje varía según la comunidad autónoma, generalmente entre el 4% y el 8% del valor del vehículo.
* **Impuesto sobre Vehículos de Tracción Mecánica (IVTM):**
    * Este impuesto, también conocido como impuesto de circulación, se paga anualmente al ayuntamiento donde resides.
    * El importe varía según la potencia fiscal del vehículo y el municipio.

**Recomendaciones adicionales:**

* Asegúrate de que el vendedor esté al corriente de pago de multas y sanciones.
* Verifica que el vehículo tenga la ITV en vigor.
* Considera contratar un seguro de automóvil antes de utilizar el vehículo.
* Comprueba que el vehiculo esta libre de cargas, embargos o precintos.


{{< /details >}}

### In Poland

* https://www.otomoto.pl/osobowe/oferta

https://www.autocentrum.pl/fiat/ducato/ii/silnik-diesla-2.8-td-122km-1998-2003/

https://en.wikipedia.org/wiki/Fiat_Ducato

### How about Campers?

* [Camper Contact](https://www.campercontact.com/en/search?name=Amsterdam&lat=52.37403&lon=4.88969&zoom=12.5&names=AMS,Aemstelredamme,Aemsterdam,Amestelledamme,Amesterda,Amesterdam,Amesterdao,Amesterd%C3%A3,Amesterd%C3%A3o,Amistardam)

* [Park4Night](https://park4night.com/en/search?lat=52.372756486328726&lng=4.893615245819092&z=15)

* [Trick1](https://www.kartamultisport.pl/en/multisport/search-for-facilities/#/@51.8283438,19.7351276,10z?cards=1&categories=3)