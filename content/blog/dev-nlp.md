---
title: "Interesting NLP Tools: PII, Sentiment Analysis..."
date: 2024-08-03T23:20:21+01:00
draft: false
tags: ["Dev"]
description: 'How to use SpaCy with Python as NER. Compared with LLMs and Detoxify.'
url: 'nlp-tools'
---

The first time I got the chance to **use a Natural Language Processing model** was with [**detoxify**](https://pypi.org/project/detoxify/), which classifies comments with PyTorch and Transformers.

Kind of **sentiment analysis tool**.

But there are other **interesting tools**.

Btw, this is how they fit in the AI Landscape: 

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/machine-learning-data-analytics/" title="ML 101" icon="book-open" >}}
{{< /cards >}}

## Name Entity Recognition

A **NER (Named Entity Recognition)** system is like a smart highlighter that goes through this sentence and picks out the important "things" or "entities" and tells you what category they belong to.

> Imagine you have a sentence like:

**"Elon Musk visited Berlin on Monday to meet with Tesla executives."**

In our example, the NER system would highlight:

* **Elon Musk** and say "This is a **PERSON**"
* **Berlin** and say "This is a **GPE**" (which stands for Geopolitical Entity, like a city or country)
* **Monday** and say "This is a **DATE**"
* **Tesla** and say "This is an **ORG**" (which stands for Organization)

**So, in simple terms, NER is a way for computers to:**

1.  **Identify** specific words or phrases in text.
2.  **Categorize** those words or phrases into predefined groups like people, places, dates, organizations, etc.

Think of it as teaching a computer to understand the key players, locations, and times mentioned in a piece of writing. This is really useful for things like:

* **News analysis:** Quickly finding out who did what, where, and when.
* **Customer service:** Understanding what products or issues a customer is talking about.
* **Information extraction:** Automatically pulling out important details from documents.

> Basically, NER helps computers make sense of text by recognizing the "who, what, when, and where" of it.

### SpaCy

Soacy can be used to detect **PII information**!

* https://pypi.org/project/spacy/

You need to download the model first:

```sh
python -m spacy download en_core_web_sm
```

Example to use **SPacy for PII**:

```py
import spacy

# Load the spaCy model for English
nlp = spacy.load("en_core_web_sm")

# Define a list of strings to check
strings_to_check = [
    "John Doe",          # Person
    "john.doe@example.com",  # Email
    "123-45-6789",       # Social Security Number
    "Google",            # Organization
    "123 Main St.",      # Address
    "555-1234",          # Phone number
    "April 5, 1990",     # Date
    "Jane Smith",        # Another person
    "Credit card 4111 1111 1111 1111", # Credit card
    "Non-PII string"     # Random string
]

# Define PII entity labels that spaCy can recognize
PII_labels = ["PERSON", "ORG", "GPE", "DATE", "CARDINAL", "LOC", "MONEY"]

def check_pii(text):
    doc = nlp(text)
    entities = [(ent.text, ent.label_) for ent in doc.ents if ent.label_ in PII_labels]
    return entities if entities else "No PII found"

# Check each string in the list for PII
for string in strings_to_check:
    result = check_pii(string)
    print(f"String: '{string}' -> PII Detected: {result}")
```

--

## Conclusions

Nowadays you can also **use LLMs** for this kind of **PII detection tasks**.

But...it is always great to keep handy this kind of more traditional NLP tools.

You can also have a look to **Sketch**, as it can make data cataloguing, like PII identification.

* https://pypi.org/project/sketch/
* https://github.com/approximatelabs/sketch

> MIT | AI code-writing assistant that understands data content. Sketch is usable in seconds and doesn't require adding a plugin to your IDE.


---

## FAQ

### Interesting Offline Tools - Translations

* https://github.com/LibreTranslate/LibreTranslate

> agpl 3.0 | Free and Open Source Machine Translation API. Self-hosted, offline capable and easy to setup. 

### What about n-Grams?

In Natural Language Processing (NLP), an **n-gram** is a contiguous sequence of *n* items from a given sample of text or speech.

The items can be characters, words, or even syllables.

{{% details title="A breakdown of what n-grams are? 🚀" closed="true" %}}

* **"n" represents the number of items:**
    * A 1-gram (or unigram) is a single item.
    * A 2-gram (or bigram) is a sequence of two items.
    * A 3-gram (or trigram) is a sequence of three items.
    * And so on...

* **Items can be:**
    * **Words:** "The cat sat" would have the following word-based bigrams: "The cat", "cat sat".
    * **Characters:** "hello" would have the following character-based trigrams: "hel", "ell", "llo".

* **Purpose:**
    * N-grams are used for various NLP tasks, including:
        * **Language modeling:** Predicting the next word in a sequence.
        * **Text classification:** Categorizing text into different topics.
        * **Spell checking:** Identifying and correcting spelling errors.
        * **Machine translation:** Translating text from one language to another.
        * **Sentiment analysis:** Determining the emotional tone of text.
        * **Information retrieval:** Searching for relevant documents.

* **How they work:**
    * N-grams capture the statistical properties of a text.
    * By analyzing the frequency of n-grams, models can learn patterns and relationships between words or characters.
    * For example, in language modeling, a model might learn that the bigram "New York" occurs frequently, and therefore, when it sees "New", it's likely to predict "York".


{{% /details %}}

> In essence, n-grams provide a simple yet powerful way to analyze and understand the structure of language.