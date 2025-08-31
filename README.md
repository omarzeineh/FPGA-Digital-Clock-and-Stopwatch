# FPGA Digital Clock and Stopwatch ⏱️

This repository contains a **fully hand-designed digital clock with stopwatch** built entirely in **VHDL**.  
Every module – counters, comparators, debouncers, binary-to-BCD converters, and BCD-to-seven-segment drivers – was written manually without using vendor IP cores or prebuilt blocks.  

The project demonstrates the **power of FPGA-based design** for real-time digital systems and the importance of understanding **low-level hardware description**.

---

## 📖 Project Overview

The system was developed as part of a **CEN466 course project** and tested on the **Cyclone V FPGA**.  
Its purpose is to design a **precise and scalable digital clock with stopwatch functionality**, highlighting FPGA advantages over traditional microcontroller solutions.

- **Digital Clock**: Displays hours, minutes, and seconds.  
- **Stopwatch**: Tracks seconds and hundredths of seconds independently.  
- **Manual Increment**: Buttons to set time manually.  
- **Debouncing**: Filters noisy switch signals.  
- **Mode Selection**: Choose between clock or stopwatch display.  
- **Display Output**: Uses 7-segment displays for real-time visibility.  

---

## ✨ Key Features

- Hand-written VHDL modules – no IP cores.  
- Accurate **real-time digital clock**.  
- Independent **stopwatch system**.  
- **Push-button interface** for start, stop, reset, and manual time adjustment.  
- **Switch-based mode selection** for flexible display control.  
- **Reliable debouncing** for mechanical button noise.  
- Human-readable output on **7-segment displays**.  

---

## 📂 Repository Structure

- `accu.vhd` – Accumulator/counter module.  
- `comparator.vhd` – Comparator for overflow detection.  
- `debouncer.vhd` – Debounce logic for buttons.  
- `binaryToBCD.vhd` – Binary to BCD conversion logic.  
- `bcdtoseven.vhd` – BCD to 7-segment display driver.  
- `ADSD.vhd` – Top-level design integrating all modules.  

---

## 🔧 Design Philosophy

### Hand-Designed Approach
The most important aspect of this project is that **everything was designed by hand**.  
Instead of relying on prebuilt libraries or IP blocks, each part of the system was written from scratch.  

This gave us:
- Full **control over hardware behavior**.  
- A truly **modular design** that can be extended easily.  
- A deeper **understanding of FPGA resource usage and timing**.  

### Modular Blocks
- **Accumulators** → act as counters for seconds, minutes, hours, and stopwatch ticks.  
- **Comparators** → detect limits (like 59 seconds) and trigger resets.  
- **Debouncers** → ensure clean button inputs.  
- **Converters** → handle binary to BCD, then BCD to 7-segment.  
- **Top-level integration** → connects everything into a real-time system.  

---

## 🖥️ Hardware Setup

- **FPGA Board**: Cyclone V (5CGXFC5C6F27C7N).  
- **Inputs**:  
  - Push buttons → Start, Stop, Reset, Increment.  
  - Switches → Select between display modes.  
- **Outputs**:  
  - Four multiplexed **7-segment displays**.  
- **Software**: Quartus II for synthesis and programming.  

---

## 🧪 Testing and Results

### ✅ Digital Clock
- Accurately counted seconds, minutes, and hours.  
- Switch toggled between viewing seconds/minutes or minutes/hours.  

### ✅ Stopwatch
- Start/stop with a button.  
- Reset with another button.  
- Runs independently of the clock (both active at once).  

### ✅ Manual Increment
- Buttons increment minutes or hours.  
- Makes it easier to set the clock quickly.  

All tests showed **stable, reliable performance** without missed counts or glitches.  

---

## 📊 Lessons Learned

- **Low-level design control** is invaluable.  
- **Debouncing** is essential to avoid false triggers.  
- **Resource efficiency** matters when scaling FPGA designs.  
- Trial and error during synchronization taught **precision and patience**.  

---

## 🚀 Future Improvements

- Add an **alarm system**.  
- Support both **12-hour and 24-hour formats**.  
- Integrate an **RTC module** for long-term accuracy.  
- Replace 7-segment with **LCD or OLED displays**.  
- Add **multiple stopwatch laps/splits**.  

---

## 🎥 Demonstration

👉 [YouTube Demo](https://youtu.be/nZoi-eKxg-M?si=f2RKiwQOzfBC69HJ)


