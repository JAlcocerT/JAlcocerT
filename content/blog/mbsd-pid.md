---
title: "Controlling: from bikes to humidity"
date: 2026-05-01
draft: false
tags: ["MBSD x 3D Simulation","PID","Control Theory","PySymverse"]
description: 'System Theory, SISO, MIMO...'
url: 'pid-for-bicycle-mbsd-model'
math: true
---

PID

margen de fase

<!-- https://www.youtube.com/watch?v=dFudZiQ5ocY -->

{{< youtube dFudZiQ5ocY >}}



**Intro**

How could I not play by opening and closing windows to see how the temp/humidity that [the PicoW and/or the ESP32 are pusshing via MQTT](https://github.com/JAlcocerT/RPi/tree/main/Z_MicroControllers/dht-webapp)

Yea, that kind of [setup that you do when you are so bored](https://jalcocert.github.io/JAlcocerT/plants-102-and-iot/#current-setup-mqtt-dht22-pgsql).


Then...for some reason, I thought about [calculus](https://jalcocert.github.io/JAlcocerT/calculus-101/) with its [ODE's](https://jalcocert.github.io/JAlcocerT/calculus-101/#ode---ordinary-differential-equations), control theory, the frequency domain and transfer functions...

what?

## System Theory

What you’re describing—the relationship between your sensors, the window motor, and the air inside—is a classic example of **Control Theory**, which is a major branch of **Systems Theory**.


{{< callout type="warning" >}}
You might travel to the world of frequencies and [FFT](https://jalcocert.github.io/JAlcocerT/inline-4-engine-balance/#fast-fourier-transform)
{{< /callout >}}


Here is how the two relate to your greenhouse project:

---

## 1. Systems Theory: The "Big Picture"

Systems theory is the study of how different parts interact to create a whole. In your case, the "System" isn't just the greenhouse; it's an interconnected web:

* **The Environment:** Sun, outside wind, and ambient temperature.
* **The Plant:** The physical structure and the actual biological plants (which breathe and release moisture).
* **The Hardware:** Sensors, motors, and windows.

Systems theory looks at **emergent behavior**. 

For example, if you open the window to lower heat (Temperature System), you accidentally drop the moisture levels (Humidity System).

Systems theory helps you understand that you can't change one knob without affecting the other.


## 2. Control Theory: The "Action"

Control theory is the math and logic used to make that system behave the way you want. It focuses on the **Feedback Loop**.

In your greenhouse, you are building a **Closed-Loop System**:
1.  **Sense:** The sensors measure the current state.
2.  **Compare:** The controller compares the "Actual" to your "Setpoint."
3.  **Compute:** The PID logic decides how much to move the window.
4.  **Actuate:** The motor moves the window.
5.  **Repeat:** The new temperature is sensed, and the loop starts over.

Spot on. If you are only looking at one input (like your temperature sensor) to control one output (the window motor), that is a **SISO** system.

## The Acronyms of Control Theory

Engineers love these four-letter categories to describe how "busy" a system is:

* **SISO (Single-Input Single-Output):** * *Example:* One temp sensor controlling one window. 
    * *Vibe:* Simple, classic PID territory.
* **MISO (Multiple-Input Single-Output):** * *Example:* Using a temp sensor **and** a light sensor to decide how far to open that one window.
* **SIMO (Single-Input Multiple-Output):** * *Example:* One temp sensor tells the system to open the window **and** turn on a fan at the same time.
* **MIMO (Multiple-Input Multiple-Output):** * *Example:* Temp and Humidity sensors controlling windows, fans, and a mister system all at once.
    * *Vibe:* Complex. This is where variables start "fighting" each other.


Bingo. You've hit the "Level 2" of control theory. 

The **Transfer Function** is exactly that: a mathematical bridge that moves you from the **Time Domain** (where things are messy and involve calculus) to the **Frequency Domain** (where things are algebraic and much easier to manipulate).

Here’s why we do that:

## 1. Why Frequency Space? (The Laplace Transform)
In the real world (Time Domain), your greenhouse temperature changes according to an ODE. Solving those usually involves integration, which is a pain. 

By using the **Laplace Transform**, we swap the time variable ($t$) for a complex frequency variable ($s$). 
* **Derivatives** in time become **multiplication** by $s$.
* **Integrals** in time become **division** by $s$.

This turns your "ODE" into a simple fraction, which is your **Transfer Function**, $G(s)$:

$$G(s) = \frac{Y(s)}{U(s)}$$

Where $Y(s)$ is your output (Temp) and $U(s)$ is your input (Window Position).



---

## 2. What the "Frequency" actually tells you
In a greenhouse, "frequency" isn't about radio waves; it’s about **response speed**.
* **Low Frequency:** Slow changes, like the sun moving across the sky over 12 hours. Your PID handles this easily.
* **High Frequency:** Rapid changes, like a sensor "flickering" or a sudden gust of wind. If your controller reacts too fast to these high frequencies, your window motor will jitter and burn out.

By looking at the transfer function in frequency space, you can design a **Filter** to ignore the high-frequency noise and only react to the actual temperature trends.

---

## 3. The "Bode Plot" (The ultimate ODE Diagram)
Since you asked about diagrams earlier, the **Bode Plot** is the king of frequency space diagrams. It shows:
1.  **Magnitude:** How much does the window movement actually affect the temp?
2.  **Phase:** How long is the "lag" between the window opening and the sensor feeling the drop?

If the lag (phase shift) is too big and your "Gain" (magnitude) is too high, the system will start oscillating wildly. This is called **Instability**, and the Bode Plot tells you exactly when it's going to happen.



---

## 4. Bringing it back to your Greenhouse
Even if you never write the $G(s)$ equation, you are "feeling out" the frequency response when you tune your PID:
* If you increase the **Integral (I)** term, you are improving the "Low Frequency" accuracy (making sure the temp hits the target eventually).
* If you increase the **Derivative (D)** term, you are trying to predict "High Frequency" changes (catching the temp before it overshoots).

Do you have a background in math or engineering, or are you just "dangerously curious" because of this project? (It's a great way to learn!)

---

## Why SISO is the "Gold Standard" for Beginners
If you can treat your greenhouse as a **SISO** system, your life becomes much easier. 

Even if you have humidity sensors, many people choose to "ignore" them for the primary control logic and just run a **SISO PID loop** for temperature. They then treat humidity as a **"Safety Override"** (e.g., "If humidity > 90%, open windows regardless of what the temp PID says").

### The "Transfer Function" Concept
In a SISO system, control theorists often look for the **Transfer Function**. This is a mathematical shorthand (usually written as $H(s)$ or $G(s)$) that describes exactly how much the output changes for every unit of change in the input.

$$G(s) = \frac{Output(s)}{Input(s)}$$



Even without the math, you are essentially trying to "find" this relationship by tuning your PID gains. You're asking: *"If I move the window 10%, how many degrees does the temperature drop?"* That ratio is the heart of SISO control.

Are you planning to write the code for this yourself (like on an Arduino or Raspberry Pi), or are you looking at off-the-shelf PID controllers?

---

## 3. The "Black Box" vs. "White Box"
This brings us back to your question about equations:
* **White Box (Model-Based):** You use ODEs because you know exactly how the system works internally. You have equations for the thermal conductivity of the glass and the airflow of the vents.
* **Black Box (Data-Driven):** This is what you are doing with a PID. You don't care about the internal physics equations; you just watch the input (sensor) and the output (window) and adjust the "gains" until it works.

---

## 4. Why this matters for your Greenhouse
Because you are dealing with two variables (Temp and Humidity) but only one primary tool (the Windows), you are entering the world of **MIMO (Multiple-Input Multiple-Output)** control.

If you just use a simple PID for temperature, your humidity might go crazy. Control theory offers a few "hacks" for this without needing hard math:
* **Priority Logic:** "Keep temp at 75°F, UNLESS humidity drops below 40%, then close the windows regardless of temp."
* **Deadbands:** Don't move the windows if the temp is "close enough" (e.g., between 73°F and 77°F). This prevents your motors from wearing out by moving every time a cloud passes by.



Does it feel more manageable to think of it as a "trial and error" tuning process, or are you interested in the logic of how to balance the temperature and humidity specifically?

### Ode Diagrams x Control Theory

ODE diagrams are foundational to **control theory**.

In this field, we aren't just interested in what a system *does*—we want to know how to *change* what it does.

Here is why they are essential and how they are used:

1. Visualizing System Stability

In control theory, the "health" of a system is defined by its stability. We use **Phase Portraits** to see if a system will return to its desired state after a disturbance.

* **Attractors (Sinks):** If the diagram shows all paths spiraling toward a center point, the controller is doing its job; the system is stable.
* **Limit Cycles:** These show up as closed loops, indicating the system is oscillating (like a thermostat constantly clicking on and off).
* **Divergence:** If the arrows point away from the target, the system is unstable and could potentially break or "run away."


2. Modeling Input-Output Relationships

Control theory relies heavily on **Block Diagrams**. Because an ODE describes the relationship between an input (like pressing a gas pedal) and an output (the car's speed), diagrams help map this flow.

* **The Plant:** The actual physical machine (represented by an ODE).
* **The Controller:** The logic we add to the system to correct errors.
* **Feedback Loops:** The diagram shows how the output is measured and fed back to the start to adjust the input. This is the "closed-loop" system that makes modern automation possible.


3. Simplified Analysis (The Transfer Function)

Instead of dealing with messy calculus, control engineers often transform ODEs into the **Laplace Domain**. This turns differential equations into algebraic ones.

* **Pole-Zero Plots:** This is a specific type of ODE diagram where we plot the "roots" of the equation on a complex plane. 
* **The Rule of Thumb:** If any "poles" (marks on the diagram) are on the right side of the vertical axis, the system is unstable. This allows engineers to see at a glance if a design is safe without running a single simulation.

Why use a diagram instead of just the math?

1.  **Intuition:** It’s easier to see a "loop" or a "spiral" than to interpret a string of exponential and trigonometric functions.
2.  **Communication:** In engineering teams, a block diagram serves as a universal language between software, mechanical, and electrical engineers.
3.  **Synthesis:** Diagrams allow you to "stack" systems. If you know the diagram for a motor and the diagram for a gear, you can literally snap them together to see the ODE of the entire machine.



## PID x DHT Sensors


![DHT Webapp](https://raw.githubusercontent.com/JAlcocerT/RPi/main/Z_MicroControllers/dht-webapp/dht-webapp.png)


The short answer is: **You can absolutely use PID logic without writing a single formal equation.**

In fact, this is how most industrial and hobbyist greenhouse systems work. You don't need to be a mathematician to build a great controller, but it helps to understand why the PID works even when the math is "hidden."

1. Why you don't need equations (The PID way)

A PID controller is designed to be a "black box" controller. It doesn't care *why* the temperature is dropping; it only cares about the **Error** (the difference between your target temperature and the current sensor reading).

* **Proportional (P):** "How far away am I?" If it's 10 degrees too hot, open the windows wide. If it's only 1 degree too hot, just crack them open.
* **Integral (I):** "How long have I been wrong?" If the windows have been open for 10 minutes and the temp hasn't budged, this term kicks in to push them open even further.
* **Derivative (D):** "How fast is it changing?" If the temp is dropping incredibly fast (maybe a cold gust of wind), the D-term will start closing the windows early to prevent "overshooting" and making the greenhouse too cold.

2. When equations *would* be used

Engineers use ODE equations when they want to **simulate** the greenhouse on a computer before actually building it.

This is called "Model-Based Design." You would use equations if you wanted to:

* Predict how much heat you'll lose through the glass at night.
* Calculate the exact cubic meters of air moved by the windows.
* Find the "perfect" PID settings without trial and error.

3. The "Heuristic" (Trial and Error) Approach

Since you aren't using equations, you will use a process called **Tuning**. 

This is where you adjust the three "Gains" ($K_p$, $K_i$, $K_d$) based on how the greenhouse reacts in real life.

The basic tuning workflow:

1.  **Set all to zero.**
2.  **Increase $K_p$** until the windows react strongly to a temp change but don't "hunt" (swing open and shut constantly).
3.  **Increase $K_i$** slowly to make sure the temperature eventually hits the *exact* setpoint.
4.  **Add a tiny bit of $K_d$** only if the windows are moving too aggressively or "chattering."


4. A Word of Caution: Nonlinearity

Greenhouses are tricky because opening a window 10% when it's 20°C outside has a much different effect than opening it 10% when it's -5°C outside. 

Because you aren't using equations to account for the outside weather, your PID might be "perfect" for a spring day but "bad" for a winter night.

This is why many greenhouse controllers use **Gain Scheduling**—basically having one "gentle" PID setting for winter and a "strong" one for summer.



Which sensor are you prioritizing?

In a greenhouse, temperature and humidity are "coupled" (opening a window drops temp *and* usually drops humidity). If you try to run two separate PIDs—one for temp and one for humidity—using the same windows, they might "fight" each other. 

Are you planning to control them both with just the top windows, or do you have a mister/humidifier as well?

### Feedforward vsSimpe Feedback Controllers

You have just described the jump from a **Simple Feedback Controller** to **Feedforward Control**.

In a standard PID loop (Feedback), the controller is "reactive." It waits for the humidity to change, realizes there is an error, and then moves the window. The problem? By the time the sensor sees the spike, your plants are already damp.

By measuring the outside temperature and humidity, you are adding "Intelligence" to the system so it can anticipate trouble before it happens.

---

## 1. Feedforward Control: The "Look Ahead"
In control theory, **Feedforward** is an open-loop path that adjusts the output based on a **disturbance** (like the outside weather) before that disturbance actually hits your inside sensors.

* **The Logic:** If it’s 95% humidity outside and you open the window to cool the greenhouse, the inside humidity will spike instantly. 
* **The Math:** Your controller says: `Output = PID_Calculation(Inside) + Offset_Calculation(Outside)`.
* **The Benefit:** It "pre-positions" the window. If the outside air is bone-dry, the controller knows it only needs to crack the window to drop the humidity. If the outside air is muggy, it knows it needs to open the window much wider (or not at all).



---

## 2. Dealing with "Coupled" Variables
The reason a "seasonal setup" is usually a bad idea is exactly what you suspect: **The physics change.** In the winter, a 1-inch gap in the window might drop the humidity by 20% in one minute because the cold air is so dry. In the summer, that same 1-inch gap might do nothing. This is known as a change in **System Gain**.

Instead of a seasonal switch, you can use your sensors to calculate the **Delta ($\Delta$)**:
* **$\Delta$ Temperature:** (Inside Temp - Outside Temp)
* **$\Delta$ Humidity:** (Inside Humidity - Outside Humidity)

You can use these deltas to "scale" your PID. If the Delta is huge, you turn the PID "Gain" ($K_p$) down so the window doesn't move too aggressively. If the Delta is small, you turn the Gain up so the window moves more to get the same effect.

---

## 3. The "Psychrometric" Logic

If you want to be a real Greenhouse Pro, you don't just measure temperature and humidity—you calculate the **Vapor Pressure Deficit (VPD)**. 

Humidity alone is a bit of a "liar" because 80% humidity at 60°F feels very different to a plant than 80% humidity at 90°F.

VPD tells you exactly how much "drying power" the air has.

* **SISO with a Twist:** Your "Input" to the PID isn't % Humidity; it's the calculated VPD value. 

* **The Result:** Your windows will move to maintain the perfect evaporation rate for the plants, automatically accounting for the relationship between heat and moisture.

---

## 4. Should you do it?

**Yes.** Measuring the outside "State" makes your system significantly more stable. It prevents the "Hunting" behavior where the windows swing open and shut because the controller was surprised by how cold or dry the outside air was.

**In Python or C++, this is easy:**

Instead of a fixed $K_p$, you just make $K_p$ a variable:
`Kp = base_gain * (inside_temp - outside_temp)`

This makes your controller **Adaptive**.

It learns to be gentle when the "Force" of the outside air is high and aggressive when the outside air is stagnant.


## Controlling a Bike


From the improvement list of my bike simulator:

```sh
#git clone
cd mbsd/bike-real-time-simulator

```


8. Scenario / Trajectory Following

Add a simple PD controller that steers the bicycle to follow a predefined path (e.g. a circle, a figure-8, a slalom). 

This makes the simulator useful for studying bicycle dynamics without requiring a human operator, and enables automated parameter sweeps.


---

## Conclusions

Who could have guessed that in the end of the day reality matters more than models and fine tunings beats equations.

Boooom.


{{< cards >}}
  {{< card link="https://consulting.jalcocertech.com" title="Consulting Services" image="/blog_img/entrepre/consulting.png" subtitle="Consulting - Tier of Service" >}}
  {{< card link="https://ebooks.jalcocertech.com" title="DIY via ebooks" image="/blog_img/entrepre/ebooks.png" subtitle="Distilled knowledge via web/ooks with free value." >}}
{{< /cards >}}

---

## FAQ

### How does a PID look like?

In theory, a PID can be thought of as a **mathematical processor** that sits between your sensors and your actuators. 

In practice, it can take several physical forms depending on how high-tech you want to go.


1. What a PID "Looks Like" Mathematically

If you looked inside the "brain" of a PID controller, you would see three parallel paths.

Each path takes the **Error signal** ($e(t) = \text{Setpoint} - \text{Measured Value}$) and does something different to it:

* **The P-Branch:** Multiplies the error by a constant ($K_p$). It is the "Direct Action."
* **The I-Branch:** Integrates the error over time ($K_i \int e(t) dt$). It is the "Memory."
* **The D-Branch:** Calculates the rate of change of the error ($K_d \frac{de}{dt}$). It is the "Prediction."

They are then summed together to create the **Control Signal ($u(t)$)**.

2. What a PID "Looks Like" Physically

You are correct—it is an electronic device, but it comes in three main flavors:

A. The "Black Box" Industrial Controller (Hardware)

If you buy an "Off-the-shelf PID Controller," it looks like a small plastic box with a digital screen that mounts on a panel. 
* **Inputs:** Terminals for your thermocouple (temp sensor) or humidity probe.
* **Outputs:** A relay or a 4-20mA signal that tells your window motor to move.
* **Logic:** The PID math is hardcoded into a microchip inside. You just "tune" it using buttons on the front.

B. The Microcontroller (Software/Firmware)

This is likely what you would use for a DIY greenhouse. 

You use a **Raspberry Pi, Arduino, or ESP32**.

* **The Device:** A small circuit board.
* **The Logic:** You write a few lines of code (or use a library) that runs the PID equation hundreds of times per second. 
* **Signals:** The sensor sends a voltage to the board; the board sends a PWM (Pulse Width Modulation) signal to the motor driver.

C. The Analog Circuit (Pure Electronics)

In the old days (before microchips were cheap), a PID was built using **Op-Amps (Operational Amplifiers)**, resistors, and capacitors.

* **Proportional:** Resistors set the gain.
* **Integral:** A capacitor stores charge over time (doing the "math" of integration physically).
* **Derivative:** A capacitor and resistor measure the "rush" of current (doing the math of differentiation).

3. The Signal Flow

Whether it's a software loop or a physical box, the signal flow is always:

1.  **Input:** Low-voltage signal from the sensor (e.g., 0V to 5V).
2.  **Processing:** The PID logic calculates the "Correction."
3.  **Output:** A control signal (often 0V to 10V or a digital signal).
4.  **Power Stage:** Since a microchip can't move a heavy window, the output signal goes to a **Motor Driver** or **Relay**, which provides the high-voltage "muscle" to move the window.

#### PID Examples

You’ve nailed it. A microcontroller itself is just the "brain" (the hardware), but when you load **PID logic** onto it, it becomes a **PID Controller**. 

In modern engineering, we rarely build separate physical boxes for every task; we just run dozens of "PID loops" simultaneously inside the car's or drone's main computer.

---

## 1. The Drone: A High-Speed PID Balancing Act
A drone is the ultimate example of PID in action because a quadcopter is **inherently unstable**. If the computer stops calculating for even a second, it falls like a stone.

* **The Sensors:** Gyroscopes and Accelerometers (measuring tilt angle).
* **The Logic:**
    * **P (Proportional):** "I’m tilted 10 degrees left; spin the left motors faster!"
    * **I (Integral):** "I’ve been drifting left for 2 seconds; I need to push even harder to centered."
    * **D (Derivative):** "I’m moving back to center very fast; slow down the motor thrust now so I don't over-tilt to the right."
* **The Output:** Pulse Width Modulation (PWM) signals to the four Electronic Speed Controllers (ESCs) that drive the motors.



---

## 2. The Car: Fuel Injection and Cruise Control
Modern cars are essentially a network of dozens of PID loops talking to each other.

* **Fuel Injection (Lambda Control):** The car has an Oxygen sensor in the exhaust. If it senses too much oxygen (lean), the PID tells the fuel injectors to stay open a few milliseconds longer.
* **Idle Control:** When you turn on the A/C, it puts a load on the engine. The RPM drops. A PID loop senses the drop and opens the throttle plate just a tiny bit to keep the engine from stalling.
* **Cruise Control:** This is a classic **SISO** PID. 
    * **Input:** Speedometer.
    * **Output:** Electronic Throttle.
    * **The Math:** If you hit a hill and your speed drops, the "P" term opens the gas. As you crest the hill, the "D" term sees the speed increasing and backs off the gas before you go over the speed limit.



---

## 3. The "Loop" is the Key
The reason we call it a **PID Loop** is that the code usually looks something like this inside the microcontroller:

```python
while True:
    error = setpoint - sensor_reading
    
    # The PID Math
    P = Kp * error
    I = I + (Ki * error)
    D = Kd * (error - last_error)
    
    output = P + I + D
    
    send_to_motor(output)
    last_error = error
    sleep(0.01) # Run 100 times per second
```

---

## 4. Why Use a Microcontroller for Your Greenhouse?

For your greenhouse, using a microcontroller (like an ESP32 or Arduino) is better than a "dumb" mechanical thermostat because:

1.  **Precision:** You can hold the temperature within 0.1 degrees.
2.  **Logging:** You can send the data to your phone or a database to see a "history graph" of your greenhouse.
3.  **Complex Logic:** You can tell the windows to "Close if it starts raining" (using a rain sensor) or "Close if it's too windy" (using an anemometer), which a simple PID box can't do.

### One Final Thought on "Stability"

In a drone, the PID loop runs **4,000 times per second** because things change fast. In your greenhouse, the temperature changes slowly, so your PID loop might only need to run **once every 10 seconds**. 

If you run a greenhouse PID too fast, you'll wear out your window motors because they'll try to react to every tiny "flicker" in the sensor data!

Does the idea of "tuning" the speed of the loop make sense for your specific project?

### References

1. Okata