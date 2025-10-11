---
title: "A closer look to DataBricks"
date: 2024-06-10
draft: false
tags: ["D&A", "Career", "D&A","Python vs PySpark"]
description: 'Using Databricks Community Edition for D&A Big Data.'
url: 'understanding-databricks'
---

**Intro**

You will hear a lot about databricks nowadays.

Its one datalakehouse platform, where you can run [Spark](https://jalcocert.github.io/JAlcocerT/guide-python-PySpark/) to do big data processing.

{{< callout type="warning" >}}
Signup into: https://community.cloud.databricks.com/login.html
{{< /callout >}}


{{< cards cols="1" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/sql-data-analytics/" title="SQL for D&A ↗ " >}}
  {{< card link="https://github.com/JAlcocerT/Data-Chat/tree/main/LangChain/ChatWithDB" title="Chat with DB ↗" >}}
{{< /cards >}}



![Register on DataBricks](/blog_img/DA/DataBricks-Registr.png)


{{< details title="Recap your python / Pyspark 📌" closed="true" >}}


```py
from tabulate import tabulate

# Data as a list of lists
data = [
    ["Alice", 24, "Engineer"],
    ["Bob", 30, "Data Scientist"],
    ["Charlie", 27, "Designer"]
]

# Headers for the columns
headers = ["Name", "Age", "Occupation"]

# Print a simple table
print(tabulate(data, headers=headers))

# Print a table with a different format (e.g., Markdown)
print("\n--- Markdown Table ---")
print(tabulate(data, headers=headers, tablefmt="pipe"))
```

{{< /details >}}


> The library also offers many options for customizing alignment, number formatting, and handling missing values, making it a flexible and powerful tool for data presentation.

---


## FAQ

### PySpark Recap

Interesting queries to get started with PySpark:

```py
### CREATES A SPARK DATAFRAME

df=spark.createDataFrame(
        data = [ ("1","2019-06-24 12:01:19.000")],
        schema=["id","input_timestamp"])

df.show(5, truncate=False)

#.withColumn("ts", f.expr("to_timestamp(CAST(ts / 1000 AS INT))"))
```


```py
#join and filter the result
qoe.join(nmd,
                 qoe.id == nmd.mac,
                 'left')\
                 .select('id','mac')\
                 .filter(col("mac").isNull())
```


```py
from pyspark.sql.functions import count

cm_stats_renamed.filter(cm_stats_renamed.ModelName == "CH7465LG")\
    .groupBy("ModelName", "MTA_LineStatus")\
    .agg(count("SerialNumber").alias("SerialNumberCount"))\
.orderBy("SerialNumberCount", ascending=False)\
.limit(30).toPandas().style.hide_index()
#.show(30, truncate=False)
```

```py
nr.filter(nr.locationId == "something")\
.withColumn("year_month_day", date_format(nr["createdAt"], "yyyy-MM-dd"))\
.groupBy("year_month_day")\
    .agg(count("nodeId").alias("Node_Distctinct_Counts"))\
.orderBy("Node_Distctinct_Counts", ascending=False)\
.limit(30).toPandas().style.hide_index()
```

```py
from pyspark.sql import SparkSession
from pyspark.sql.functions import col, when, split


def process_cable_modem_data(country_code):
# Initialize Spark session
spark = SparkSession.builder.appName("CableModemDataProcessing").getOrCreate()


# Load the DataFrame based on the country code
path = f"hdfs://123.45.67.89:9820/delta/refined_tables/{country_code}/dimensions/your_dimension_table/"
your_dimension_table_df = spark.read.format("delta").load(path)

# Add the node_id_prefix column
your_dimension_table_df = dim_cable_modem_df.withColumn('node_id_prefix', split(dim_cable_modem_df['node_id'], '\.')[0])

# Compare node_id_prefix and site_Id, and create a new column 'is_same'
your_dimension_table_df = dim_cable_modem_df.withColumn('is_same', when(col('node_id_prefix') == col('site_Id'), True).otherwise(False))

# Filter the DataFrame to keep only the rows where 'is_same' is False
filtered_df = dim_cable_modem_df.filter(col('is_same') == False)

# Show the result
filtered_df.select('node_id', 'node_id_prefix', 'site_Id', 'is_same').distinct().show(5, truncate=False)

# Example usage
process_cable_modem_data("CH")
```