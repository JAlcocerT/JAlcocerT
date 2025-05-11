---
title: "AI with Vision - Image2Text"
date: 2025-04-09T00:20:21+01:00
draft: false
#tags: ["Gen-AI","Self-Hosting","Docker"]
description: 'LLaVa, OpenAI Vision Models compared with T2I. Ask questions about images or design your perfect room with roomGPT.'
url: 'ai-vision-models'
---


<!-- * {{< newtab url="https://.github.io//" text="The  Official Site" >}}
* {{< newtab url="https://github.com//" text="The  Source Code at Github" >}}
    * License: {{< newtab url="https://github.com//?tab=AGPL-3.0-1-ov-file#readme" text="aGPL 3.0" >}} ❤️ -->



## Vision with AI

{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Streamlit-MultiChat/tree/main/Z_Tests/OpenAI/Image" title="OpenAI Vision Script ↗ " >}}
  {{< card link="https://fossengineer.com/selfhosting-llms-ollama/" title="Ollama Container Setup 101 ↗" >}}
{{< /cards >}}

### OpenAI

You can use the **OpenAI API** to feed one image and ask questions about it.


[![Open in Google Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/JAlcocerT/Streamlit-MultiChat/blob/main/Z_Tests/OpenAI/Image/z_openai-t2i-vision.ipynb)

<!-- 
https://github.com/JAlcocerT/Streamlit-MultiChat/blob/main/Z_Tests/OpenAI/Image/z_openai-t2i-vision.ipynb -->

> This is Image to Text!

This functionality is primarily offered through the **GPT-4 Turbo with Vision** model (also referred to as `gpt-4-vision-preview` or `gpt-4o`).

Here's a breakdown of how you can do this and important considerations:

**How it Works:**

* **Multimodal Input:** The GPT-4 Turbo with Vision model is a large multimodal model (LMM) that can process both text and image inputs. This allows you to include an image directly in your API request alongside your question.
* **Image Formats and Size:** The API supports various image formats such as PNG, JPEG (.jpeg and .jpg), and WEBP. Non-animated GIFs are also supported. There's a size limit of **up to 20MB per image**.
* **Input Methods:** You can provide the image to the API in two ways:
    * **URL:** You can provide a publicly accessible URL of the image. The OpenAI servers will then fetch the image from that URL.
    * **Base64 Encoding:** You can encode the image data as a Base64 string and include it directly in the API request. This is useful for local images that are not hosted online.
* **Detail Level:** When using the API, you can specify the level of detail the model should use when processing the image. The `detail` parameter can be set to `low`, `high`, or `auto` (letting the model decide). Lower detail is faster and cheaper for tasks that don't require fine-grained understanding, while high detail is necessary for analyzing intricate details.
* **Cost:** The cost of analyzing an image depends on the input image size and the level of detail you specify. Images are processed in 512x512 pixel tiles, and the token cost is calculated based on the number of tiles and the detail level.

**Example API Request Structure (Conceptual):**

While the exact code will depend on the programming language and OpenAI library you are using, the basic structure of the message content in your API request will look something like this:

```json
{
  "model": "gpt-4-vision-preview",
  "messages": [
    {
      "role": "user",
      "content": [
        {
          "type": "text",
          "text": "What objects are present in this image?"
        },
        {
          "type": "image_url",
          "image_url": {
            "url": "https://example.com/your_image.jpg"
          }
        }
      ]
    }
  ],
  "max_tokens": 300
}
```

Or, if you're using Base64 encoding:

```json
{
  "model": "gpt-4-vision-preview",
  "messages": [
    {
      "role": "user",
      "content": [
        {
          "type": "text",
          "text": "Describe the main elements in this picture."
        },
        {
          "type": "image_url",
          "image_url": {
            "url": "data:image/jpeg;base64,/9j/4AAQSkZJRgABA..."
          }
        }
      ]
    }
  ],
  "max_tokens": 300
}
```

**Key Considerations:**

* **Model Selection:** Ensure you are using a model with vision capabilities, such as `gpt-4-vision-preview` or `gpt-4o`. Standard language models like `gpt-3.5-turbo` cannot process images directly.
* **API Key:** You will need an active OpenAI API key to make requests.
* **Libraries and SDKs:** OpenAI provides official and community-maintained client libraries in various programming languages (like Python) that simplify the process of making API calls.
* **Error Handling:** Implement proper error handling in your code to manage potential issues like invalid image URLs, incorrect image formats, or API errors.
* **Rate Limits:** Be aware of the API rate limits to avoid being temporarily blocked.
* **Content Moderation:** OpenAI's content policy applies to both text prompts and images. Inappropriate content may be flagged and result in errors.
* **Assistant API:** While you can't directly upload images to the Assistants API in the same way as the Chat Completions API, a workaround involves uploading the image to the API file storage with the purpose "vision" and then including the file ID in a user message within a thread. The Assistant can then access and process the image.


```py
import base64
import requests
import os

def encode_image_to_base64(image_path):
    with open(image_path, "rb") as image_file:
        encoded_string = base64.b64encode(image_file.read()).decode('utf-8')
        return encoded_string

def query_openai_with_local_image(image_path, question):
    base64_image = encode_image_to_base64(image_path)

    headers = {
        "Content-Type": "application/json",
        "Authorization": f"Bearer YOUR_OPENAI_API_KEY"
    }

    payload = {
        "model": "gpt-4-vision-preview",
        "messages": [
            {
                "role": "user",
                "content": [
                    {"type": "text", "text": question},
                    {
                        "type": "image_url",
                        "image_url": {
                            "url": f"data:image/jpeg;base64,{base64_image}"
                            # Adjust MIME type if necessary
                        }
                    }
                ]
            }
        ],
        "max_tokens": 300
    }

    response = requests.post("https://api.openai.com/v1/chat/completions", headers=headers, json=payload)
    return response.json()

if __name__ == "__main__":
    local_image_path = "path/to/your/local/image.jpg"  # Replace with the actual path
    user_question = "What is the main subject of this image?"

    if os.path.exists(local_image_path):
        openai_response = query_openai_with_local_image(local_image_path, user_question)
        print(openai_response)
    else:
        print(f"Error: Image not found at {local_image_path}")
```


#### Understanding OpenAI Vision 

**OpenAI Vision** API Crash Course - Chat with Images (Node)

<!-- https://www.youtube.com/watch?v=ZjkS11DSeEk -->

{{< youtube "ZjkS11DSeEk" >}}

**LLaVa** on a Pi:

<!-- https://www.youtube.com/watch?v=Y2ldwg8xsgE -->

{{< youtube "Y2ldwg8xsgE" >}}




### LLaVa

<!-- 
<https://www.youtube.com/watch?v=2Tv5ZfPabGM> -->

If you are familiar with local LLMs powered by Ollama...

{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/Docker/tree/main/AI_Gen/Ollama" title="SelfHosting Ollama Docker Config! 🐋 ↗" >}}
{{< /cards >}}


* https://github.com/haotian-liu/LLaVA
  * https://github.com/haotian-liu/LLaVA?tab=Apache-2.0-1-ov-file#readme ✅
  * https://huggingface.co/liuhaotian/llava-v1.5-7b
  * https://llava-vl.github.io/

```sh 
ollama run llava #https://ollama.com/library/llava
```

<!-- https://www.youtube.com/watch?v=4Jpltb9crPM -->

{{< youtube "4Jpltb9crPM" >}}

> Image Recognition with LLaVa in Python


---


## Conclusion

Now we have 2 ways (local and API based) to get to know context about images!

* https://platform.openai.com/docs/guides/images?api-mode=responses
* https://ollama.com/search?c=vision


This can also be helpful for the real estate project, where you can ask context about particular property scrapped images:

```sh
python3 scraping-ask-v2.py > comments_property_alijares.mdx
```

![alt text](/blog_img/GenAI/image/openai-vision-realestate.png)



{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Streamlit-MultiChat/tree/main/Z_Tests/OpenAI/Image" title="OpenAI Vision Script ↗ " >}}
  {{< card link="https://github.com/JAlcocerT/Streamlit-MultiChat/blob/main/Z_Tests/OpenAI/Image/scraping-ask-v2.py" title="real Estate Scrap + ScriptVision ↗" >}}
{{< /cards >}}

### RoomGPT for Real Estate

Whats great?

Given a photo of a room and a prompt...you can re-imagine how everything could potentially look like:

* https://github.com/Nutlope/roomGPT

> MIT | Upload a photo of your room to generate your dream room with AI.

### Text to Image

If what you want is the opposite...

Given a text description of an image, generate the image itself:



See als: https://promptfolder.com/midjourney-prompt-helper/



---

## FAQ

### How to apply CV (computer vision) with Python

{{< dropdown title="Computer Vision with PyTorch ⏬" closed="true" >}}

* https://jalcocert.github.io/JAlcocerT/raspberry-pi-camera-setup/#python-libraries-for-cv

{{< /dropdown >}}

{{< dropdown title="Computer Vision with Yolov8 Models ⏬" closed="true" >}}

* https://github.com/ibaiGorordo/ONNX-YOLOv8-Object-Detection

{{< /dropdown >}}



### Outro


{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/rpi-mjpg-streamer" title="RPi Streamer" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/dji-tello-python-programming/" title="DJI Drone + Camera with Py" >}}
{{< /cards >}}

<!-- https://www.youtube.com/watch?v=Y2ldwg8xsgE -->

Pixtral (Open source vision model)

<!-- https://www.youtube.com/watch?v=7aGTKJJMb5w -->

{{< youtube "7aGTKJJMb5w" >}}


* {{< newtab url="https://github.com/haotian-liu/LLaVA" text="The  Official Site" >}}
* {{< newtab url="https://llava-vl.github.io/" text="The  Source Code at Github" >}}
    * License: {{< newtab url="https://github.com/haotian-liu/LLaVA?tab=Apache-2.0-1-ov-file#readme" text="Apache v2.0" >}} ❤️


* https://huggingface.co/liuhaotian/llava-v1.5-7b

```sh 
ollama run llava #https://ollama.com/library/llava
```

* https://www.youtube.com/watch?v=4Jpltb9crPM
* https://www.youtube.com/watch?v=2Tv5ZfPabGM

> Image Recognition with **LLaVa in Python**