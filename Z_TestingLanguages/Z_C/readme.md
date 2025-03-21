## C


```sh
sudo apt update
sudo apt install build-essential

#gcc --version

```

Compile and run:

```sh
gcc -o hello hello.c #compile
./hello

```

### C + WASM



* PELADO: <https://www.youtube.com/watch?v=bgWTf3m6HG0> RUNTIME + Interface

```sh
git clone https://github.com/emscripten-core/emsdk.git
cd emsdk
./emsdk install latest

./emsdk activate latest
source ./emsdk_env.sh
```


This compiles the C to ---> html, js, wasm
```sh
#emcc helloworld.c -o helloworld.html
emcc -o hello.html hello.c
```

See what was created:

```sh
python3 -m http.server 8080 #choose any port
```

The WebAssembly (Wasm) file generated by Emscripten is a **binary format** file that contains compiled code in a low-level, portable format. It is designed to be executed by web browsers and other Wasm runtimes.

When you compile C/C++ code using Emscripten, the resulting output includes a Wasm file (.wasm), along with accompanying JavaScript files and HTML files. The Wasm file contains the compiled machine code that corresponds to your original C/C++ code.

### Runtimes

Several runtimes are popular for executing WebAssembly (Wasm) code across different platforms and environments. Some of the most notable ones include:

1. **Web Browsers**:
   - **Google Chrome**: Chrome has strong support for WebAssembly and was one of the first browsers to implement it.
   - **Mozilla Firefox**: Firefox also has excellent support for WebAssembly and continues to improve its performance and capabilities.
   - **Microsoft Edge**: Edge supports WebAssembly and is integrated with the Chakra JavaScript engine to execute Wasm code efficiently.

2. **Node.js**:
   - **Node.js**: Node.js has experimental support for running WebAssembly modules using the `--experimental-wasm-modules` flag. As support matures, running Wasm code in Node.js could become more common for server-side applications.

3. **WebAssembly Runtimes**:
   - **Wasmtime**: Developed by the Bytecode Alliance, Wasmtime is a standalone WebAssembly runtime that can be embedded into applications. It provides a lightweight and efficient way to execute Wasm code outside of web browsers.
   - **Wasmer**: Wasmer is another standalone WebAssembly runtime that supports multiple languages and platforms. It is designed to be fast, secure, and lightweight, making it suitable for embedding into various environments.

4. **Cloud Platforms**:
   - **AWS Lambda**: Amazon Web Services (AWS) Lambda has experimental support for executing WebAssembly modules using the `experimental-wasm-support` feature flag. This allows developers to run Wasm code in serverless functions on the AWS cloud.
   - **Cloudflare Workers**: Cloudflare Workers is a serverless platform that allows developers to run code at the edge of the network. It has experimental support for executing WebAssembly modules, enabling high-performance serverless applications.

5. **Desktop and Mobile Applications**:
   - **Electron**: Electron is a framework for building cross-platform desktop applications using web technologies. With the advent of WebAssembly, developers can leverage Wasm to enhance the performance of their Electron apps.
   - **React Native**: React Native is a popular framework for building mobile applications using JavaScript and React. There are ongoing efforts to integrate WebAssembly support into React Native, which could enable running Wasm code on mobile devices.

These are just a few examples of popular WebAssembly runtimes across different platforms and environments. As WebAssembly adoption continues to grow, we can expect to see support for running Wasm code in an even wider range of environments and scenarios.