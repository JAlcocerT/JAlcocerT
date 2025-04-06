---
title: "Buying a bicycle through DA glasses"
date: 2025-02-15T23:20:21+01:00
draft: false
tags: ["Outro"]
description: 'What Ive learnt after buying few bicycles.'
url: 'buying-bicycle-through-data-analytics'
---

## Bike Costs Analytics


### Second Hand MTB

<!-- https://cyclingthere.com/_astro/PXL_20241008_144149173.Cj1pqXWc_1oH9Mo.webp -->

1. **DiamonDBack Sync 2.0** - 27.5" and 3x8 Speeds

{{< cards >}}
  {{< card link="https://www.diamondback.com/" title="Diamond Bike" image="https://cyclingthere.com/_astro/PXL_20241008_144149173.Cj1pqXWc_1oH9Mo.webp" subtitle="Stories with this MTB" >}}
{{< /cards >}}


```mermaid
pie title DB MTB Expenses
         "Addons" : 500
         "Maintenance" : 1080
         "Insurance" : 865
         "Price" : 1100
```

With this one I made ~7300km in 3 years (3000, 3300, 1000).

> That makes ~0.08$ per km, from which 0,06$ per km where *operating costs*

Discounting the sale price (1000 PLN), drops to 0,05$ per km.


<iframe src="https://www.komoot.com/es-es/tour/1237537825/embed?share_token=apX7DITeUFj6jtaqdn10djPBxES2hIHhpN5nM7uUpE7xlbNmuw&profile=1" width="100%" height="700" frameborder="0" scrolling="no"></iframe>


<!-- 

https://youtu.be/cqs4MkJ_4M4
 -->

{{< youtube "cqs4MkJ_4M4" >}}

{{< callout type="info" >}}
I recorded this one with the [Oa5Pro](https://jalcocert.github.io/JAlcocerT/dji-oa5pro-firmware-updates/)
{{< /callout >}}

### Almost new MTB

2. **BH** SPIKE 29" DEORE 10V XCM REMOTE

{{< cards >}}
  {{< card link="https://www.diamondback.com/" title="Diamond Bike" image="https://cyclingthere.com/_astro/PXL_20241008_144149173.Cj1pqXWc_1oH9Mo.webp" subtitle="Stories with this MTB" >}}
{{< /cards >}}


{{< youtube "Ke-8yhgC_uU" >}}



### Vintage City Bike

3. **KTM** Libero 28" 5V


{{< cards >}}
  {{< card link="https://www.diamondback.com/" title="KTM Libero" image="https://cyclingthere.com/_astro/PXL_20241008_144149173.Cj1pqXWc_1oH9Mo.webp" subtitle="A cool bicycle from the 80s" >}}
{{< /cards >}}


```mermaid
pie title DB MTB Expenses
         "Addons" : 500
         "Maintenance" : 1080
         "Insurance" : 865
         "Price" : 200
```

### Value for Money City Bike

4. A second hand bike that came from germany:


```mermaid
pie title City Bike Expenses
         "Addons" : 1
         "Maintenance" : 1
         "Price" : 300
```
<!-- 
{{< cards >}}
  {{< card link="https://www.diamondback.com/" title="KTM Libero" image="https://cyclingthere.com/_astro/PXL_20241008_144149173.Cj1pqXWc_1oH9Mo.webp" subtitle="A story - 600 km in 4 days" >}}
{{< /cards >}}

 -->

---


## Outro

**With add-ons**:

* Shimano SH-M089L ~75$
* SHIMANO SPD PD-EH500 (Hibryd pedals) ~60$




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
